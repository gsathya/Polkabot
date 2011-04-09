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
  
  def dict(query)
     
    linkprefix = 'http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q='
    linksuffix = '&sl=en&tl=en&restrict=pr%2Cde&client=te'

    jsondoc = open(linkprefix+CGI.escape(query)+linksuffix).read
    jsontext = jsondoc[25, jsondoc.length - 35]

    jsondict = JSON.parse jsontext

    singularmeanings = []
    pluralmeanings = []

    jsondict["primaries"][1]["entries"].each do | node |
      if node["type"] == "meaning"
        singularmeanings.push(node["terms"][0]["text"])
      end
    end

    jsondict["primaries"][2]["entries"].each do | node |
      if node["type"] == "meaning"
        pluralmeanings.push(node["terms"][0]["text"])
      end
    end

    title = jsondict["query"]
    sing = singularmeanings.join "\n"
    plur = pluralmeanings.join "\n"
    
    
  rescue
    "No results found"
  else
    CGI.unescape_html "#{title}\nSingular\n#{sing}\nPlural\n#{plur}"
    
  end
  
  def execute(m, query)
    m.reply(dict(query))
  end
end
