{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Text
import Data.Time
import Lib

main :: IO ()
main = do
  a <- getTodaysDate
  b <- decrypt a a
  print b

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
