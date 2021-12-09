f= File.read("input")
# f= "2199943210
# 3987894921
# 9856789892
# 8767896789
# 9899965678"
g= f.split(("\n"))

i = 0
result = []
while i < g.length
    j=0
    while j< g[i].length
        curr= g[i][j].to_i

        i!=0 ? top=g[i-1][j].to_i : top= 10
        i!= g.length-1 ? bottom= g[i+1][j].to_i : bottom= 10
        j!=0 ? left=g[i][j-1].to_i : left = 10
        j!= g[0].length-1 ? right= g[i][j+1].to_i : right = 10
        # p right
        if curr < top && curr < bottom && curr < left && curr < right
            result << curr
        end
        j+=1
    end
    i+=1
end
# p result
result.map!{|num| num+=1}
p result.sum