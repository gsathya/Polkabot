require 'cinch'

class Hello
  include Cinch::Plugin
  plugin "Hello"
  help "hello|hi|yo - Polkabot greets you!"
  
  match /polkabot[,:] (hello|hi|yo)$/, use_prefix: false


  def execute(m)
    m.reply "Hello, #{m.user.nick}"
  end
end
