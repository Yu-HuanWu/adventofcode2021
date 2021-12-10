f= File.read("input")
g= f.split(("\n"))

g.map! {|str| str.split("")}

g.each do |str|
    tracking = []
    str.each do |char|
        if char == "("
            tracking << ")"
        elsif char == ")"
            
        end
    end
end