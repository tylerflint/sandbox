#!/usr/bin/env ruby -wKU

def print(a, b)
  puts "#{a} #{b}"
end

arg_list = ["hello", "world"]

self.send :print, *arg_list