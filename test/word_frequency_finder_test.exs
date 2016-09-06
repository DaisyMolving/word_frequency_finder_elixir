defmodule WordFrequencyFinderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFrequencyFinder

  test "splits every instance of a word in a list, not including punctuation" do
    assert WordFrequencyFinder.split_words("hello hello there, how many are there?") ==  ["hello", "hello", "there", "how", "many", "are", "there"] 
  end
