defmodule EuruTransSashimiTest do
  use ExUnit.Case

  test "return frontmatter and markdown" do
    example = "---\nfoo: bar\n---\n#Heading"
    { frontmatter, markdown } = EuruTrans.Sashimi.parse(example)
    assert frontmatter == {'foo', 'bar'}
    assert markdown == "#Heading"
  end

  test "markdown without frontmatter" do
    example = "#Heading"
    {frontmatter, markdown} = EuruTrans.Sashimi.parse(example)
    assert frontmatter == {}
    assert markdown == "#Heading"
  end
end
