defmodule WordFrequencyFinderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFrequencyFinder

  test "splits every instance of a word in a list, not including punctuation" do
    assert WordFrequencyFinder.split_words("Who is it?") ==  ["who", "is", "it"] 
  end

  test "removes ordered stop words from list of split text" do
    assert WordFrequencyFinder.remove_stop_words(["he", "was", "crazy"], ["he", "was"]) == ["crazy"]
  end

  test "removes unordered stop words from list of split text" do
    assert WordFrequencyFinder.remove_stop_words(["girl", "with", "a", "gun"], ["a", "with"]) == ["girl", "gun"]
  end

  test "tallies the words in a map, counting their instances" do
    assert WordFrequencyFinder.tally_words(["hello", "hello", "there"]) == %{"hello"=> 2, "there" => 1}
  end

  test "prints words in order from highest to lowest frequency" do
    assert capture_io(fn ->
      WordFrequencyFinder.print_in_order_of_frequency([{"hello", 1}, {"how", 4}, {"many", 2}])
    end) == "how: 4\nmany: 2\nhello: 1\n"
  end

  test "given large text and stop_words, prints final output" do
    input_text = "There was a dragon dragon dragon dragon in a castle made of gold gold gold."
    stop_words = "a, there, was, in, who, of"
    assert capture_io(fn ->
      WordFrequencyFinder.run_frequency_search(input_text, stop_words)
    end) == "dragon: 4\ngold: 3\ncastle: 1\nmade: 1\n"
  end

end
