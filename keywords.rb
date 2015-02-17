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
  client = Tumblr::Client.new(:client => :httpclient)
  
def write_to_uploaded_log(filename)
  uploaded_files_log = File.open("./logs/uploaded.txt", "a+")
  uploaded_files_log.puts (filename)
end


uploaded = IO.readlines("./logs/uploaded.txt").map{|x| x.strip! }

Dir.glob('./images/*.jpg') do |jpg_file|
  upload_limit = 14

    if !uploaded.include?(jpg_file) && upload_limit > 0
      img = EXIFR::JPEG.new(jpg_file)
      xmp = XMP.parse(img)
      tags = xmp.lr.hierarchicalSubject.join(",")    
      client.photo('joekuninphoto.tumblr.com', :state => "queue", :caption => "www.joekuninphoto.com", :link =>"", :data => "#{jpg_file}", :tags => "#{tags}", )
      write_to_uploaded_log(jpg_file)
      puts "#{jpg_file} uploaded to Tumblr and written to the upload log"
      upload_limit -= 1
    else
      puts "#{jpg_file} was already uploaded to tumblr"
    end  
end
  
 
 
 
 # #NOTES: currently uploads directory of images to tumblr queue with tags pulled from lightroom metadata (try to use single level tags) 
  #TODO: *) check for duplicates 1) make executable from server. 2) attach to chron job 3) check for unique images 4) repaste duplicates that are updated from LR (using timestamp?)
  #check if file uploaded.txt has file name (unique names from LR) in list, if so, skip file, if not upload file