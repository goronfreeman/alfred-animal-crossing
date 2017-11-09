$LOAD_PATH << 'lib/nokogiri'
require 'nokogiri'

$LOAD_PATH << 'lib/alfred-workflow-ruby'
require 'alfred-3_workflow'

$LOAD_PATH << '.'
require 'villagers'

require 'open-uri'

module AlfredAC
  class Search
    include AlfredAC::Villagers

    attr_reader :query, :category, :workflow, :info

    def initialize
      @query = ARGV[0]&.downcase
      @category = ARGV[1]&.downcase
      @workflow = Alfred3::Workflow.new
      @info = AlfredAC::Villagers.info
    end

    def search
      # TODO: Account for Agent S and Wart Jr.
      if villager_match(query)
        data = find_data(query)

        if category
          categories = find_categories(data, category)

          return no_match_json if categories.empty?
          find_categories(data, category).each { |k, v| category_json(k, v) }
        else
          data.each { |k, v| category_json(k, v) }
        end
      else
        villagers = find_matches(query)

        return no_match_json if villagers.empty?
        villagers.each { |villager| villager_json(villager) }
      end
    ensure
      print workflow.output
    end

    private

    def find_table(villager)
      # Select table by text content because there is no other good way.
      fetch_document(villager).at_css('.WikiaArticle table:contains("Initial phrase")')
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

    def find_data(query)
      find_columns(find_rows(find_table(query)))
    end

    def base_url
      'http://animalcrossing.wikia.com'
    end

    def full_url(villager)
      suffix = info[villager]['url']
      "#{base_url}#{suffix}"
    end

    def fetch_document(villager)
      Nokogiri::HTML(open(full_url(villager)))
    end

    def find_matches(query)
      info.keys.select { |name| name.start_with?(query) }
    end

    def villager_match(name)
      info.keys.include?(name)
    end

    def find_categories(data, category)
      data.select { |k, _v| k =~ Regexp.new(category, Regexp::IGNORECASE) }
    end

    def icon_name(trait)
      "img/#{trait.split.join('_')}.png"
    end

    def villager_json(villager)
      villager_url = full_url(villager)
      titleized_name = titleize(villager)

      workflow.result
              .title(titleized_name)
              .autocomplete(titleized_name)
              .quicklookurl(villager_url)
              .arg(villager_url)
              .text('copy', villager_url)
    end

    def category_json(key, val)
      # TODO: Autocomplete category without overwriting villager
      workflow.result
              .title(key)
              .subtitle(val)
              .icon(icon_name(key))
      # TODO: Different links for mod
    end

    def no_match_json
      workflow.result
              .title('No matches found!')
              .subtitle('Try something else')
    end

    def titleize(str)
      regex = /[\s -]/

      return str.capitalize unless str =~ regex
      delimiter = str.each_char.select { |c| c =~ regex }
      str.split(regex).map(&:capitalize).join(delimiter.first)
    end
  end
end

AlfredAC::Search.new.search
