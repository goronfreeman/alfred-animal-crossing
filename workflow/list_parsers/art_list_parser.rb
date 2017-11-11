class ArtListParser
  def parse(list_url)
    rows   = table_rows(list_url)
    names  = names(rows)
    urls   = urls(rows)

    {}.tap do |hash|
      names.each.with_index do |name, i|
        hash[name] = { url: urls[i] }
      end
    end
  end

  private

  def table_rows(list_url)
    doc   = Nokogiri::HTML(open(list_url))
    table = doc.at_css('#mw-content-text .wikitable')

    # Table does not have thead or tbody, so skip the headers.
    table.css('tr').drop(1)
  end

  def names(rows)
    # Downcase to facilitate comparison.
    rows.map { |row| row.at_css('td').inner_text.downcase.chomp }
  end

  def urls(rows)
    rows.map { |row| row.at_css('td a')['href'] }
  end
end
