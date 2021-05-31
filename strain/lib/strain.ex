defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  def keep([], _), do: []

  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([head | tail], fun) do
    result = fun.(head)
    if result == true do
      [head | keep(tail, fun)]
    else
      keep(tail, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  def discard([], _), do: []

  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([head | tail], fun) do
    result = fun.(head)
    if result == false do
      [head | discard(tail, fun)]
    else
      discard(tail, fun)
    end
  end
end
