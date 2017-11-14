require_relative 'base_list_parser'

class SongListParser < BaseListParser
  def parse(list_url)
    super
  end

  private

  # This is actually an unordered list.
  def table(doc)
    doc.at_css('#mw-content-text ol')
  end

  def rows(table)
    table.css('li')
  end

  def names(rows)
    rows.map { |row| extract_text(row) }
  end

  def urls(rows)
    rows.map { |row| row.at_css('a')['href'] }
  end
end
