defmodule Mix.Tasks.Frankenstein do
  use Mix.Task
  import WordFrequencyFinder

  def run(amount_to_print) do
    run_frequency_search(load_file("frankenstein.txt"), load_file("stop_words.txt"), isolate_input(amount_to_print))
  end

  def load_file(file) do
    File.read!(file)
  end

  def isolate_input(input) do
    elem(Integer.parse(Enum.at(input, 0)), 0)
  end

end
