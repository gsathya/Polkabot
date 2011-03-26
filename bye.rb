require 'cinch'

class Bye
  include Cinch::Plugin
  
  plugin 'bye'
  match /polkabot[,:] (bye|ciao|night)$/, use_prefix: false
  help "polkabot, (bye|ciao|night) - Polkabot greets you!"

  def execute(m)
    m.reply "Bye, #{m.user.nick}"
  end
end
