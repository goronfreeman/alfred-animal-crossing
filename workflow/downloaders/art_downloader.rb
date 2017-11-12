class ArtDownloader
  def download_art(villager, cache_path, art_path)
    # TODO: Fix Code 1: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/2.0.0/net/http.rb:921:in `connect': SSL_connect returned=1 errno=0 state=SSLv2/v3 read server hello A: tlsv1 alert protocol version (OpenSSL::SSL::SSLError)

    file = open(info[villager]['image'])
    IO.copy_stream(file, "#{cache_path}/#{song.id}.png")

    art_path
  end

  def fetch_art(villager)
    home_path = ENV['HOME']
    cache_path = "#{home_path}/Library/Caches/com.runningwithcrayons.Alfred-3/extensions_tmp"
    art_path = "#{cache_path}/#{villager}.png"
    File.exist?(art_path) ? art_path : download_art(villager, cache_path, art_path)
  end
end
