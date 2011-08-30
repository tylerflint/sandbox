#!/usr/bin/ruby

require 'yaml'
require 'pp'

# test1 = YAML.load_file('test1.yml')

# test2 = YAML.load_file('test2.yml')

test4 = YAML.load_file('test4.yaml')

# pp test4

test4['permissions'].each_pair do |key, value|
  puts key
  value.each do |entry|
    entry.each do |who, action|
      puts "  #{who}: #{action}"
    end
  end
end

# puts test1

# puts test2

# puts YAML.load(' ').class
