f= File.read("input")
g= f.split(("\n"))

horizontal = 0
depth = 0
aim = 0

g.each do |move|
    temp= move.split(" ")
    if temp[0]== "forward"
        horizontal+= temp[1].to_i
        depth+= aim*temp[1].to_i
    elsif temp[0]== "up"
        aim-= temp[1].to_i
    elsif temp[0]== "down"
        aim+= temp[1].to_i
    end
end

p horizontal*depth