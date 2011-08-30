#!/usr/bin/env ruby -wKU
require 'json'


job = "server.down"
args = {
  :payload => 'huge xml string',
}

puts [ job, args ].to_json.to_s