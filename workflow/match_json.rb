$LOAD_PATH << 'lib/nokogiri'
$LOAD_PATH << 'lib/alfred-workflow-ruby'
$LOAD_PATH << 'list_parsers'
$LOAD_PATH << 'matchers'
$LOAD_PATH << 'info_parsers'

require 'nokogiri'
require 'alfred-3_workflow'

require 'default_matcher'

require 'art_list_parser'
require 'default_list_parser'
require 'fossil_list_parser'
require 'song_list_parser'

require 'art_info_parser'
require 'bug_info_parser'
require 'fish_info_parser'
require 'fossil_info_parser'
require 'song_info_parser'
require 'villager_info_parser'

require 'open-uri'

class MatchJSON
  attr_reader :workflow, :list, :matches, :info_parser

  def initialize(list_url:, list_parser:, matcher:, info_parser:)
    query = ARGV.join(' ').downcase
    @workflow = Alfred3::Workflow.new
    @list = list_parser.parse(list_url)
    @matches = matcher.match(query, list)
    @info_parser = info_parser
  end

  def find
    if matches
      return find_attributes(matches) if matches.is_a? String # TODO: Refactor?
      matches.each { |match| match_json(match) }
    else
      no_match_json
    end
  ensure
    print workflow.output
  end

  private

  def match_json(match)
    match_url = match_url(match)
    titleized_name = titleize(match)

    workflow.result
            .title(titleized_name)
            .autocomplete(titleized_name)
            .quicklookurl(match_url)
            .arg(match_url)
            .text('copy', match_url)
  end

  def attribute_json(match, attribute, value)
    workflow.result
            .title(attribute)
            .subtitle(value)
            .icon(icon_path(attribute))
            .arg(match_url(match))
  end

  def no_match_json
    workflow.result
            .title('No matches found!')
            .subtitle('Try something else')
  end

  def find_attributes(match)
    attributes = info_parser.parse(match_url(match))
    attributes.each { |k, v| attribute_json(match, k, v) }
  end

  def match_url(match)
    base   = 'http://animalcrossing.wikia.com'
    suffix = list[match][:url]

    "#{base}#{suffix}"
  end

  def icon_path(trait)
    "img/#{trait.split.join('_')}.png"
  end

  # TODO: Properly titleize song names.
  def titleize(str)
    pattern = Regexp.new("[\s -]")

    return str.capitalize unless str =~ pattern
    delimiter = str.each_char.select { |c| c =~ pattern }
    str.split(pattern).map(&:capitalize).join(delimiter.first)
  end
end
