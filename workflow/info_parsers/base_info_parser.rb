# frozen_string_literal: true

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
      extract_info(rows, send("#{str}_ranges").first, send("#{str}_ranges").last, i)
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

  def extract_info(rows, horz_range, vert_range, index)
    horizontal(rows, horz_range) + vertical(rows, vert_range, index)
  end

  def header_ranges
    [horz_range, vert_range]
  end

  def data_ranges
    [increment(horz_range), vert_range]
  end

  def increment(range)
    range.map { |i| i + 1 }
  end

  def horz_range
    raise 'Not implemented in child class'
  end

  def vert_range
    raise 'Not implemented in child class'
  end
end
