# gem install xmp exifr
require 'xmp'
require 'exifr'
require 'open-uri'

Dir.glob('*.jpg') do |jpg_file|
  puts "#{jpg_file.to_s}"
  img = EXIFR::JPEG.new(jpg_file)
  xmp = XMP.parse(img)
  hashtags = xmp.lr.hierarchicalSubject.collect {|x| "#" + x.chomp}
  puts hashtags.join(" ")
end
