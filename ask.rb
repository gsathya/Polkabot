require 'cinch'

class Ask
  include Cinch::Plugin
  plugin "ask"
  help "polkabot, who is <nick>? "
  
  match /polkabot[,:] who is (.+)/, use_prefix: false
  
  def execute(m,query)
    m.reply ("Ask him yourself, you nub !");
  end
end