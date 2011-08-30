#!/usr/bin/env ruby -wKU

require 'pp'

hash = {
  "some big key" => [
    :task1 => {},
    :task2 => {}
  ],
  "some other big key" => [
    :task3 => {},
    :task4 => {}
  ]
}

pp hash