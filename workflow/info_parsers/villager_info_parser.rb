class VillagerInfoParser
  def parse(url)
    find_columns(find_rows(find_table(url)))
  end

  private

  def fetch_document(url)
    Nokogiri::HTML(open(url))
  end

  def find_table(url)
    # Select table by text content because there is no other good way.
    fetch_document(url).at_css('.WikiaArticle table:contains("Initial phrase")')
  end

  def find_rows(table)
    table.css('tr')
  end

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

  def table_info(columns, hash)
    hash[columns.first.content.strip] = columns.last.content.strip
  end

  def subtable_info(columns, hash)
    rows = columns.css('table tr')
    keys = format_arr(rows.first)
    vals = format_arr(rows.last)

    keys.each.with_index do |k, i|
      hash[k] = vals[i]
    end
  end

  def format_arr(arr)
    arr.content.delete("\n").strip.split
  end
end
