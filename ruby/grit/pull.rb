require 'grit'
include Grit

r = Repo.new("/Users/tylerflint/Sites/zumiez")

puts r.git.pull