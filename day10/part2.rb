f= File.read("input")
g= f.split(("\n"))

g.map! {|str| str.split("")}

g.each_with_index do |str, i|
    tracking = []
    str.each do |char|
        if char == "("
            tracking << ")"
        elsif char == ")"
            if tracking[-1] == ")"
                tracking.pop
            else
                g[i]= ["CORRUPTED"]
                break
            end
        elsif char == "["
            tracking << "]"
        elsif char == "]"
            if tracking[-1] == "]"
                tracking.pop
            else
                g[i]= ["CORRUPTED"]
                break
            end
        elsif char == "{"
            tracking << "}"
        elsif char == "}"
            if tracking[-1] == "}"
                tracking.pop
            else
                g[i]= ["CORRUPTED"]
                break
            end
        elsif char == "<"
            tracking << ">"
        elsif char == ">"
            if tracking[-1] == ">"
                tracking.pop
            else
                g[i]= ["CORRUPTED"]
                break
            end
        end
    end
end

h= g.select {|str| str != ["CORRUPTED"]}

# testing= "<{([{{}}[<[[[<>{}]]]>[]]"
# testing=testing.split("")
# h= [testing]

allclosing=[]
h.each do |str|
    closing = []
    str.each do |char|
        if char == "("
            closing << ")"
        elsif char == ")"
            if closing[-1] == ")"
                closing.pop
            end
        elsif char == "["
            closing << "]"
        elsif char == "]"
            if closing[-1] == "]"
                closing.pop
            end
        elsif char == "{"
            closing << "}"
        elsif char == "}"
            if closing[-1] == "}"
                closing.pop
            end
        elsif char == "<"
            closing << ">"
        elsif char == ">"
            if closing[-1] == ">"
                closing.pop
            end
        end
    end
    allclosing<< closing.reverse
end

points=[]
allclosing.each do |closer|
    point= 0
    closer.each do |char|
        if char== "]"
            n= point*5
            m= n+2
            point = m
        elsif char== ")"
            point*=5
            point+=1
        elsif char== "}"
            point*=5
            point+=3
        elsif char== ">"
            point*=5
            point+=4
        end
    end
    points<< point
end

p points.sort[points.length/2]
