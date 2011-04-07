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
bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chennai-hackers"]
    c.nick = "polkabot"
    c.plugins.plugins = [Ask,Youtube,Seen,Hello,Bye,Quit,Help,Google]
  end
end

bot.start
