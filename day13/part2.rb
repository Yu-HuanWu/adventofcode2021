f= File.read("input")
g= f.split(("\n""\n"))
h=[]

g.each do |str|
    h<< str.split("\n")
end

corrdinates=[]


h[0].each do |pair|
    corrdinates<< pair.split(",").map(&:to_i)
end

corrhash= Hash.new(0)

corrdinates.each do |corrdinate|
    corrhash[corrdinate]+=1
end

folds=[]
h[1].each do |fold|
    words= fold.split(" ")
    axis, val = words[-1].split("=")
    val= val.to_i
    folds << [axis, val]
end

def y_fold(points, axis)
    output= Hash.new(0)
    points.each do |point|
        if point[1] > axis
            delta = point[1]- axis
            y= axis - delta
            output[[point[0], y]]+=1
        else 
            output[[point[0], point[1]]] +=1
        end
    end
    return output.keys
end

def x_fold(points, axis)
    output= Hash.new(0)
    points.each do |point|
        if point[0] > axis
            delta= point[0]- axis
            x= axis- delta
            output[[x, point[1]]] +=1
        else
            output[[point[0], point[1]]]+=1
        end
    end
    return output.keys
end

def fold(points, folds)
    result= Hash.new(0)
    folds.each do |fold|
        if fold[0] == "x"
            x_fold(points, fold[1]).each do |key|
                result[key] +=1
            end
        else
            y_fold(points, fold[1]).each do |key|
                result[key] +=1
            end
        end
    end
    result.keys.select {|array| array.none? {|num| num < 0}}
end

def print(codes)
    x_range= 0
    y_range= 0
    codes.each do |code|
        if code[0]> x_range
            x_range = code[0]
        end
        if code[1]> y_range
            y_range = code[1]
        end
    end
    p x_range
    p y_range
    grid=Array.new(y_range+1) {Array.new(x_range+1, ".")}
    codes.each do |code|
        grid[code[1]][code[0]]= "#"
    end
    grid.each_with_index do |row, i|
        grid[i]=row.join('')
    end
    grid
end

i= 0
temp = corrhash.keys
while i< folds.length
    temp = fold(temp, [folds[i]])
    i+=1
end
puts print(temp)

