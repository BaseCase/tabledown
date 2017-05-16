require_relative "../app/tabledown"


describe TableDown do
  it "gives you back a single cell" do
    given = <<~STR
      | sup |
    STR

    expected = <<~STR
      | sup |
    STR

    expect(TableDown.of(given).format).to eq expected
  end


  it "gives you back a single row" do
    given = <<~STR
      | h1 | h2 | heyyy |
    STR

    expected = <<~STR
      | h1 | h2 | heyyy |
    STR

    expect(TableDown.of(given).format).to eq expected
  end


  it "pads out a single column to be as wide as its widest cell" do
    given = <<~STR
      | a |
      | aaa |
    STR

    expected = <<~STR
      | a   |
      | aaa |
    STR

    expect(TableDown.of(given).format).to eq expected
  end


  it "pads every column in a multi-column table appropriately" do
    given = <<~STR
      | head1 | head2 | h3 |
      | here is some stuff | stuf | a thing!! |
    STR

    expected = <<~STR
      | head1              | head2 | h3        |
      | here is some stuff | stuf  | a thing!! |
    STR

    expect(TableDown.of(given).format).to eq expected
  end


  it "fills separator cells out to their full width" do
    given = <<~STR
      | head1 | head2 | h3 |
      |---|---|---|
      | here is some stuff | stuf | a thing!! |
    STR

    expected = <<~STR
      | head1              | head2 | h3        |
      |--------------------|-------|-----------|
      | here is some stuff | stuf  | a thing!! |
    STR

    expect(TableDown.of(given).format).to eq expected
  end
end
