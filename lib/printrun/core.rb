require 'ripper'
require 'sourcify'

module Printrun
  module Core

    def lines(source)
      Enumerator.new do |out|
        source.split("\n")[1..-2].reduce("") do |buffer, line|
          buffer << "\n#{line}"
          Ripper.sexp_raw(buffer) ? (out << buffer) && "" : buffer
        end
      end
    end

    # @param [Binding] world Binding to use for evaluation of statements
    # @param [Proc] line2ansp Proc that takes the line to process as parameter and returns
    #                         a Proc taking the result of previous line's evaluation as parameter
    # @yield [block] Block of code to process (line-eval~~~).
    def line_eval(world, line2ansp, &block)
      lines(block.to_source).each { |line| line2ansp[line][eval(line, world)] }
    end

  end
end
