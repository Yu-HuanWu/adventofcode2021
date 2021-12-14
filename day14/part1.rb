f= File.read("input")
# f="CH -> B
# HH -> N
# CB -> H
# NH -> C
# HB -> C
# HC -> B
# HN -> C
# NN -> C
# BH -> H
# NC -> B
# NB -> B
# BN -> B
# BB -> N
# BC -> B
# CC -> N
# CN -> C"
g= f.split(("\n"))
h= []

g.each do |str|
    h<< str.split(' -> ')
end

start= "BNSOSBBKPCSCPKPOPNNK"
# start= "NNCB"
start= start.split("")

def polymer(start, inputs)
    result=[]
    i = 0
    while i< start.length-1
        inputs.each do |input|
            if [start[i], start[i+1]].join("") == input[0]
                result<< start[i]
                result<< input[1]
                # result<< start[i+1]
            end
        end
        i+=1
    end
    result<< start[-1]
    result
end

10.times do 
    start= polymer(start,h)
end

hash= Hash.new(0)
start.each do |ele|
    hash[ele]+=1
end

p hash.values.sort[-1] - hash.values.sort[0]
# p polymer(start, h)