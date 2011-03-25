require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chennai-hackers"]
    c.nick = "polkabot"
  end
  
  help "!youtube <query> EX - !youtube foo"
  
  on :channel, "Genghiz9" do |m|
     m.reply "Genghiz9 is a fool"
  end
  
  on :channel, "polkabot ?" do |m|
      m.reply "Genghiz9 fail. All hail gsathya."
  end
  
  on :channel, "polkabot quit" do |m|
    m.channel.part("bye")
  end
    
  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

bot.start
  