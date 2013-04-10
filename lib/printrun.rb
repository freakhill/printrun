require 'printrun/core'

module Printrun
  include Core
  extend self

  # careful of the bug of sourcify with double quotes (if still there at time of reading)...
  # @example
  #  Printrun.on(STDOUT) do
  #    a = 3
  #    puts a
  #  end
  def on(io, world = proc { binding }[], &block)
    i = 0
    line_eval(world,
              proc { |line|
                io.puts "#{i += 1} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{line}\n --- "
                proc { |ans| io.puts "#{ans}\ndone!" }
              }, &block)
  end

  def out(world = nil, &block)
    world ? on(STDOUT, world, &block) : on(STDOUT, &block)
  end

  def err(world = nil, &block)
    world ? on(STDERR, world, &block) : on(STDERR, &block)
  end

end

