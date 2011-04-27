require 'cinch'

class LagCheck
  include Cinch::Plugin
  plugin "lagcheck"
  help "ping - polkabot pongs you"
  
  match /^(polkabot[,;]{0,1} |)(ping|PING|Ping)$/, use_prefix: false


  def execute(m)
    m.reply "#{m.user.nick}, pong :D"
  end
end
