# gem install xmp exifr
require 'xmp'
require 'exifr'
require 'open-uri'

def hashtags
  puts "Instagram".upcase
  Dir.glob('*.jpg') do |jpg_file|
    puts "#{jpg_file.to_s.upcase}"
    img = EXIFR::JPEG.new(jpg_file)
    xmp = XMP.parse(img)
    hashtags = xmp.lr.hierarchicalSubject.collect {|x| "#" + x.chomp}
    puts hashtags.join(" ")
    puts "\n\n"
  end
end

def keywords
  puts "Tumblr/Keywords".upcase
  Dir.glob('*.jpg') do |jpg_file|
    puts "#{jpg_file.to_s.upcase}"
    img = EXIFR::JPEG.new(jpg_file)
    xmp = XMP.parse(img)
    hashtags = xmp.lr.hierarchicalSubject
    puts hashtags.join(" ")
    puts "\n\n"
  end
end

hashtags
keywords