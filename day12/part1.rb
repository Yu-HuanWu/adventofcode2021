require 'set'

f= File.read("input")
# f="dc-end
# HN-start
# start-kj
# dc-start
# dc-HN
# LN-dc
# HN-end
# kj-sa
# kj-HN
# kj-dc"

# f="start-A
# start-b
# A-c
# A-b
# b-d
# A-end
# b-end"

g= f.split(("\n"))
h= []

g.each do |str|
    h<<str.split("-")
end

hash= Hash.new([])
h.each do |sub|
    a, b = sub
    hash[a]+=[b]
    hash[b]+=[a]
end

def paths_nums(hash, node, visited)
    return 1 if node == 'end'
    return 0 if node.downcase == node && visited.include?(node)

    puts node
    visited.add(node)

    count= 0
    hash[node].each do |line|
        count+= paths_nums(hash, line, Set.new(visited))
    end
    return count
end

p paths_nums(hash, 'start', Set.new())

# https://open.appacademy.io/learn/swe-campus-hybrid/ruby/graph-traversal