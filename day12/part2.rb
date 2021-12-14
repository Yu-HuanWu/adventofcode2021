require 'set'

f= File.read("input")
g= f.split(("\n"))
h= []

g.each do |str|
    h<<str.split("-")
end

hash= Hash.new([])
h.each do |sub|
    a, b = sub
    if b!= 'start'
        hash[a]+=[b]
    end
    if a!= 'start'
        hash[b]+=[a]
    end
end

def paths_nums(hash, node, visited, extra)
    return 1 if node == 'end'
    
    new_extra = extra
    if node.downcase == node && visited.include?(node)
        if extra
            return 0
        else
            new_extra = true
        end
    end

    visited.add(node)

    count= 0
    hash[node].each do |line|
        count+= paths_nums(hash, line, Set.new(visited), new_extra)
    end
    return count
end

p paths_nums(hash, 'start', Set.new(), false)
