#!/usr/bin/env ruby -wKU

@box = {
  'general' => {
    'writable_directories' => "hey, hoe"
  },
  'name' => 'tyler'
}

key = "name".split("/")

puts "@box['#{key.join("']['")}']"