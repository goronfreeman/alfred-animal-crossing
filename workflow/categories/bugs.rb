# frozen_string_literal: true

require_relative '../match_json'

class Bugs
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Bugs_(New_Leaf)'
end

MatchJSON.new(
  Bugs::LIST_URL,
  DefaultListParser.new,
  DefaultMatcher.new,
  CreatureInfoParser.new
).find
