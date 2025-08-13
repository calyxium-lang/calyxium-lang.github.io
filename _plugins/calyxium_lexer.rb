# _plugins/calyxium_lexer.rb
# frozen_string_literal: true

require 'rouge'

module Rouge
  module Lexers
    class Calyxium < RegexLexer
      title "Calyxium"
      desc "Calyxium programming language"
      tag 'calyxium'
      filenames '*.cx'

      state :root do
        rule %r/\b(ref|rec|if|then|else|let|use|with|for|match|mod|type|class|extends|in|fn)\b/, Keyword
        rule %r/\b(lsl|lsr|land|lor|lnot|lxor|not)\b/, Keyword
        rule %r/\b(any|unit|int|float|string|bool|byte)\b/, Keyword::Type
        rule %r/\b(true|false)\b/, Keyword::Constant
        rule %r/\b(0b[01_]+|0x[0-9a-fA-F_]+|\d[\d_]*(\.\d[\d_]*)?([eE][+-]?\d+)?)([fFdD]?)\b/, Num

        rule %r/(==|!=|<=|>=|<|>)/, Operator
        rule %r/(\!|&&|\|\|)/, Operator
        rule %r/(\*\*|\+\+|\+=|-=|\*=|\/=|\+|-|\*|\/|%)/, Operator
        rule %r/(=)/, Operator
        rule %r/(\||\^)/, Operator
        rule %r/(<<=|>>=)/, Operator
        rule %r/(&=|\|=|\^=|`=|\$=|<<=|>>=)/, Operator
        rule %r/(->)/, Operator
        rule %r/(\|>)/, Operator
        rule %r/\b(panic|print|to_float|to_int|to_string|to_bytes|length|input|assert|of_type)(?=\s*\()/, Name::Builtin
        rule %r/([A-Za-z]+[A-Za-z0-9_$]*)\s*(?=\()/, Name::Function
        rule %r/"/, Str::Double, :string
        rule %r/('\\\\\d'|'(\\.)'|'.{2,}'|''|'.')/, Str::Char
        rule %r/--\s\$.*\$/, Comment::Doc
        rule %r/--.*$/, Comment::Single
        rule %r/\(\*.*?\*\)/m, Comment::Multiline
        rule %r/[\[\]{}(),.;]/, Punctuation
        rule %r/\s+/, Text
        rule %r/\b[A-Za-z_][A-Za-z0-9_$]*\b/, Text
      end

      state :string do
        rule %r/\\./, Str::Escape
        rule %r/"/, Str::Double, :pop!
        rule %r/[^"\\]+/, Str::Double
      end
    end
  end
end
