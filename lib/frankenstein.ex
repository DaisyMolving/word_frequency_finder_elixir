defmodule Mix.Tasks.Frankenstein do
  use Mix.Task
  import WordFrequencyFinder

  def run(_args) do
    run_frequency_search(load_file("frankenstein.txt"), load_file("stop_words.txt"))
  end

  def load_file(file) do
    File.read!(file)
  end

end
