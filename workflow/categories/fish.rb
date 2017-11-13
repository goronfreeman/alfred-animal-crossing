# frozen_string_literal: true

require_relative '../match_json'

class Fish
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fish_(New_Leaf)'
end

MatchJSON.new(
  list_url: Fish::LIST_URL,
  list_parser: DefaultListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: CreatureInfoParser.new
).find
