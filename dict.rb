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
    query = CGI.escape(query)
    limit = 1 #set the limit
    output = query + " : "
    urljson = "http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=#{query}&sl=en&tl=en&restrict=pr%2Cde&client=te"
    urlhtml = "http://www.google.com/dictionary?langpair=en|en&q=#{query}&hl=en&aq=f"
    m.reply("Searching for \"#{query}\"")
    jsondoc = open(urljson).read
    jsontext = jsondoc[25, jsondoc.length - 35]
    jsondict = JSON.parse jsontext

    @meaningslist = []
    if jsondict.has_key? "primaries"
      disectjson(jsondict["primaries"])
      num = 0
      @meaningslist.each do | emean |
        if num < limit
          output += emean+" | "
          num += 1 
        else
          break
        end
      end
      output += "more results: "+urlhtml
      m.reply(output)
    else
      m.reply("No results found")    
    end
  #rescue
  #  m.reply("No results found")    
  end

  def disectjson(query)
    if query.kind_of? Array
    query.each do | node |
        disectjson(node)
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
                      @meaningslist.push(entries["text"])
                    end
                  end
                end
              end
            end
          end
        elsif query[element].kind_of? Array or query[element].kind_of? Hash
          disectjson(query[element])
        end
      end
    end
  end

  def execute(m, query)
    dict(m, query)
  end
end
