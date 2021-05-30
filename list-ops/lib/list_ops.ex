defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  def count([]), do: 0

  @spec count(list) :: non_neg_integer
  def count([head | tail]) do
    n = count(tail) + 1
  end

  def reverse([], _), do: []

  @spec reverse(list) :: list
  def reverse([head | tail], prev \\ []) do
#    [head | tail] = l
#    prev = [ head | prev ]
#
#    [head | tail] = tail
#    prev = [ head | prev ]
#
#    [head | tail] = tail
#    prev = [ head | prev ]
#
#    [head | tail] = tail
#    prev = [ head | prev ]

#    [head | tail] = tail
#    prev = [head | prev]
  end

  def map([], _), do: []

  @spec map(list, (any -> any)) :: list
  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end


  def filter([], _), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail], f) do
    result = f.(head)
    if result == true do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  def reduce([], acc, _), do: acc

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([head | tail], acc, f) do
    acc = f.(head, acc)
    reduce(tail, acc, f)
  end

  def append([], []), do: []
  def append([], b), do: b
  def append(a, []), do: a

  @spec append(list, list) :: list
  def append([head | tail], b) do
    append(tail, [head | b])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end