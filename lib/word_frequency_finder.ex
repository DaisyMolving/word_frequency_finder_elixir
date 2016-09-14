defmodule WordFrequencyFinder do

  def run_frequency_search(text, stop_words, amount_to_print) do
    split_words(text) 
    |> remove_stop_words(split_words(stop_words))
    |> tally_words
    |> Map.to_list
    |> sort_in_order_of_frequency
    |> Enum.take(amount_to_print)
    |> print_top_words
  end

  def split_words(text) do
    String.split(text, ~r/(\W+)/, trim: true) 
    |> Enum.map(fn(word) ->
      String.downcase(word)
    end)
  end

  def remove_stop_words(word_list, stop_words) do
    Enum.filter(word_list, fn(word) -> 
     Enum.member?(stop_words, word) == false
    end)
  end

  def tally_words(word_list) do
    tally_words(%{}, word_list)
  end

  def tally_words(words_with_frequency, []), do: words_with_frequency
  def tally_words(words_with_frequency, [word | next_words]) do
    Map.update(words_with_frequency, word, 1, &(&1 + 1))
    |> tally_words(next_words)
  end

  def sort_in_order_of_frequency(words_with_frequency) do
    words_with_frequency 
    |> Enum.sort(fn({_, frequency_1}, {_, frequency_2}) -> frequency_1 > frequency_2 end)
  end

  def print_top_words([]), do: ""
  def print_top_words([{word, frequency} | next_word_and_frequency]) do
    IO.puts "#{word}: #{frequency}"
    print_top_words(next_word_and_frequency)
  end

end
