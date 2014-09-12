# gem install xmp exifr open-uri tumblr_client
require 'xmp'
require 'exifr'
require 'open-uri'
require 'tumblr_client'

#authenticate tumblr plugin
Tumblr.configure do |config|
  config.consumer_key = "ytWN3IBf2xB6pyR12eycbyoh0QzOM8gpQZHgj9mzRlW3KlvQhS"
  config.consumer_secret = "E1ym8E7hNePPoL5vpGdAoieSYOKRZwbrH2z210YUY6wm5KZ8oz"
  config.oauth_token = "yRrxfqgXCVBB9FDY9weBAy6NwayJVokFKArbwepx7taIZkwlJT"
  config.oauth_token_secret = "HPj1ssG7z3VPWTJeCiMweqTZzmsT09xdzPjNeldh3Mfc1QcLrp"
end

#new tumblr client instance
  client = Tumblr::Client.new
  
  Dir.glob('*.jpg') do |jpg_file|
      img = EXIFR::JPEG.new(jpg_file)
      xmp = XMP.parse(img)
      tags = xmp.lr.hierarchicalSubject.join(",")
      client.photo('joekuninphoto.tumblr.com', :state => "queue", :caption => "www.joekuninphoto.com", :link =>"", :data => "#{jpg_file}", :tags => "#{tags}", )
  end

  #NOTES: currently uploads directory of images to tumblr queue with tags pulled from lightroom metadata (try to use single level tags) 
  #TODO: 1) make executable from server. 2) attach to chron job 3) check for unique images 4) repaste duplicates that are updated from LR (using timestamp?)
  