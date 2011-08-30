one_million = (1..1000000).to_a

start = Time.now

total = one_million.inject(0) do |sum, element|
  sum += element
  sum
end

# puts one_million.length

stop = Time.now

puts total
puts stop - start