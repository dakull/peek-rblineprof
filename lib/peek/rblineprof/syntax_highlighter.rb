require 'peek/rblineprof/highlighters/pygments_highlighter.rb'
require 'peek/rblineprof/highlighters/rouge_highlighter.rb'

module Peek
  module Rblineprof
    class SyntaxHighlighter
      def self.highlight(code, lexer)
        return code unless highlighter

        highlighter.process(code, lexer)
      end

      private

      def self.highlighter
        @highlighter ||= -> {
          begin
            require 'pygments.rb'
            return PygmentsHighlither
          rescue LoadError
            # Doesn't have pygments.rb installed
          end

          begin
            require 'rouge'
            return RougeHighlighter
          rescue LoadError
            # Doesn't have rouge installed
          end
        }.call
      end
    end
  end
end
