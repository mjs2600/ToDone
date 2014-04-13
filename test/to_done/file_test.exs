defmodule ToDone.FileTest do
  use ExUnit.Case

  test "it can filter to-dos" do
    assert ToDone.File.todo?("TODO: This is a todo")
    assert !ToDone.File.todo?("This is not a todo")
  end

  test "it can parse to-dos" do
    assert ToDone.File.parse("TODO: This is a todo") == {:todo, "This is a todo"}
    assert ToDone.File.parse("This is not a todo") == {:error, "No valid keyword found"}
  end
end

