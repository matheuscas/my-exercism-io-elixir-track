defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase()
      |> String.split(["_",",",":","!","&","@","$","^","%"," "])
      |> Enum.filter(&(String.length(&1) > 0))
      |> Enum.frequencies()
  end
end
