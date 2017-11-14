require_relative '../match_json'

class Art
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/Art_(New_Leaf)'.freeze
end

MatchJSON.new(
  Art::LIST_URL,
  ArtListParser.new,
  SoftMatcher.new,
  ArtInfoParser.new
).find
