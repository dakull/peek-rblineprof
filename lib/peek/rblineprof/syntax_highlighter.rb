require 'peek/rblineprof/highlighters/pygments_highlighter'
require 'peek/rblineprof/highlighters/rouge_highlighter'

module Peek
  module Rblineprof
    class SyntaxHighlighter
      class_attribute :highlighter

      def self.highlight(code, lexer)
        return code unless highlighter

        highlighter.process(code, lexer)
      end
    end
  end
end

module Peek
  module Rblineprof
    begin
      require 'pygments.rb'

      SyntaxHighlighter.highlighter = PygmentsHighlighter
    rescue LoadError
      # Doesn't have pygments.rb installed
    end

    if SyntaxHighlighter.highlighter.nil?
      begin
        require 'rouge'

        SyntaxHighlighter.highlighter = RougeHighlighter
      rescue LoadError
        # Doesn't have rouge installed
      end
    end
  end
end
