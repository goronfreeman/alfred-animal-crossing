$LOAD_PATH << '.'
require 'base_info_parser'

class FossilInfoParser < BaseInfoParser
  def parse(url)
    super
  end

  private

  def find_columns(rows)
    {}.tap do |hash|
      rows.each do |row|
        columns = row.css('td')
        next unless columns.size == 2
        table_info(columns, hash)
      end
    end
  end
end
