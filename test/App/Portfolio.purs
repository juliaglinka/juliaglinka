module Test.App.Portfolio where

import Prelude
import App.Portfolio (galleryImages, nextImageIndex, prevImageIndex, determineSwipe, SwipeDirection(..), swipeThreshold)
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

  describe "swipe" do
    it "detects swipe left when diff > threshold" do
      determineSwipe 100.0 0.0 `shouldEqual` SwipeLeft

    it "detects swipe right when diff < -threshold" do
      determineSwipe 0.0 100.0 `shouldEqual` SwipeRight

    it "returns NoSwipe when diff equals threshold" do
      determineSwipe 100.0 50.0 `shouldEqual` NoSwipe

    it "returns NoSwipe when diff equals negative threshold" do
      determineSwipe 50.0 100.0 `shouldEqual` NoSwipe

    it "returns NoSwipe for small movements" do
      determineSwipe 100.0 90.0 `shouldEqual` NoSwipe

    it "swipeThreshold is 50" do
      swipeThreshold `shouldEqual` 50.0
