defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna_rna = %{'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U',}
    # [n] was tricky to understand. But it makes sense.
    Enum.concat(
      Enum.map(dna, fn (n) -> Map.get(dna_rna, [n]) end)
    )
  end
end
