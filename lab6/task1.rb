# key, value pair
list = [
    "milk - 10",
    "sugar - 10",
    "milk - 20"
]

hash = Hash.new(0)

list.each do |i|
    goods, count = i.split(" - ")
    hash[goods] += count.to_i
end

puts("\nResult task 1: " + hash.inspect)
