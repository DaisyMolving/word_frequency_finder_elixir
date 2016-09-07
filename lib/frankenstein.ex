defmodule Mix.Tasks.Frankenstein do
  use Mix.Task
  import WordFrequencyFinder

  def run(_args) do
    run_frequency_search("Once upon a time there was a dragon dragon dragon dragon who guarded a castle made of gold gold gold. He was very very very fearsome", "once, a, there, was, a, who, of he very")
  end

end
