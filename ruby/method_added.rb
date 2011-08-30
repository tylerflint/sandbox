#!/usr/bin/env ruby -wKU

class Base
  
  class << self
    def method_added(method)
      return if self == Base
      return if method == :initialize
      return unless method.to_s.split('').last == '!'
      return unless public_instance_methods.include?(method) ||
                    public_instance_methods.include?(method.to_s)
      tasks << method
    end
    
    def tasks
      @tasks ||= []
    end
  end
  
  def start
    self.class.tasks.each do |task|
      self.send task
    end
  end
  
end

class Super < Base
  
  def hello!
    puts "hey there!"
  end
  
  def world!
    puts "world"
  end

  protected
  
  def a
    puts "I am protected"
  end
  
  private
  
  def b
    puts "I am private"
  end
  
end

child = Super.new
child.start
