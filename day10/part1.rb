f= File.read("input")
g= f.split(("\n"))

g.map! {|str| str.split("")}

illegal= []
g.each do |str|
    tracking = []
    str.each do |char|
        if char == "("
            tracking << ")"
        elsif char == ")"
            if tracking[-1] == ")"
                tracking.pop
            else
                illegal << char
                break
            end
        elsif char == "["
            tracking << "]"
        elsif char == "]"
            if tracking[-1] == "]"
                tracking.pop
            else
                illegal << char
                break
            end
        elsif char == "{"
            tracking << "}"
        elsif char == "}"
            if tracking[-1] == "}"
                tracking.pop
            else
                illegal << char
                break
            end
        elsif char == "<"
            tracking << ">"
        elsif char == ">"
            if tracking[-1] == ">"
                tracking.pop
            else
                illegal << char
                break
            end
        end
    end
end
p illegal.length
points= 0
illegal.each do |char|
    if char == ")"
        points+=3
    elsif char == "]"
        points+=57
    elsif char == "}"
        points += 1197
    elsif char == ">"
        points += 25137
    end
end

p points