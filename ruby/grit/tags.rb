require 'grit'
include Grit

r = Repo.new("/Users/tylerflint/Sites/zumiez/.git")

r.tags.each do |t|
  puts t.name
end