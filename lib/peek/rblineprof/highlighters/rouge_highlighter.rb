module Peek
  module Rblineprof
    class RougeHighlighter
      def self.process(code, lexer)
        lexer = find_lexer(lexer)

        return code if lexer == :no_lexer

        formatter = Rouge::Formatters::HTML.new(:line_numbers => true)
        formatter.format(lexer.new.lex(code))
      end

      def self.find_lexer(lexer)
        lexers = {
          ruby: Rouge::Lexers::Ruby,
          erb:  Rouge::Lexers::ERB
        }

        lexers.fetch(lexer.to_sym, :no_lexer)
      end
    end
  end
end
