#!/usr/bin/env ruby -wKU

def ask(question=nil)
  print "#{question}: " if question
  gets.strip
end

name = ask "whats your name?"

puts "hello #{name}"