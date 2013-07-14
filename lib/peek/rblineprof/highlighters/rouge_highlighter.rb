module Peek
  module Rblineprof
    class RougeHighlighter
      def self.process(code, lexer)
        lexers = {
          :ruby => Rouge::Lexers::Ruby,
          :erb  => Rouge::Lexers::ERB
        }

        formatter = Rouge::Formatters::HTML.new(:line_numbers => true)
        lexer     = lexers[lexer.to_sym].new

        formatter.format(lexer.lex(code))
      end
    end
  end
end
