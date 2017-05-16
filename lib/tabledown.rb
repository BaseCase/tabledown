class TableDown
  attr_reader :raw

  def self.of input; new input; end

  def initialize input; @raw = input; end

  def format
    table.map { |row| format_row row }
         .join("\n") + "\n"
  end

  private

  def format_row r
    '|' +
    r.map.with_index { |cell, i| pad cell, i }
     .join('|') + '|'
  end

  def pad cell, col
    if cell[0] == '-'
      '-' * widest_cell_in(col)
    else
      cell.ljust widest_cell_in(col)
    end
  end

  def table
    @_table ||= parse_raw
  end

  def parse_raw
    rows = raw.split "\n"
    rows.map { |r| r.split('|')[1..-1] }
  end

  def widest_cell_in col
    @_widths ||= {}
    return @_widths[col] unless @_widths[col].nil?

    @_widths[col] = table.map{ |row| row[col] }
                         .map{ |cell| cell.length }
                         .max
  end
end
