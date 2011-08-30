require 'thor/group'

class Base < Thor::Group
  include Thor::Actions
  
  def self.source_root
    File.dirname(__FILE__) + "/../templates"
  end
  
end