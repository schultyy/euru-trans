defmodule EuruTrans.Sashimi do

  def parse(complete_file) do
    cut(complete_file) |> convert
  end

  defp cut(complete_file) do
    String.split(complete_file, "---",trim: true)
  end

  defp convert(markdown) when length(markdown) == 1 do
    {{}, clean(markdown)}
  end

  defp convert([frontmatter|markdown]) do
    result = :yamerl_constr.string(frontmatter) |> List.flatten
    {hd(result), clean(markdown)}
  end

  defp clean(markdown) do
    String.strip(hd(markdown))
  end
end
