#!/usr/bin/env ruby -wKU


def ask(question=nil)
  print "#{question}: " if question
  gets.strip
end

def person
  
  first = ask "what's your firstname?"
  
  last = ask "what's your lastname?"
  
  yield first, last
  
end

person do |first, last|
  puts "Hello, #{first} #{last}"
end