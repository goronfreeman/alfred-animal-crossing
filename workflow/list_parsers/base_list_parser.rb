# frozen_string_literal: true

class BaseListParser
  def parse(list_url)
    rows  = table_rows(list_url)
    names = names(rows)
    urls  = urls(rows)

    {}.tap do |hash|
      names.each.with_index do |name, i|
        hash[name] = { url: urls[i] }
      end
    end
  end

  private

  def table(_doc)
    raise 'Not implemented in child class'
  end

  def headers
    raise 'Not implemented in child class'
  end

  def rows(table)
    # Tables do not have thead or tbody, so skip the headers.
    table.css('tr').reject.with_index { |_el, i| headers.include?(i) }
  end

  def table_rows(list_url)
    doc = Nokogiri::HTML(open(list_url))
    rows(table(doc))
  end

  def names(rows)
    rows.map { |row| extract_text(row.at_css('td')) }
  end

  def urls(rows)
    rows.map { |row| row.at_css('td a')['href'] }
  end

  def extract_text(row)
    # Downcase to facilitate comparison.
    row.inner_text.downcase.strip.chomp
  end
end
