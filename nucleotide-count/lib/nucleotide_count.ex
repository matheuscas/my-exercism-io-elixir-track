defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  def count('', _), do: 0

  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand |> Enum.filter(fn s -> s == nucleotide end) |> Enum.count
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  def histogram(''), do: %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand |> Enum.frequencies |> Map.merge(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn _k, v1, v2 -> v1 end)
  end
end
