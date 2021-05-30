defmodule RomanNumerals do
  @romans %{1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M"}
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number < 4 do
    cond do
      is_nil(@romans[number]) -> numeral(number - 1) <> "I"
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 4 and number < 9 do
    cond do
      is_nil(@romans[number]) and (number - 5) < 0 -> numeral(abs(number - 5)) <> "V"
      is_nil(@romans[number]) and (number - 5) > 0 ->  "V" <> numeral(number - 5)
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 9 and number < 40 do
    cond do
      is_nil(@romans[number]) and (number - 10) < 0 -> numeral(abs(number - 10)) <> "X"
      is_nil(@romans[number]) and (number - 10) > 0 ->  "X" <> numeral(number - 10)
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 40 and number < 90 do
    cond do
      is_nil(@romans[number]) and (number - 50) < 0 -> "XL" <> numeral(abs(number - 40))
      is_nil(@romans[number]) and (number - 50) > 0 ->  "L" <> numeral(number - 50)
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 90 and number < 400 do
    cond do
      is_nil(@romans[number]) and (number - 100) < 0 -> "XC" <> numeral(abs(number - 90))
      is_nil(@romans[number]) and (number - 100) > 0 ->  "C" <> numeral(number - 100)
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 400 and number < 900 do
    cond do
      is_nil(@romans[number]) and (number - 500) < 0 -> "CD" <> numeral(abs(number - 400))
      is_nil(@romans[number]) and (number - 500) > 0 ->  "D" <> numeral(number - 500)
      true -> @romans[number]
    end
  end

  def numeral(number) when number >= 900 do
    cond do
      is_nil(@romans[number]) and (number - 1000) < 0 -> "CM" <> numeral(abs(number - 900))
      is_nil(@romans[number]) and (number - 1000) > 0 ->  "M" <> numeral(number - 1000)
      true -> @romans[number]
    end
  end

end
