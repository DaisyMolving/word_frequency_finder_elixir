defmodule WordFrequencyFinderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFrequencyFinder

  test "splits every instance of a word in a list, not including punctuation" do
    assert WordFrequencyFinder.split_words("hello hello there, how many are there?") ==  ["hello", "hello", "there", "how", "many", "are", "there"] 
  end

  test "tallies the words in a map, counting their instances" do
    assert WordFrequencyFinder.tally_words(["hello", "hello", "there", "how", "many", "are", "there"]) == %{"hello"=> 2, "there" => 2, "how" => 1, "many" => 1, "are" => 1}
  end

end
