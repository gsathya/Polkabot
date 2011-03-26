require 'cinch'

class Quit 
  include Cinch::Plugin
  plugin "Quit"
  match /polkabot[,:] (quit|leave)$/, use_prefix: false
  help "polkabot quit - Polkabot quits."
  
  def execute(m)
    if m.user.nick == "gsathya"
       bot.quit("All hail gsathya");
    else
      m.reply "#{m.user.nick}, ha nice try !"
    end
  end
  
end