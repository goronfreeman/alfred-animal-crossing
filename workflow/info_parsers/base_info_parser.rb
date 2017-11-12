class BaseInfoParser
  def parse(url)
    construct_hash(find_rows(find_table(url)))
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

  def construct_hash(rows)
    Hash[extract_info(rows, header_ranges.first, header_ranges.last, 0).zip(extract_info(rows, data_ranges.first, data_ranges.last, 1))]
  end

  def horizontal(rows, range)
    format_arr(range.map { |i|rows.at(i).css('td').map(&:inner_text) }.flatten)
  end

  def vertical(rows, range, index)
    format_arr(range.map { |i| rows.at(i).css('td').map(&:inner_text).at(index) })
  end

  def format_arr(arr)
    arr.map { |str| str.strip.chomp }
  end

  def extract_info(rows, horz_range, vert_range, index)
    horizontal(rows, horz_range) + vertical(rows, vert_range, index)
  end

  def header_ranges
    raise 'Not implemented'
  end

  def data_ranges
    raise 'Not implemented'
  end
end
