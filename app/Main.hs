{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Map.Internal.Debug as MapDebug
import Data.Text
import Data.Time
import Lib

main :: IO ()
main = do
  let myMap = Map.empty
  a <- getTodaysDate
  let myMap2 = Map.insert "Four" a myMap
  let key = Map.lookup "Four" myMap2
  case key of
    Just w -> do
      print w
      b <- decrypt a w
      print b
    Nothing -> print "fuckk"

decrypt :: Day -> Day -> IO (Maybe Text)
decrypt inDate date
  | inDate == date = do
      print "Date is matching!"
      return (Just "Success")
  | otherwise = do
      return Nothing

encrypt :: Day -> FilePath -> IO ()
encrypt a b = print b

getTodaysDate :: IO Day
getTodaysDate = getZonedTime >>= return . utctDay . zonedTimeToUTC
