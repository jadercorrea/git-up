module Gitup
  class Log
    def initialize
      @messages = []
    end

    def push(message)
      @messages << message
      message
    end

    def stack
      @messages
    end
  end
end
