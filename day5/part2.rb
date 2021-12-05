f= File.read("input")
g= f.split(("\n"))
h=[] #all lines

g.each do |sub|
    temp = []
    sub.split(" -> ").each do |subsub|
        temp+= subsub.split(",").map(&:to_i)
    end
    h << temp
end

i= [] #only horizontal or vertical lines
h.each do |sub|
    if sub[0]== sub[2] || sub[1]==sub[3]
        i<<sub
    end
end

def checklines(array)
    output= []
    array.each do |sub|
        if sub[0] < sub[2] && sub[1]==sub[3]
            i= sub[0]
            j= sub[2]
            while i <= j
                output<< [i, sub[1]]
                i+=1
            end
        elsif sub[2] < sub[0] && sub[1]==sub[3]
            i= sub[2]
            j= sub[0]
            while i <= j
                output<< [i, sub[1]]
                i+=1
            end
        elsif sub[1] < sub[3] && sub[0]==sub[2]
            i= sub[1]
            j= sub[3]
            while i <= j
                output<< [sub[0], i]
                i+=1
            end
        elsif sub[3] < sub[1] && sub[0]==sub[2]
            i= sub[3]
            j= sub[1]
            while i <= j
                output<< [sub[0], i]
                i+=1
            end
        else
            i= sub[0]
            j= sub[2]
            k= sub[1]
            l= sub[3]
            output << [i, k]
            while i!=j && k!=l
                deltaX=0
                deltaY=0
                if i < j
                    deltaX=1
                else
                    deltaX=-1
                end
                if k < l
                    deltaY= 1
                else
                    deltaY=-1
                end
                temp = [(i+=deltaX), (k+=deltaY)]
                output << temp
            end
        end
    end
    return output
end

hash = Hash.new(0)

checklines(h).each do |point|
    hash[point]+=1
end

p hash.select {|k,v| v >= 2}.length
