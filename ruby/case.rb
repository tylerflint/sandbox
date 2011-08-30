#!/usr/bin/env ruby -wKU

one = 1
two = "two"

case one
when Integer
  puts "I am int"
else
  puts "I am not int"
end

case two
when String
  puts "I am a String"
else
  puts "I am not a string"
end

case two
when "two"
  puts "hey. I match"
else
  puts "lame, I don't match"
end

case two
when "one"
  puts "I match"
else
  puts "no, I don't match"
end

if two == String
  puts "ifs match type too"
else
  puts "ifs don't match type, just values"
end

if two.is_a? String
  puts "ifs match type on is_a?"
else
  puts "ifs don't match type on is_a?"
end