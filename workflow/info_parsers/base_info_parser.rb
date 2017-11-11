class BaseInfoParser
  def parse(url)
    find_columns(find_rows(find_table(url)))
  end

  private

  def fetch_document(url)
    Nokogiri::HTML(open(url))
  end

  def find_table(url)
    # Select table by text content because there is no other good way.
    fetch_document(url).at_css('.WikiaArticle table:contains("Appearances")')
  end

  def find_rows(table)
    table.css('tr')
  end

  def find_columns(_rows)
    raise 'Not implemented'
  end

  def subtable?(_columns)
    raise 'Not implemented'
  end

  def table_info(columns, hash)
    hash[columns.first.content.strip] = columns.last.content.strip
  end

  def subtable_info(_columns, _hash)
    raise 'Not implemented'
  end

  def format_arr(arr)
    arr.content.delete("\n").strip.split
  end
end
