require 'socket'
require 'plugin'

module Bot
  class Polkabot < Plugin
    
      def initialize(server,port,nick,channel)
        @server = server
        @port = port
        @socket = TCPSocket.open(@server, @port) 
        @nick = nick
        @channel = channel
        
        say_to_chan "NICK #{@nick}"
        say_to_chan "USER #{@nick} 0 * #{@nick}"
        say_to_chan "JOIN ##{@channel}"
        say_to_chan "PRIVMSG ##{@channel} : All hail gsathya"
      end
    
      def say_to_chan(msg)
        puts msg
        @socket.puts msg
      end
      
      def say(msg)
          puts msg
          @socket.puts "PRIVMSG ##{@channel} :#{@username}, #{msg}"
      end
     
      def parse
        match 
      rescue LocalJumpError
        puts "Local Jump Error"
      end
  
    
      def die
          say_to_chan "PART ##{@channel}"
          say_to_chan 'QUIT'
          @socket.close
      end

      def run
        until @socket.eof? do
            
          @msg = @socket.gets.strip
          puts @msg
          @username = @msg.match("(:)(.*)(!)").to_s.delete(':!')
          
          if  @msg.match(/^PING :(.*)$/) then
              say_to_chan "PONG #{$~[1]}"
          end
          
          parse
        
      end
      rescue IOError
        puts "Flush Socket"
    
    end
  end
end