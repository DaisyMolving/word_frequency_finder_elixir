defmodule WordFrequencyFinder do

  def split_words(text) do
    String.split(text, ~r/(\W+)/, trim: true)
  end

  def tally_words(word_list) do
    tally_words(%{}, word_list)
  end

  def tally_words(words_with_frequency, []), do: words_with_frequency
  def tally_words(words_with_frequency, [word | next_words]) do
    Map.update(words_with_frequency, word, 1, &(&1 + 1))
    |> tally_words(next_words)
  end

  def sort_by_most_frequent(words_with_frequency) do
    print_in_order_of_frequency(Map.to_list(words_with_frequency))
  end

  def print_in_order_of_frequency([]), do: 0
  def print_in_order_of_frequency(words_with_frequency) do
    words_with_frequency
    |> select_most_frequent_word
    |> print_most_frequent_word
    words_with_frequency
    |> remove_most_frequent_word
    |> print_in_order_of_frequency
  end

  def remove_most_frequent_word(words_with_frequency) do
    List.delete(words_with_frequency, select_most_frequent_word(words_with_frequency))
  end

  def select_most_frequent_word(words_with_frequency) do
    words_with_frequency
    |> Enum.max_by(fn{_, frequency} -> frequency end)
  end

  defp print_most_frequent_word({word, frequency}) do
    IO.puts "#{word}: #{frequency}"
  end
end
