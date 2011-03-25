require 'rubygems'
require 'cinch'
require 'nokogiri'
require 'open-uri'
require 'cgi'

class Youtube
  include Cinch::Plugin
  plugin "youtube"
  help "!youtube <query> - Search youtube for video. Ex - !youtube foo"
  match /youtube (.+)/
  
  #Grabs the first result and returns the TITLE,LINK,DESCRIPTION
  
  def youtube(query)
     
      doc = Nokogiri::HTML(open("http://www.youtube.com/results?q=#{CGI.escape(query)}"))

      result = doc.css('div#search-results div.result-item-main-content')[0]

      title = result.at('h3').text
      link = "www.youtube.com"+"#{result.at('a')[:href]}"
      desc = result.at('p.description').text
    
   rescue
      "No results found"
   else
      CGI.unescape_html "#{title} - #{desc} - #{link}"
  
  end
  
  def execute(m, query)
    m.reply(youtube(query))
  end
end