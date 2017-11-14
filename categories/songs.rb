require_relative '../match_json'

class Songs
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/K.K._Slider_song_list_(New_Leaf)'.freeze
end

MatchJSON.new(
  Songs::LIST_URL,
  SongListParser.new,
  SoftMatcher.new,
  SongInfoParser.new
).find
