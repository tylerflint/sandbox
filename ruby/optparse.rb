#!/usr/bin/env ruby -wKU

require 'optparse'

options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: optparse.rb [options]"

    opts.on("-c", "--config CONFIG", "Path to CONFIG file") do |c|
      options[:config] = c
    end

    # opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    #   options[:verbose] = v
    # end
end.parse!

p options
p ARGV
