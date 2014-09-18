defmodule EuruTrans.Sashimi do
  def cut(complete_file) do
    String.split(complete_file, "---",trim: true)
  end

  def convert_frontmatter(frontmatter) do
    :yamerl_constr.string(frontmatter) |> List.flatten
  end

  def parse(complete_file) do
    [frontmatter_str, markdown] = cut(complete_file)
    frontmatter = convert_frontmatter(frontmatter_str)
    { frontmatter, String.strip(markdown) }
  end
end
