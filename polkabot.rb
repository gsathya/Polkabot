$:.unshift(Dir.pwd)
require 'cinch'
require 'youtube'
require 'seen'
require 'hello'
require 'google'
require 'bye'
require 'quit'
require 'ask'
require 'help'
require 'dict'
require 'lagcheck'
bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chennai-hackers"]
    c.nick = "polkabot"
 
    c.plugins.plugins = [Youtube,Seen,Hello,Bye,Quit,Help,Google,Dict,LagCheck]
  end
end

bot.start
