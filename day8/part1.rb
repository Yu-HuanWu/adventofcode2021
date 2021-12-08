f= File.read("input")
g= f.split(("\n"))
h=[]

g.each do |sub|
    temp=[]

    sub.split("|").each do |subsub|
        temp<< subsub.split(" ")
    end
    h<< temp
end

counter= 0
one4seven8 = [7, 4, 2, 3]
h.each do |sub|
    sub[1].each do |output|
        if one4seven8.include?(output.length)
            counter+=1
        end
    end
end
p counter