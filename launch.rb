$LOAD_PATH.unshift File.dirname(__FILE__)

require 'bot'
module Bot
  def self.letItRip
  
    polkabot = Polkabot.new('irc.freenode.net',6667,'polkabot','chennai-hackers')
    polkabot.run
    trap("INT"){ polkabot.quit }
  
  end
end

if __FILE__ == $0
  Bot.letItRip
end
