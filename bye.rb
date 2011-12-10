module Bot
  class Plugin
    def bye
      if  @msg.match("#{@nick}[:,] (bye|Bye|ciao|Ciao)$") then
          say "Ciao"
      end
    end
  end
end