defmodule Bob do

  @numbers  ~w/1 2 3 4 5 6 7 8 9 0/
  @punctuation  ~w/: ) ,/

  @spec hey(binary) :: <<_::40, _::_*8>>
  def hey(input) do
    input = input
      |> String.graphemes
      |> Enum.filter(fn n -> n not in @punctuation end)
      |> Enum.join
      |> String.trim

    uppercase? = String.upcase(input) == input
    ends_with? = String.ends_with?(input, "?") == true
    single_str? = String.length(input) == 1
    ends_with! = String.ends_with?(input, "!") == true
    empty? = String.length(input) == 0
    only_numbers = fn term -> String.split(term) |> Enum.all?(fn n -> n in @numbers end) end
    only_numbers_and_ends_with? = String.split(input,"?",trim: true) |> Enum.all?(fn n -> n in @numbers end)

    cond do
      empty? -> "Fine. Be that way!"
      only_numbers.(input) -> "Whatever."
      ends_with? and (single_str? or not uppercase?) or only_numbers_and_ends_with? -> "Sure."
      ends_with? and only_numbers.(input) == true -> "Calm down, I know what I'm doing!"
      ends_with? and uppercase? -> "Calm down, I know what I'm doing!"
      ends_with! and not uppercase? -> "Whatever."
      ends_with! or (not ends_with! and uppercase?) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
