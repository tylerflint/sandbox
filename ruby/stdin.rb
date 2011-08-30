#!/usr/bin/env ruby

args = ARGV.dup
ARGV.clear
command = args.shift.strip

file = '/Users/tylerflint/Desktop/out.txt'

File.open(file, 'w') {|f| f.write(command) }
