require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://conversationstartersworld.com/250-conversation-starters/'))

outputString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
outputString += "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"> \n"
outputString += "<plist version=\"1.0\"> \n"
outputString += "<dict> \n"
outputString += "<key>root</key> \n"
outputString += "<array> \n"

doc.css('p').select{|p| p.content.include? "?"}[1..-1].each do |p|
    outputString += "<string>#{p.content}</string>\n"
end

outputString += "</array> \n"
outputString += "</dict> \n"
outputString += "</plist> \n"

puts outputString

File.open("convostarters.plist", 'w') { |file| file.write(outputString) }
