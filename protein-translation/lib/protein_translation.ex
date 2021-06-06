defmodule ProteinTranslation do
  @codon_map %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
      translation = rna
      |> String.graphemes
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(fn codon -> Enum.reverse(codon) end)
      |> Enum.map(fn codon -> Enum.reduce(codon, "", fn s, acc -> s <> acc end) end)
      |> Enum.map(fn codon -> @codon_map[codon] end)

      stop_index = Enum.find_index(translation, fn stop -> stop == "STOP" end)
      nil? = Enum.any?(translation, fn item -> item == nil end)

      cond do
        nil? -> {:error, "invalid RNA"}
        stop_index -> {:ok, Enum.take(translation, stop_index)}
        true -> {:ok, translation}
      end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    if Map.has_key?(@codon_map, codon) do
      {:ok, @codon_map[codon]}
    else
      {:error, "invalid codon"}
    end
  end
end
