defmodule ToDone.Git do
  def project_files do
    System.cmd("git ls-tree --full-tree -r HEAD")
    |> String.split("\n", trim: true)
    |> Stream.map(&parse_ls_tree/1)
    |> Stream.reject(&(&1 == ".gitignore"))
  end

  def parse_ls_tree(ls_tree) do
    ls_tree
    |> String.split("\t")
    |> List.last
  end
end
