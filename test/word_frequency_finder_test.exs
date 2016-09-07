defmodule WordFrequencyFinderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFrequencyFinder

  test "splits every instance of a word in a list, not including punctuation" do
    assert WordFrequencyFinder.split_words("hello hello there, how many are there?") ==  ["hello", "hello", "there", "how", "many", "are", "there"] 
  end

  test "removes ordered stop words from list of split text" do
    assert WordFrequencyFinder.remove_stop_words(["she", "said", "he", "was", "crazy"], ["she", "said", "he", "was"]) == ["crazy"]
  end

  test "removes unordered stop words from list of split text" do
    assert WordFrequencyFinder.remove_stop_words(["a", "girl", "went", "out", "the", "door", "with", "a", "gun"], ["the", "went", "with", "a"]) == ["girl", "out", "door", "gun"]
  end

  test "tallies the words in a map, counting their instances" do
    assert WordFrequencyFinder.tally_words(["hello", "hello", "there", "how", "many", "are", "there"]) == %{"hello"=> 2, "there" => 2, "how" => 1, "many" => 1, "are" => 1}
  end

  test "prints words in order from highest to lowest frequency" do
    assert capture_io(fn ->
      WordFrequencyFinder.sort_by_most_frequent(%{"hello"=> 1, "there" => 1, "how" => 4, "many" => 2, "are" => 1})
    end) == "how: 4\nmany: 2\nare: 1\nhello: 1\nthere: 1\n"
  end

  test "given large text and stop_words, prints final output" do
    assert capture_io(fn ->
      WordFrequencyFinder.start_frequency_search("Once upon a time there was a dragon dragon dragon dragon who guarded a castle made of gold gold gold. He was very fearsome.", "once, a, there, was, a, who, of, he, very")
    end) == "dragon: 4\ngold: 3\ncastle: 1\nfearsome: 1\nguarded: 1\nmade: 1\ntime: 1\nupon: 1\n"
  end

end
