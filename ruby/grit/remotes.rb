require 'grit'
include Grit

repo = Repo.new("/Users/tylerflint/Sites/tinybrick_modules/lightspeed")

# repo.remotes.each do |r|
#   puts r.name
# end

remotes = repo.git.remote.split("\n")
remotes.each do |r|
  puts "push url: #{repo.git.remote({}, "show -n #{r}")}"
end

