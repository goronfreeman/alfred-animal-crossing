# frozen_string_literal: true

require_relative '../match_json'

class Villagers
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'
end

MatchJSON.new(
  list_url: Villagers::LIST_URL,
  list_parser: DefaultListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: VillagerInfoParser.new
).find
