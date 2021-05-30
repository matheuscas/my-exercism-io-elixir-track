defmodule Robot do
  defstruct direction: :north, position: {0,0}
end

defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["R", "L", "A"]

  defguard is_valid_position(x,y) when is_integer(x) and is_integer(y)

  @spec create(any, any) :: {:error, msg: String} | %Robot{direction: any, position: {integer, integer}}
  def create(direction, {x, y}) when is_valid_position(x,y) do
    cond do
      direction not in @valid_directions -> {:error, "invalid direction"}
      true -> %Robot{direction: direction, position: {x, y}}
    end
  end

  def create(_, _) do
    {:error, "invalid position"}
  end

  @spec create :: %Robot{direction: :north, position: {0, 0}}
  def create() do
    %Robot{}
  end

  defp turn(:west, "L") do
    :south
  end
  defp turn(:west, "R") do
    :north
  end

  defp turn(:east, "R") do
    :south
  end
  defp turn(:east, "L") do
    :north
  end

  defp turn(:north,"R") do
    :east
  end
  defp turn(:north,"L") do
    :west
  end

  defp turn(:south, "R") do
    :west
  end
  defp turn(:south, "L") do
    :east
  end

  defp advance(robot) do
    {x, y} = robot.position
    cond do
      robot.direction == :north -> %{robot | position: {x, y + 1}}
      robot.direction == :south -> %{robot | position: {x, y - 1}}
      robot.direction == :east -> %{robot | position: {x + 1, y}}
      robot.direction == :west -> %{robot | position: {x - 1, y}}
    end
  end


  defp move(instruction, robot) do
    if instruction == "L" or instruction == "R" do
      %{robot | direction: turn(robot.direction, instruction)}
    else
      advance(robot)
    end
  end


  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    String.graphemes(instructions) |>
    Enum.reduce_while(robot,
      fn instruction, rbt ->
        if instruction in @valid_instructions, do: {:cont, move(instruction, rbt)}, else: {:halt, {:error, "invalid instruction"}}
      end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(%{:direction => any, optional(any) => any}) :: any
  def direction(%{direction: dir}) do dir end

  @doc """
  Return the robot's position.
  """
  @spec position(%{:position => any, optional(any) => any}) :: any
  def position(%{position: pos}) do pos end
end
