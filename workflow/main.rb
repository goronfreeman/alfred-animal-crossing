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

    attr_reader :query, :category, :workflow

    def initialize
      @query = ARGV[0]
      @category = ARGV[1]
      @workflow = Alfred3::Workflow.new
    end

    def search
      if villager_match(query)
        data = find_data(query)

        if category
          categories = find_categories(data, category)

          return no_match_json if categories.length.zero?
          find_categories(data, category).each { |k, v| category_json(k, v) }
        else
          data.each { |k, v|category_json(k, v) }
        end
      else
        villagers = find_matches(query)

        return no_match_json if villagers.length.zero?
        villagers.each { |villager| villager_json(villager) }
      end
    ensure
      print workflow.output
    end

    private

    def find_table(villager)
      # TODO: Get table with gender, personality, species
      fetch_document(villager).css('.WikiaArticle table').first
    end

    def find_rows(table)
      table.css('tr')
    end

    def find_columns(rows)
      data = {}

      rows.each do |row|
        columns = row.css('td')
        next unless columns.size == 2
        data[columns.first.content.strip] = columns.last.content.strip
      end

      data
    end

    def find_data(query)
      find_columns(find_rows(find_table(query)))
    end

    # TODO: Get villager URL from AlfredAC::Villagers.info
    def url(villager)
      "http://animalcrossing.wikia.com/wiki/#{villager}"
    end

    def fetch_document(villager)
      Nokogiri::HTML(open(url(villager)))
    end

    def find_matches(query)
      AlfredAC::Villagers.names.select { |name| name.downcase.start_with?(query.downcase) }
    end

    def villager_match(name)
      AlfredAC::Villagers.names.include?(name.capitalize)
    end

    def find_categories(data, category)
      data.select { |k, _v| k =~ Regexp.new(category, Regexp::IGNORECASE) }
    end

    def join_name(villager)
      villager.split.join('_')
    end

    def icon_name(trait)
      "img/#{trait.downcase.split.join('_')}.png"
    end

    def villager_json(villager)
      villager_url = url(join_name(villager))

      workflow.result
              .title(villager)
              .autocomplete(villager)
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
  end
end

AlfredAC::Search.new.search
