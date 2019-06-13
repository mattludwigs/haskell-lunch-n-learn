module Main where

import System.IO

type Name = String
type Email = String

data User = User
  { name :: Name
  , email :: Email
  } deriving (Show)

main = do
  hSetBuffering stdout NoBuffering

  putStrLn "Register:"

  name <- getInput "Name: "
  email <- getInput "Email: "

  let user = User name email

  if validateUser user then
    putStrLn ("Thanks for signing up " ++ name)
  else
    putStrLn "Wrong!"

getInput prompt = do
  putStr prompt
  getLine

validateUser user =
  case validateName (name user) of
    True ->
      case validateEmail (email user) of
        True -> True
        False -> False

validateName :: Name -> Bool
validateName name =
  length name >= 1

validateEmail email = 
  length email >= 2

 
