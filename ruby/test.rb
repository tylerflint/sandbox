#!/usr/bin/ruby
# require 'yaml'

# config = YAML.load_file('test2.yml')


# print config['root']['module1']['varA']

# print config.class # Hash

# Dir.entries("acl").each do |file|
#   if file.to_str =~ /.yml$/
#     YAML.load_file("acl/#{file.to_str}").each do |c|
#       print "#{c} \n"
#     end
#   end
# end
# 
# print "\n"

# class Test
#   
#   attr_reader :a, :b, :c
#   
#   def initialize
#     @a = "a"
#     {:b=>'b', :c=>'c'}.each do |k, v|
#       instance_variable_set "@#{k}", v
#     end
#   end
# end
# 
# test  = Test.new
# 
# print "#{test.a}\n"
# 
# print "#{test.b} \n"
# 
# print "#{test.c} \n"

# hash = {}

# print hash[:test]

print [ 
   'cd /var/www/redmine' \
  ,'sudo git pull' \
  ,'/etc/init.d/unicorn-redmine reload' \
  ].join(' && ')

