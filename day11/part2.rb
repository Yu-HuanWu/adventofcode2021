f= "4738615556
6744423741
2812868827
8844365624
4546674266
4518674278
7457237431
4524873247
3153341314
3721414667"

# f= "5483143223
# 2745854711
# 5264556173
# 6141336146
# 6357385478
# 4167524645
# 2176841721
# 6882881134
# 4846848554
# 5283751526"

f= f.split(("\n"))
g= []
f.each do |str|
    g<<str.split("").map(&:to_i)
end

def lightup(array, row, col)
    # p array
    if array[row][col] < 10 && array[row][col] != 0
        array[row][col]+=1
        # return
    end
    if array[row][col]>=10
        array[row][col]=0
        if row+1 >= 0 && row+1 <10 && col >= 0 && col < 10
            # array[row+1][col]+=1
            lightup(array, row+1, col)
        end
        if row-1 >= 0 && row-1 <10 && col >= 0 && col < 10
            # array[row-1][col]+=1
            lightup(array, row-1, col)
        end
        if row+1 >= 0 && row+1 <10 && col-1 >= 0 && col-1 < 10
            # array[row+1][col-1]+=1
            lightup(array, row+1, col-1)
        end
        if row-1 >= 0 && row-1 <10 && col-1 >= 0 && col-1 < 10
            # array[row-1][col-1]+=1
            lightup(array, row-1, col-1)
        end
        if row >= 0 && row <10 && col-1 >= 0 && col-1 < 10
            # array[row][col-1]+=1
            lightup(array, row, col-1)
        end
        if row+1 >= 0 && row+1 <10 && col+1 >= 0 && col+1 < 10
            # array[row+1][col+1]+=1
            lightup(array, row+1, col+1)
        end
        if row-1 >= 0 && row-1 <10 && col+1 >= 0 && col+1 < 10
            # array[row+1][col]+=1
            lightup(array, row-1, col+1)
        end
        if row >= 0 && row <10 && col+1 >= 0 && col+1 < 10
            # array[row+1][col-1]+=1
            lightup(array, row, col+1)
        end
    end
end

i = 0
count= 0
while i< 300
    g.map! {|sub| sub.map! {|num| num+=1}}
    row= 0
    while row < g.length
        col= 0
        while col< g.length
            if g[row][col] > 9
                lightup(g, row, col)
            end
            col+=1
        end
        row+=1
    end
    if g.flatten.all?{|num| num == 0}
        p i+1
        return
    end
    i+=1
end