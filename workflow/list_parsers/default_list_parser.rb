class DefaultListParser
  def parse(list_url)
    rows   = table_rows(list_url)
    names  = names(rows)
    urls   = urls(rows)
    images = images(rows)

    {}.tap do |hash|
      names.each.with_index do |name, i|
        hash[name] = { url: urls[i], image: images[i] }
      end
    end
  end

  private

  def table_rows(list_url)
    doc   = Nokogiri::HTML(open(list_url))
    table = doc.css('#mw-content-text table')[2]

    # Table does not have thead or tbody, so skip the headers.
    table.css('tr').drop(1)
  end

  def names(rows)
    rows.map { |row| extract_text(row.at_css('td')) }
  end

  def urls(rows)
    rows.map { |row| row.at_css('td a')['href'] }
  end

  def images(rows)
    rows.map { |row| row.css('td')[1].at_css('a')['href'] }
  end

  def extract_text(row)
    # Downcase to facilitate comparison.
    row.inner_text.downcase.strip.chomp
  end
end
