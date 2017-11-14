# Child classes are expected to define #horz_header_indices and #vert_header_indices.
#
# Returns an Enumerable containing the indices of the horizontal table headers.
# def horz_header_indices
#   [6, 8, 10]
# end
#
# Returns an Enumerable containing the indices of the vertical table headers.
# def vert_header_indices
#   (12..16)
# end

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
    keys, vals = %w(header data).map.with_index do |str, i|
      extract_info(rows, send("#{str}_ranges").at(0), send("#{str}_ranges").at(1), i)
    end

    Hash[keys.zip(vals)]
  end

  def horizontal(rows, arr)
    format_arr(arr.map { |i| rows.at(i).css('td').map(&:inner_text) }.flatten)
  end

  def vertical(rows, range, index)
    format_arr(range.map { |i| rows.at(i).css('td').map(&:inner_text).at(index) })
  end

  def format_arr(arr)
    arr.map { |str| str.strip.chomp }
  end

  def extract_info(rows, horz_header_indices, vert_header_indices, index)
    horizontal(rows, horz_header_indices) + vertical(rows, vert_header_indices, index)
  end

  def header_ranges
    [horz_header_indices, vert_header_indices]
  end

  def data_ranges
    [increment(horz_header_indices), vert_header_indices]
  end

  def increment(range)
    range.map { |i| i + 1 }
  end
end
