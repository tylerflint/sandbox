#!/usr/bin/env ruby -wKU

class Task
  
  def name
    "tyler"
  end
  
  def task(&block)
    self.instance_eval(&block)
  end
  
end

# def task(key, &block)
#   
#   puts key.to_s
# 
#   block.call
#   
# end

task = Task.new

task.task do
  puts name
end if false