module Tests where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (..)

import Childwork exposing (..)
import Html

all : Test
all =
  suite "" [
    test "" test_one
  ]

test_one =
  assertEqual "foo" "foo"
