require 'pry'


def main
  input = <<~STR
    | head1 | head2 | h3 |
    |---|---|---|
    | here is some stuff | stuf | a thing!! |
  STR

  # split up input into a 2D array
  lines = input.split("\n")
  rows = lines.map do |line|
    cells = line.split('|')
    cells[1..-1]
  end

  # find widest cell in each column
  column_widths = [0] * rows[0].length
  rows.each do |row|
    row.each_with_index do |cell, i|
      if cell.length > column_widths[i]
        column_widths[i] = cell.length
      end
    end
  end

  # format the output with padding to make tables line up
  output = rows.map do |row|
    '|' + row.map.with_index do |cell, i|
      cell.ljust(column_widths[i])
    end.join('|') + '|'
  end.join("\n")

  puts output
end


main
