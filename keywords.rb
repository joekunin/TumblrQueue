# gem install xmp exifr
require 'xmp'
require 'exifr'
require 'open-uri'
require 'tumblr_client'

Tumblr.configure do |config|
  config.consumer_key = "ytWN3IBf2xB6pyR12eycbyoh0QzOM8gpQZHgj9mzRlW3KlvQhS"
  config.consumer_secret = "E1ym8E7hNePPoL5vpGdAoieSYOKRZwbrH2z210YUY6wm5KZ8oz"
  config.oauth_token = "yRrxfqgXCVBB9FDY9weBAy6NwayJVokFKArbwepx7taIZkwlJT"
  config.oauth_token_secret = "HPj1ssG7z3VPWTJeCiMweqTZzmsT09xdzPjNeldh3Mfc1QcLrp"
end


client = Tumblr::Client.new

#uploads photo - :data must be array of filenames, :tags only comma seperated

client.photo('joekuninphoto.tumblr.com', :data => ["1.jpg"], :tags => "more tasty tags, or,only,with,commas", :state => "queue")






# Tagging functions
#def hashtags
#  puts "Instagram".upcase
#  Dir.glob('*.jpg') do |jpg_file|
#    puts "#{jpg_file.to_s.upcase}"
#    img = EXIFR::JPEG.new(jpg_file)
#    xmp = XMP.parse(img)
#    hashtags = xmp.lr.hierarchicalSubject.collect {|x| "#" + x.chomp}
#    puts hashtags.join(" ")
#    puts "\n\n"
#  end
#end
#
#def keywords
#  puts "Tumblr/Keywords".upcase
#  Dir.glob('*.jpg') do |jpg_file|
#    puts "#{jpg_file.to_s.upcase}"
#    img = EXIFR::JPEG.new(jpg_file)
#    xmp = XMP.parse(img)
#    hashtags = xmp.lr.hierarchicalSubject
#    puts hashtags.join(" ")
#    puts "\n\n"
#  end
#end
#
#hashtags
#keywords