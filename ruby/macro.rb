#!/usr/bin/env ruby -wKU

class Macro
  
  def hello(who)
    puts "hey #{who}"
  end
  
end

class Micro < Macro
  
  def initialize
    
    hello "world"
    hello "you"
    hello "tyler"
    
  end
  
end

micro = Micro.new