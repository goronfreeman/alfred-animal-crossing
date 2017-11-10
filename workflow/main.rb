$LOAD_PATH << 'lib/nokogiri'
require 'nokogiri'

$LOAD_PATH << 'lib/alfred-workflow-ruby'
require 'alfred-3_workflow'

$LOAD_PATH << '.'
require 'villagers'

require 'fileutils'
require 'open-uri'
require 'net/https'

module AlfredAC
  class Search
    include AlfredAC::Villagers

    attr_reader :query, :trait, :workflow, :info

    def initialize
      @query = ARGV[0].downcase
      @trait = ARGV.drop(1).each(&:downcase).join(' ') if ARGV.length > 1
      @workflow = Alfred3::Workflow.new
      @info = AlfredAC::Villagers.info
    end

    def search
      # TODO: Account for villagers with a space (i.e. Agent S, Wart Jr)
      if villager_match(query)
        data = find_data(query)

        if trait
          traits = find_traits(data, trait)

          return no_match_json if traits.empty?
          find_traits(data, trait).each { |k, v| trait_json(k, v) }
        else
          data.each { |k, v| trait_json(k, v) }
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

    def find_traits(data, trait)
      data.select { |k, _v| k =~ Regexp.new(trait, Regexp::IGNORECASE) }
    end

    def icon_path(trait)
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
              # .icon(fetch_art(villager))
    end

    def trait_json(key, val)
      workflow.result
              .title(key)
              .subtitle(val)
              .autocomplete("#{query.capitalize} #{key}") # TODO: Extract into method.
              .icon(icon_path(key))
              .arg(full_url(query))
    end

    def no_match_json
      workflow.result
              .title('No matches found!')
              .subtitle('Try something else')
    end

    def titleize(str)
      pattern = Regexp.new("[\s -]")

      return str.capitalize unless str =~ pattern
      delimiter = str.each_char.select { |c| c =~ pattern }
      str.split(pattern).map(&:capitalize).join(delimiter.first)
    end

    def download_art(villager, cache_path, art_path)
      # TODO: Fix Code 1: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/2.0.0/net/http.rb:921:in `connect': SSL_connect returned=1 errno=0 state=SSLv2/v3 read server hello A: tlsv1 alert protocol version (OpenSSL::SSL::SSLError)

      file = open(info[villager]['image'])
      IO.copy_stream(file, "#{cache_path}/#{song.id}.png")

      art_path
    end

    def fetch_art(villager)
      home_path = ENV['HOME']
      cache_path = "#{home_path}/Library/Caches/com.runningwithcrayons.Alfred-3/extensions_tmp"
      art_path = "#{cache_path}/#{villager}.png"
      File.exist?(art_path) ? art_path : download_art(villager, cache_path, art_path)
    end
  end
end

AlfredAC::Search.new.search
