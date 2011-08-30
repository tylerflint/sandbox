require 'pp'

class Transaction
  
  class ContextBuilder
    
    class << self
      
      def tasks
        @tasks ||= []
      end
      
      def task(key, options={}, &block)
        tasks << key 
        Kernel.const_get(@caller).send :task, key, options, &block
      end
      
      def build(caller_class, &block)
        reset!
        @caller = caller_class
        class_eval &block
        tasks
      end
      
      def reset!
        @caller = ''
        @tasks  = []
      end
      
    end
    
  end
  
  class << self
    
    def contexts
      @contexts ||= {}
    end
    
    def context(key, &block)
      contexts[key] = ContextBuilder.build(name, &block)
    end
    
    def tasks
      @tasks ||= {}
    end
    
    def task(key, options={}, &block)
      tasks[key] = {:options => options, :block => block}
    end
    
  end
  
end

class ChildTransaction < Transaction

  # puts name

  context "some random context" do
    
    task :a do
      "hi"
    end

    task :b do
      "hey"
    end
    
  end
  
  context "initializing environment" do
    
    task :prepare_writable_directories do
      "ok"
    end
    
    task :prepare_toaster_environment do
      "ok"
    end
    
  end
  
  task :unprotected do
    "ok"
  end
  
  task :uncovered do
    "not ok"
  end

end

puts "tasks:"
pp ChildTransaction.tasks
puts
puts "contexts:"
pp ChildTransaction.contexts
