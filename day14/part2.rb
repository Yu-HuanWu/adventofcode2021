f= File.read("input")
g= f.split(("\n"))
h= []

g.each do |str|
    h<< str.split(' -> ')
end

rules= Hash.new()
h.each do |array|
    rules[array[0]]= array[1]
end

start= "BNSOSBBKPCSCPKPOPNNK"
start= start.split("")
start= start.zip(start[1..-1])
count= 0

freq= Hash.new(0)
start.each do |array|
    freq[array]+=1
end
40.times do
    nxt = Hash.new(0)
    freq.each do |key, value|
        keys= key.join("")
        if rules.include?(keys)
            nxt[[key[0], rules[keys]]]+=value
            nxt[[rules[keys], key[1]]]+=value
        else
            nxt[[key[0], key[1]]]+=value
        end
    end
    freq= nxt
    count+=1
    p count
end
result= Hash.new(0)
freq.each do |key, value|
    result[key[0]] += value
end

final= result.values.sort

p final[-1]- final[0]
