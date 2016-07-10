{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Exception (bracket)
import Control.Concurrent (runInUnboundThread)
import Hasql.Connection (settings)
import Hasql.Pool (Pool, acquire, release)
import Network.Wai.Handler.Warp (run)
import WarpBench

pgSettings = settings "localhost" 5432 "postgres" "" "server_benchmarks"

poolSettings = (8,1,pgSettings)

main :: IO ()
main = 
  runInUnboundThread $
  bracket (acquire poolSettings)
          release
          (\pool -> run 3000 (app pool))

