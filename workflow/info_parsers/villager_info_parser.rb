$LOAD_PATH << '.'
require 'base_info_parser'

class VillagerInfoParser < BaseInfoParser
  def parse(url)
    find_columns(find_rows(find_table(url)))
  end

  private

  def find_columns(rows)
    {}.tap do |hash|
      rows.each do |row|
        columns = row.css('td')
        next unless columns.size == 2 || subtable?(columns)
        subtable?(columns) ? subtable_info(columns, hash) : table_info(columns, hash)
      end
    end
  end

  def subtable?(columns)
    columns.css('table tr').any?
  end

  def subtable_info(columns, hash)
    rows = columns.css('table tr')
    keys = format_arr(rows.first)
    vals = format_arr(rows.last)

    keys.each.with_index do |k, i|
      hash[k] = vals[i]
    end
  end
end
