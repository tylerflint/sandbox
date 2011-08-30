require 'grit'
include Grit

r = Repo.new("/Users/tylerflint/Sites/zumiez")

stat = r.status

puts "#{stat.changed.length} modified files"

puts "#{stat.added.length} added files"

puts "#{stat.deleted.length} deleted files"

# stat = r.status

# puts "added files:"
# stat.added.each do |f|
#   puts f.name
# end
# 
# puts "modified files:"
# stat.changed.each do |f|
#   puts f.name
# end
# 
# puts "deleted files:"
# stat.deleted.each do |f|
#   puts f.name
# end
# 
# puts "untracked files:"
# stat.untracked.each do |f|
#   puts f.to_s
# end

# puts r.status.pretty