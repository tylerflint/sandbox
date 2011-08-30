require 'grit'

include Grit

repo = Repo.new("/Users/tylerflint/Sites/zumiez/.git")

repo.methods.each do |m|
  puts m
end