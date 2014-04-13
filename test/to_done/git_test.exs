defmodule ToDone.GitTest do
  use ExUnit.Case
  alias ToDone.Git

  test "it can parse an ls_tree" do
    ls_tree = "100644 blob 326c428ffaa8e067efab70039c5181e13acd0a42\tREADME.md"
    assert Git.parse_ls_tree(ls_tree) == "README.md"
  end

  test "it can parse and filter a set of ls_trees" do
    files = Enum.to_list(Git.project_files)
    assert Enum.member?(files, "README.md")
    assert !Enum.member?(files, ".gitignore")
  end
end

