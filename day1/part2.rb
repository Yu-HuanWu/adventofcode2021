f= File.read("input")
g= f.split(("\n")).map(&:to_i)

i=0
count=0

while i < g.length-3
    if (g[i+1]+g[i+2]+g[i+3])-(g[i]+g[i+1]+g[i+2]) > 0
        count+=1
    end
    i+=1
end

p count