defmodule EuruTransSashimiTest do
  use ExUnit.Case

  test "cuts frontmatter and markdown" do
    example = "---\nfoo: bar\n---\n#Heading"
    results = EuruTrans.Sashimi.cut(example)
    assert List.first(results) == "\nfoo: bar\n"
  end

  test "parses frontmatter to yaml" do
    example = "foo: bar"
    results = EuruTrans.Sashimi.convert_frontmatter(example)
    assert  {'foo', 'bar'} == hd(results)
  end
end
