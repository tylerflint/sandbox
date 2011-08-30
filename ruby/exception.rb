#!/usr/bin/env ruby -wKU


class PausableException < Exception; end

begin
  raise PausableException.new("something went wrong")
rescue PausableException => e
  puts e
  puts e.backtrace[0]
end
