$:.unshift(Dir.pwd)
require 'cinch'
require 'youtube'
require 'seen'
require 'hello'
require 'bye'
require 'quit'
require 'help'
bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chennai-hackers"]
    c.nick = "polkabot"
    c.plugins.plugins = [Youtube,Seen,Hello,Bye,Quit,Help]
  end
end

bot.start
