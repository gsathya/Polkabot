require 'cinch'

class Quit 
  include Cinch::Plugin
  plugin "Quit"
  match /polkabot[,:] (quit|leave)$/, use_prefix: false
  help "!quit <message> - Polkabot quits. Ex - !quit All Hail gsathya"
  
  def execute(message)
    bot.quit;
  end
  
end