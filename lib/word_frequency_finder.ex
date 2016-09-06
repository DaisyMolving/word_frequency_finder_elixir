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
    select_most_frequent(Map.to_list(words_with_frequency))
  end

  def select_most_frequent([]), do: 0
  def select_most_frequent(words_with_frequency) do
    most_frequent_word = words_with_frequency
    |> Enum.max_by(fn{_, frequency} ->
      frequency
    end)
    {word, highest_frequency} = most_frequent_word
    IO.puts "#{word}: #{highest_frequency}"
    select_most_frequent(List.delete(words_with_frequency, most_frequent_word))
  end

end
