defmodule WordFrequencyFinder do

  def split_words(text) do
    String.split(text, ~r/(\W+)/, trim: true)
  end

end
