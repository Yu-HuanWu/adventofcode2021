f= File.read("input")
g= f.split(",").map(&:to_i)
g= g.sort

test= [16,1,2,0,4,2,7,1,2,14]

def crab2(array)
    counter= 0
    h= (array.sum)/(array.length)
    # h= array[array.length/2]
    p h
    array.each do |num|
        if num > h
            j=(num-h)
            i= 0
            temp=0
            while i < j
                i+=1
                temp+=i
            end
            counter+=temp
        else
            j=(h-num)
            i= 0
            temp=0
            while i < j
                i+=1
                temp+=i
            end
            counter+=temp
        end
    end
    counter
end

p crab2(g)