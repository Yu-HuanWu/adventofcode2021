input= [5,1,1,3,1,1,5,1,2,1,5,2,5,1,1,1,4,1,1,5,1,1,4,1,1,1,3,5,1,1,1,1,1,1,1,1,1,4,4,4,1,1,1,1,1,4,1,1,1,1,1,5,1,1,1,4,1,1,1,1,1,3,1,1,4,1,4,1,1,2,3,1,1,1,1,4,1,2,2,1,1,1,1,1,1,3,1,1,1,1,1,2,1,1,1,1,1,1,1,4,4,1,4,2,1,1,1,1,1,4,3,1,1,1,1,2,1,1,1,2,1,1,3,1,1,1,2,1,1,1,3,1,3,1,1,1,1,1,1,1,1,1,3,1,1,1,1,3,1,1,1,1,1,1,2,1,1,2,3,1,2,1,1,4,1,1,5,3,1,1,1,2,4,1,1,2,4,2,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,4,3,1,2,1,2,1,5,1,2,1,1,5,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,1,1,1,1,3,1,1,5,1,1,1,1,5,1,4,1,1,1,4,1,3,4,1,4,1,1,1,1,1,1,1,1,1,3,5,1,3,1,1,1,1,4,1,5,3,1,1,1,1,1,5,1,1,1,2,2]

def laternfish(fishes, days)
    hash= Hash.new(0)
    fishes.each do |num|
        hash[num]+=1
    end
    days.times do 
        i= 0
        newfish=0
        new7=0
        new6=0
        new5=0
        new4=0
        new3=0
        new2=0
        new1=0
        new0=0
        while i < 9
            if hash[i] > 0 && i==0
                newfish+= hash[i]
                new6+= hash[i]
            elsif hash[i] > 0 && i == 1
                new0+= hash[i]
            elsif hash[i] > 0 && i == 2
                new1+= hash[i]
            elsif hash[i] > 0 && i == 3
                new2+= hash[i]
            elsif hash[i] > 0 && i == 4
                new3+= hash[i]
            elsif hash[i] > 0 && i == 5
                new4+= hash[i]
            elsif hash[i] > 0 && i == 6
                new5+= hash[i]
            elsif hash[i] > 0 && i == 7
                new6+= hash[i]
            elsif hash[i] > 0 && i == 8
                new7+= hash[i]
            end
            i+=1
        end
        hash[8]= newfish
        hash[7]= new7
        hash[6]= new6
        hash[5]= new5
        hash[4]= new4
        hash[3]= new3
        hash[2]= new2
        hash[1]= new1
        hash[0]= new0
    end
    hash.values.sum
end

p laternfish(input, 80)
p laternfish(input, 256)