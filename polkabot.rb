$:.unshift(Dir.pwd)
require 'cinch'
require 'youtube'
bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chennai-hackers"]
    c.nick = "polkabot"
    c.plugins.plugins = [Youtube]
  end
end

bot.start
