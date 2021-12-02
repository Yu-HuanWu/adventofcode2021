f= File.read("input")
g= f.split(("\n"))

horizontal = 0
depth = 0

g.each do |move|
    temp= move.split(" ")
    if temp[0]== "forward"
        horizontal+= temp[1].to_i
    elsif temp[0]== "up"
        depth-= temp[1].to_i
    elsif temp[0]== "down"
        depth+= temp[1].to_i
    end
end

p horizontal*depth