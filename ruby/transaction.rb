require 'pp'

class Transaction
  
  class ContextBuilder
    
    class << self
      
      def task(key, options={}, &block)
        @tasks[key] = {:options => options, :block => block}
      end
      
      def build(seed, &block)
        @tasks = seed || {}
        class_eval &block
        @tasks
      end
      
    end
    
  end
  
  class << self
    
    def contexts
      @contexts ||= {}
    end
    
    def context(key, &block)
      contexts[key] = ContextBuilder.build(contexts[key], &block)
    end
    
    def task(key, options={}, &block)
      context "default" do
        task key, options, &block
      end
    end
    
  end
  
end

class ChildTransaction < Transaction

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

pp ChildTransaction.contexts