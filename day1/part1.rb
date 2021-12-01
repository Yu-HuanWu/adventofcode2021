f= File.read("input")
g= f.split(("\n")).map(&:to_i)

i=0
count=0

while i < g.length-1
    if g[i+1]-g[i] > 0
        count+=1
    end
    i+=1
end

p count