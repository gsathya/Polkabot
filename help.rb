class Help
  include Cinch::Plugin

  plugin "help"
  help "!help [name] - Get information about a command (or all commands with no name)"
  
  match /h(?:elp)? (.+)/, method: :with_name

  def with_name(m, query)
    result = @bot.plugins.find do |plugin|
      help_message = plugin.class.instance_variable_get(:@__cinch_help_message)
      name = plugin.class.instance_variable_get(:@__cinch_name)
      if (help_message && name == query)
        return help_message
      end
    end
    if result
      m.reply "#{result}"
    else
      m.reply "Sorry, no help found for #{query}."
    end
  end

  match /h(?:elp)?$/, method: :without_name

  def without_name(m)
    @bot.plugins.each do |plugin|
      help_message = plugin.class.instance_variable_get(:@__cinch_help_message)
      if help_message
        name = plugin.class.instance_variable_get(:@__cinch_name)
        m.reply "#{help_message}"
      end
    end
  end
end
