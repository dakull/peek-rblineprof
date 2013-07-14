module Peek
  module Rblineprof
    class PygmentsHighlighter
      def self.process(code, lexer)
        Pygments.highlight(code, :lexer => lexer)
      end
    end
  end
end
