#!/usr/bin/env ruby -wKU

24.times do |hour|
  minute = "#{hour}.55"
  minute = "0#{minute}" unless minute.length == 5
  puts minute
end