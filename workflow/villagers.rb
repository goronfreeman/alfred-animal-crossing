$LOAD_PATH << 'lib/nokogiri'
$LOAD_PATH << 'lib/alfred-workflow-ruby'
$LOAD_PATH << 'list_parsers'
$LOAD_PATH << 'matchers'
$LOAD_PATH << 'info_parsers'

require 'nokogiri'
require 'alfred-3_workflow'
require 'villager_list_parser'
require 'default_matcher'
require 'villager_info_parser'
require 'open-uri'

class Villagers
  VILLAGER_LIST = 'http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'.freeze

  attr_reader :query, :workflow, :list, :matches

  def initialize(list_parser:, matcher:)
    @query = ARGV.join(' ').downcase
    @workflow = Alfred3::Workflow.new
    @list = list_parser.parse(VILLAGER_LIST)
    @matches = matcher.match(query, list)
  end

  def find
    if matches
      return find_attributes(matches.first) if matches.length == 1
      matches.each { |match| villager_json(match) }
    else
      no_match_json
    end
  ensure
    print workflow.output
  end

  private

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

  def attribute_json(villager, attribute, value)
    workflow.result
            .title(attribute)
            .subtitle(value)
            .icon(icon_path(attribute))
            .arg(full_url(villager))
  end

  def no_match_json
    workflow.result
            .title('No matches found!')
            .subtitle('Try something else')
  end

  def find_attributes(villager)
    attributes = VillagerInfoParser.new.parse(full_url(villager))
    attributes.each { |k, v| attribute_json(villager, k, v) }
  end

  def base_url
    'http://animalcrossing.wikia.com'
  end

  def full_url(villager)
    suffix = list[villager][:url]
    "#{base_url}#{suffix}"
  end

  def icon_path(trait)
    "img/#{trait.split.join('_')}.png"
  end

  def titleize(str)
    pattern = Regexp.new("[\s -]")

    return str.capitalize unless str =~ pattern
    delimiter = str.each_char.select { |c| c =~ pattern }
    str.split(pattern).map(&:capitalize).join(delimiter.first)
  end
end

Villagers.new(list_parser: VillagerListParser.new, matcher: DefaultMatcher.new).find
