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

  test "sorts words in order from highest to lowest frequency" do
    unsorted_word_freq_list = [{"hello", 1}, {"how", 4}, {"many", 2}]
    assert WordFrequencyFinder.sort_in_order_of_frequency(unsorted_word_freq_list) == [{"how", 4}, {"many", 2}, {"hello", 1}]
  end

  test "prints top amount of words" do
    sorted_word_freq_list = [{"how", 4}, {"many", 2}, {"hello", 1}]
    assert capture_io(fn ->
      WordFrequencyFinder.print_top_words(sorted_word_freq_list)
    end) == "how: 4\nmany: 2\nhello: 1\n"
  end

  test "given large text, stop_words and top_amount, prints final output" do
    input_text = "There was a dragon dragon dragon dragon in a castle made of gold gold gold."
    stop_words = "a, there, was, in, who, of"
    assert capture_io(fn ->
      WordFrequencyFinder.run_frequency_search(input_text, stop_words, 20)
    end) == "dragon: 4\ngold: 3\nmade: 1\ncastle: 1\n"
  end

end
