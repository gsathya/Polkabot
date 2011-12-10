module Bot
  class Plugin
    def quit
      if  @msg.match("#{@nick}[:,] quit") then
    		die 
      end
    end
  end
end