f= File.read("input")
g= f.split(",").map(&:to_i)
g= g.sort

test= [16,1,2,0,4,2,7,1,2,14]

def crab(array)
    counter= 0
    # h= (array.sum)/(array.length)
    h= array[array.length/2]
    p h
    array.each do |num|
        if num > h
            counter += (num-h)
        else
            counter += (h-num)
        end
    end
    counter
end

p crab(g)