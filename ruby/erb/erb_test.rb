#!/usr/bin/env ruby -wKU

require "erb"


class Container
  
  attr_accessor :foo, :bar
  
  def initialize(foo, bar)
    @foo = foo
    @bar = bar
  end
  
  def get_binding
    binding
  end
  
end

class Foo
  
  def name
    "foo"
  end
  
end

class Bar
  
  def name
    "bar"
  end
  
end

foo = Foo.new
bar = Bar.new

container = Container.new(foo, bar)

result = ERB.new(File.new(File.expand_path('../template.erb', __FILE__)).read).result(container.get_binding)

puts result