defmodule Warehouse do
  def test do
    IO.puts "(2, 2) = 5 #{if(find_id(2, 2) == 5, do: "pass", else: "fail")}"
    IO.puts "(2, 4) = 12 #{if(find_id(2, 4) == 12, do: "pass", else: "fail")}"
    IO.puts "(4, 1) = 10 #{if(find_id(4, 1) == 10, do: "pass", else: "fail")}"
    IO.puts "(4, 2) = 14 #{if(find_id(4, 2) == 14, do: "pass", else: "fail")}"
    IO.puts "(100000, 100000) = 20000000001 #{if(find_id(100000, 100000) === 20000000001, do: "pass", else: "fail")}"
  end


  def run_find_id() do
    list = get_input([])
    iterate_list(list, 0)
  end

  def get_input(inputList) do
    {input, _} = IO.gets("") |> Integer.parse
    returnList = inputList ++ [input]
    unless input === 0 do
      get_input(returnList)
    else
      returnList
    end
  end

  def iterate_list(listOfXYCoords, index) do
    x = Enum.at(listOfXYCoords, index)
    y = Enum.at(listOfXYCoords, index + 1)
    unless((x == nil || x == 0) || (y == nil || y == 0)) do
      IO.puts Integer.to_string(find_id(x, y))
      iterate_list(listOfXYCoords, index + 2)
    end
  end

  def find_id(x, y) do
    xValue = if x === 1, do: 1, else: find_x_value(2, 1, x)
    id = if y === 1, do: xValue, else: find_y_value(2, xValue, x, y)
    id
  end

  def find_x_value(x, previousValue, xIndex) do
      value = previousValue + x
      if x === xIndex, do: value, else: find_x_value(x + 1, value, xIndex)
  end

  def find_y_value(y, previousValue, xIndex, yIndex) do
    yValue = previousValue + xIndex + y - 2
    if y === yIndex, do: yValue, else: find_y_value(y + 1, yValue, xIndex, yIndex)
  end
end
