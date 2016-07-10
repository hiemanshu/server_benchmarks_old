{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveAnyClass #-}

module Main where

import Criterion.Main
import Data.Aeson
import Data.Either
import Data.Either.Combinators
import GHC.Generics (Generic)
import Control.DeepSeq
import Hasql.Connection (settings)
import Hasql.Pool
import Hasql.Session (query)
import WarpBench
import Weigh

pgSettings = settings "localhost" 5432 "postgres" "" "server_benchmarks"

ps = (8,1,pgSettings)

deriving instance NFData Fortune

instance NFData Pool where
  rnf x = seq x ()

instance NFData UsageError where
  rnf x = deepseq x ()

fetchFortunes pool = use pool (query () fortuneQuery)
                     >>= return . fromRight'

fortunes = acquire ps >>= fetchFortunes

main :: IO ()
main = 
  defaultMain 
    [env (acquire ps)
         (\pool -> 
            bench "Fortunes Query" $
            nfIO (do forts <- fetchFortunes pool
                     return (deepseq forts ())))
    ,env (fortunes)
         (\xs -> bench "Template Construction" $ nf present xs)
    ,env (fortunes)
         (\xs -> bench "JSON encoding" $ nf encode xs)]

integers = func "sum" sum ([1 .. 100000 :: Int])
