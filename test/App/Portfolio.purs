module Test.App.Portfolio where

import Prelude
import App.Portfolio (galleryImages, nextImageIndex, prevImageIndex)
import Data.Array (length)
import Test.Spec (describe, it, Spec)
import Test.Spec.Assertions (shouldEqual)

spec :: Spec Unit
spec = describe "App.Portfolio" do
  describe "galleryImages" do
    it "should have 9 images" do
      length galleryImages `shouldEqual` 9

  describe "navigation" do
    it "nextImageIndex wraps around at the end" do
      nextImageIndex 8 9 `shouldEqual` 0
      nextImageIndex 0 9 `shouldEqual` 1

    it "prevImageIndex wraps around at the start" do
      prevImageIndex 0 9 `shouldEqual` 8
      prevImageIndex 1 9 `shouldEqual` 0

    it "nextImageIndex and prevImageIndex are inverses" do
      nextImageIndex (prevImageIndex 3 9) 9 `shouldEqual` 3
      prevImageIndex (nextImageIndex 5 9) 9 `shouldEqual` 5
