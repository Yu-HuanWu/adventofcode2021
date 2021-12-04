f= File.read("input")
g= f.split(("\n""\n"))

h= []
g.each do |sub|
    temp =[]
    sub.split(("\n")).each do |subsub|
        temptemp= []
        subsub= subsub.split(" ").map(&:to_i)
        temp<< subsub
    end
    h << temp
end

bingo = [4,75,74,31,76,79,27,19,69,46,98,59,83,23,90,52,87,6,11,92,80,51,43,5,94,17,15,67,25,30,48,47,62,71,85,58,60,1,72,99,3,35,42,10,96,49,37,36,8,44,70,40,45,39,0,63,2,78,68,53,50,77,20,55,38,86,54,93,26,88,12,91,95,34,9,14,33,66,41,13,28,57,29,73,56,22,89,21,64,61,32,65,97,84,18,82,81,7,16,24]
j= 0

def checkwin?(array)
    array.each do |sub|
        subtran = sub.transpose
        if sub.any? {|subsub| subsub.all? {|num| num == "W"}} || subtran.any? {|subsub| subsub.all? {|num| num == "W"}}
            return true
        end
    end
    return false
end

def findanswer(array)
    counter= 0
    array.each do |sub|
        sub.each do |num|
            if num != "W"
                counter+= num
            end
        end
    end
    return counter
end

winner= 0
lastnum= 0
while j < bingo.length
    h.each_with_index do |sub, k|
        sub.each do |subsub|
            subsub.each_with_index do |num, i|
                if num == bingo[j]
                    subsub[i]= "W"
                    if checkwin?(h)
                        winner = k
                        lastnum= bingo[j]
                        p findanswer(h[winner])*lastnum
                        return
                    end
                end
            end
        end
    end
    j+=1
end

p winner
p lastnum