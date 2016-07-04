{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}

module Main (main) where

import Control.Exception
import Control.Monad.IO.Class
import Data.Aeson hiding (json)
import Data.Text hiding (map)
import Data.Int
import Data.Sequence
import Lucid
import GHC.Generics
import Hasql.Connection (settings)
import Hasql.Pool (acquire, release, use)
import Hasql.Query
import Hasql.Session (query)
import Hasql.Decoders (rowsList, value, text, int4)
import Hasql.Encoders (unit)
import Network.Wai (responseLBS, rawPathInfo, Application)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200, status404)
import Network.HTTP.Types.Header (hContentType)

pgSettings = settings host port user passwd db
host = "localhost"
port = 5432
user = "postgres"
passwd = ""
db = "server_benchmarks"
poolSettings = (8, 1, pgSettings)

data Fortune = Fortune { mid :: !Int32 , msg :: Text }
  deriving (Show, Generic)

instance ToJSON Fortune where
  toEncoding = genericToEncoding defaultOptions

main = do
  bracket (acquire poolSettings) release $ \pool->
    run 3000 (app pool)

app pool req respond = case rawPathInfo req of
  "/hello" -> respond $ responseLBS status200 [(hContentType, "text/plain")] "Hello world!"
  "/fortunes" -> fortunesHTML respond pool
  "/fortunes.json" -> fortunesJSON respond pool
  _ -> respond $ responseLBS status404 [] ""

fortuneQuery :: Query () [Fortune]
fortuneQuery = statement q encoder decoder True
  where
   q = "SELECT * FROM fortunes"
   encoder = unit
   decoder = rowsList $ Fortune <$> value int4 <*> value text

fortunesHTML respond pool = do
  (Right messages) <- liftIO $ use pool (query () fortuneQuery)
  respond $ responseLBS status200 [(hContentType, "text/html")] (constructResp messages)
  where
    constructResp messages = renderBS $ doctypehtml_ $
      do
        head_ (title_ "Fortune Cookie Messages")
        body_ (table_ (do mapM extract messages))
    extract fortune = tr_ (do td_ (toHtml (show (mid fortune)))
                              td_ (toHtml (msg fortune))) :: Html()

fortunesJSON respond pool = do
  (Right messages) <- liftIO $ use pool (query () fortuneQuery)
  respond $ responseLBS status200 [(hContentType, "application/json")]
    (encode (fromList messages))
