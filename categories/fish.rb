require_relative '../match_json'

class Fish
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fish_(New_Leaf)'.freeze
end

MatchJSON.new(
  Fish::LIST_URL,
  DefaultListParser.new,
  SoftMatcher.new,
  CreatureInfoParser.new
).find
