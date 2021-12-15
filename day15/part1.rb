f= File.read("input")
g= f.split(("\n"))
h= []
g.each do |str|
    h<< str.split("").map(&:to_i)
end
# p h

def dijkstra(grid, start, final)
    unvisited= {}
    unvisited[start] = 0
    visited= [start]
    until visited.empty?

        min= 1000
        curr= 0
        visited.each do |arr|
            if unvisited.include?(arr) && unvisited[arr] < min
                min = unvisited[arr]
            end
            if unvisited[arr] == min
                curr= arr
            end
        end
        # above code is the same as visited.min_by(&unvisited)

        return unvisited[[curr[0], curr[1]]] if [curr[0], curr[1]] == final

        visited.delete([curr[0], curr[1]])

        [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
            if (0...grid.size).include?((curr[0] + dx)) && (0...grid[0].size).include?((curr[1]+dy))
                if !unvisited.has_key?([curr[0]+dx, curr[1]+dy])
                    risk = grid[curr[0]+dx][curr[1]+dy]
                    unvisited[[curr[0]+dx, curr[1]+dy]] = unvisited[[curr[0], curr[1]]] + risk
                    visited << [curr[0]+dx, curr[1]+dy]
                end
            end
        end
    end
end

p dijkstra(h, [0, 0], [h.size - 1, h[0].size - 1])