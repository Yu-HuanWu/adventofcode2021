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

def decode(array)
    num7= nil
    num1= nil
    num4= nil
    num8= nil

    num2= nil
    num3= nil
    num5= nil
    num6= nil
    num9= nil
    num0= nil
    array[0].each do |code|
        if code.length == 3
            num7= code.split("").sort
        end
        if code.length == 2
            num1= code.split("").sort
        end
        if code.length == 4
            num4= code.split("").sort
        end
        if code.length == 7
            num8= code.split("").sort
        end
    end
    array[0].each do |code|
        if code.length == 6 && num4.all? {|char| code.split("").include?(char)}
            num9= code.split("").sort
        end
        if code.length == 6 && ((code.split("").include?(num1[0])&& !code.split("").include?(num1[1])) || (code.split("").include?(num1[1])&& !code.split("").include?(num1[0])))
            num6= code.split("").sort
        end
    end
    miss5= num4-num6

    array[0].each do |code|
        if code.length == 5 && !code.split("").include?(*miss5)
            num5= code.split("").sort
        end
    end

    array[0].each do |code|
        temp= code.split("")-num5
        if code.length == 5 && temp.length==2
            num2= code.split("").sort
        end
        if code.length == 5 && temp.length==1
            num3= code.split("").sort
        end
    end

    array[0].each do |code|
        if ![num1, num2, num3, num4, num5, num6, num7, num8, num9].include?(code.split("").sort) && code.length == 6
            num0=code.split("").sort
        end
    end
    result=[]
    array[1].each do |code|
        if code.split("").sort == num1
            result<< 1
        elsif code.split("").sort == num2
            result<< 2
        elsif code.split("").sort == num3
            result<< 3
        elsif code.split("").sort == num4
            result<< 4
        elsif code.split("").sort == num5
            result<< 5
        elsif code.split("").sort == num6
            result<< 6
        elsif code.split("").sort == num7
            result<< 7
        elsif code.split("").sort == num8
            result<< 8
        elsif code.split("").sort == num9
            result<< 9
        elsif code.split("").sort == num0
            result<< 0
        end
    end
    result.join.to_i
end

counter= 0
one4seven8 = [7, 4, 2, 3]
h.each do |sub|
    counter+= decode(sub)
end

p decode([["acedgfb", "cdfbe", "gcdfa", "fbcad", "dab", "cefabd", "cdfgeb", "eafb", "cagedb", "ab"], ["cdfeb", "fcadb", "cdfeb", "cdbaf"]])
p counter