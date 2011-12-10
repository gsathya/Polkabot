require 'sqlite3'

module Bot
  class Plugin
    def factoid
      
      @db = SQLite3::Database.new("db/polkabot.db")
      
      if  @msg.match(/#{@nick}[:,]\s?([a-zA-Z0-9].+)\sis\s([a-zA-Z0-9\s].+)/i) then
        
        query = @msg.match(/#{@nick}[:,]\s?([a-zA-Z0-9].+)\sis\s([a-zA-Z0-9\s].+)/i).captures
        say "Okay"
        
        @db.execute("insert or replace into factoid values('#{query[0]}','#{query[1]}')")
			  
      
      elsif @msg.match(/#{@nick}[:,]\s?([a-zA-Z0-9].+)\?/i) then
        
        query = @msg.match(/#{@nick}[:,]\s?([a-zA-Z0-9].+)\?/i).captures
        
        value = @db.execute("select value from factoid where name='#{query[0].strip}'")
        
        unless value[0].blank?
          puts value[0]
          puts query[0].strip
          say "#{query[0].strip} is #{value[0].to_s.delete('[""]')}"
        end
      
      end
    end
  end
end