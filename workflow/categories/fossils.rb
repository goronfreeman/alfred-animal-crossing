# frozen_string_literal: true

require_relative '../match_json'

class Fossils
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Fossils_(New_Leaf)'
end

MatchJSON.new(
  Fossils::LIST_URL,
  FossilListParser.new,
  SoftMatcher.new,
  FossilInfoParser.new
).find
