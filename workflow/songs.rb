$LOAD_PATH << '.'
require 'match_json'

class Songs
  LIST_URL = 'http://animalcrossing.wikia.com/wiki/K.K._Slider_song_list_(New_Leaf)'.freeze
end

MatchJSON.new(
  list_url: Songs::LIST_URL,
  list_parser: SongListParser.new,
  matcher: DefaultMatcher.new,
  info_parser: SongInfoParser.new
).find
