require 'nokogiri'
require 'open-uri'

class SongListParser
  def parse(list_url)
    rows  = list_items(list_url)
    names = names(rows)
    urls  = urls(rows)

    {}.tap do |hash|
      names.each.with_index do |name, i|
        hash[name] = { url: urls[i] }
      end
    end
  end

  private

  def list_items(list_url)
    doc  = Nokogiri::HTML(open(list_url))
    list = doc.at_css('#mw-content-text ol')

    list.css('li')
  end

  def names(items)
    # Downcase to facilitate comparison.
    items.map { |item| item.inner_text.downcase.delete("\n") }
  end

  def urls(items)
    items.map { |item| item.at_css('a')['href'] }
  end
end
