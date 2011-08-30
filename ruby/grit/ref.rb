require 'grit'
include Grit

r = Repo.new("/Users/tylerflint/Sites/zumiez/.git")

# A Head is a named reference to a Commit. Every Head instance contains a name
# and a Commit object.

puts "first head"
h = r.heads.first
puts h.name # => "master"
# puts h.commit # => #<Grit::Commit "1c09f116cbc2cb4100fb6935bb162daa4723f455">
# puts h.commit.id # => "1c09f116cbc2cb4100fb6935bb162daa4723f455"

puts

puts "all heads"
r.heads.each do |h|
  puts h.name # => "master"
  # puts h.commit # => #<Grit::Commit "1c09f116cbc2cb4100fb6935bb162daa4723f455">
  # puts h.commit.id # => "1c09f116cbc2cb4100fb6935bb162daa4723f455"
end