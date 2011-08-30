#!/usr/bin/env ruby -wKU


class Klass
  
  def class_name
    self.class.to_s.downcase
  end
  
end

klass = Klass.new

puts klass.class_name

exit


type = klass.class

type2 = type.class

puts type
puts type2

puts type.to_s

puts type.to_s.class

puts eval(type.to_s).new.class