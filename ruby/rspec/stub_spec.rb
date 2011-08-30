#!/usr/bin/env ruby -wKU

require 'spec'

class Stub
  
  def name
    "Tyler Flint"
  end
  
end

# Stub.methods.each do |m|
#   puts m
# end
# 
# exit

stubbed = stub(:Stub)

puts stubbed.name

stubbed.stub!(:name)

puts "after stub..."

puts stubbed.name

puts "done"
