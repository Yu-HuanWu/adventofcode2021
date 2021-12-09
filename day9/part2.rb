f= File.read("input")
# f= "2199943210
# 3987894921
# 9856789892
# 8767896789
# 9899965678"
g= f.split(("\n"))
g= g.map{|string| string.split("").map{|num| num.to_i}}

def lowpositions(array)
    result=[]
    i= 0
    while i < array.length
        j=0
        while j < array[0].length
            current = array[i][j]
            neighbors= []
            deltas= [[1, 0], [-1, 0], [0, 1], [0,-1]]
            deltas.each do |delta|
                row= i+ delta[0]
                col= i+ delta[1]
                if (row >= 0 && row < array.length) && (col >= 0 && col < array[0].length)
                    neighbors<< array[row][col]
                end
            end
            if neighbors.all? {|neighbor| neighbor > current}
                result << [i, j]
            end
            j+=1
        end
        i+=1
    end

    result
end

def explore_basin(array, row, col, visited)
    if !(row >= 0 && row < array.length) || !(col >= 0 && col < array[0].length)
        return 0
    end
    if array[row][col]== 9
        return 0
    end
    if visited.include?([row, col])
        return 0
    end
    visited << [row, col]
    return 1 + explore_basin(array, row+1, col, visited) + explore_basin(array, row-1, col, visited) + explore_basin(array, row, col+1, visited) + explore_basin(array, row, col-1, visited)
end

def basin_size(array, lowpos)
    sizes= []
    lowpos.each do |pos|
        size = explore_basin(array, pos[0], pos[1], [])
        sizes<< size
    end
    sizes
end

output = basin_size(g, lowpositions(g))
output = output.sort.uniq
p output[-1] * output[-2] * output[-3]

#thanks Alvin