require_relative '../match_json'

class Villagers
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Villager_list_(New_Leaf)'.freeze
end

MatchJSON.new(
  Villagers::LIST_URL,
  DefaultListParser.new,
  DefaultMatcher.new,
  VillagerInfoParser.new
).find
