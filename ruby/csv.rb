#!/usr/bin/env ruby

require 'csv'
require 'pp'

# CSV.open('/Users/tylerflint/Desktop/elders.csv', 'r') do |file|
#   file.each do |row|
#     pp row
#   end
# end

CSV.open('/Users/tylerflint/Desktop/quorum-list.csv', 'r') do |file|
  file.each do |row|
    pp row
  end
end