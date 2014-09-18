defmodule EuruTrans.Sashimi do
  def cut(complete_file) do
    String.split(complete_file, "---",trim: true)
  end

  def convert_frontmatter(frontmatter) do
    :yamerl_constr.string(frontmatter) |> List.flatten
  end
end
