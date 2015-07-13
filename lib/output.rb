require 'log'

module Gitup
  class Output
    def initialize
      @log = Log.new
    end

    def puts(message)
      $stdout.puts message
      @log.push message
    end

    def log(message = nil)
      return $stdout.puts message if message
      @log.stack.each { |m| $stdout.puts m }
    end
  end
end
