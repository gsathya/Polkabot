module Bot
  class Plugin
    def hello
      if  @msg.match("#{@nick}[:,] (hi|hello|hey|Hey|Hello|Hi)$") then
        say "Hey"
      end
    end
  end
end