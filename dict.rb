require 'rubygems'
require 'cinch'
require 'open-uri'
require 'cgi'
require 'json'

class Dict
  include Cinch::Plugin
  plugin "dict"
  help "!dict <query> - Search english dictionary"
  match /dict (.+)/
  
  def dict(m, query)
     
    linkprefix = 'http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q='
    linksuffix = '&sl=en&tl=en&restrict=pr%2Cde&client=te'

    m.reply("Searching for \"#{query}\"...")
    jsondoc = open(linkprefix+CGI.escape(query)+linksuffix).read
    jsontext = jsondoc[25, jsondoc.length - 35]
    jsondict = JSON.parse jsontext
    
    m.reply("ahh!! #{jsondict["query"]}")
    disectjson(jsondict["primaries"],m)
  rescue
    m.reply("No results found")    
  end

  def disectjson(query,m)
    if query.kind_of? Array
    query.each do | node |
        disectjson(node,m)
      end
    elsif query.kind_of? Hash
      query.each_key do | element |
        if element == "type" and query[element] == "meaning"
          if query.has_key? "terms"
            if query["terms"].kind_of? Array
              query["terms"].each do | entries |
                if entries.kind_of? Hash
                  if entries.has_key? "text" and entries.has_key? "type"
                    if entries["type"] == "text"
                      m.reply(entries["text"])
                      sleep(0.3)
                    end
                  end
                end
              end
            end
          end
        elsif query[element].kind_of? Array or query[element].kind_of? Hash
          disectjson(query[element], m)
        end
      end
    end
  end

  def execute(m, query)
    dict(m, query)
  end
end
