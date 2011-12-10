module Bot
  class Plugin
    def ping
      if  @msg.match("PING :(.*)$") then
        say "PONG #{$~[1]}"
      end
    end
  end
end