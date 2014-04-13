defmodule ToDone.File do
  use ExActor.GenServer

  definit(filepath) do
    todo_list = filepath
                |> File.stream!
                |> Enum.filter_map(&todo?/1, &parse/1)
    initial_state({filepath, todo_list})
  end

  defcall todos, state: state do
    reply(state)
  end

  def todo?(code_string) do
    code_string
    |> String.upcase
    |> String.contains? "TODO:"
  end

  def parse(code_string) do
    cond do
      code_string =~ todo_regex ->
        todo = parse_todo(code_string)
        {:todo, todo}
      true ->
        {:error, "No valid keyword found"}
    end
  end

  defp parse_todo(code_string) do
    Regex.run(todo_regex, code_string)
    |> List.first
  end

  defp todo_regex, do: ~r/(?<=TODO:\s).+$/i
end
