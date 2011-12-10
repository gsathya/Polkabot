plugins = %w[quit bye hello factoid] 
plugins.map { |plugin| require plugin }

module Bot
  class Plugin
    def match
      [bye,quit,hello,factoid].map { |execute| execute }
    end
  end
end
