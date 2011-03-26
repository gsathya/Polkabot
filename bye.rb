require 'cinch'

class Bye
  include Cinch::Plugin

  match /(bye|ciao|night)$/, use_prefix: false

  def execute(m)
    m.reply "Bye, #{m.user.nick}"
  end
end
