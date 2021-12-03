f= File.read("input")
g= f.split(("\n"))
h= f.split(("\n"))

leftover = []

i= 0

while i < 12
    one= 0
    zero = 0
    g.each do |num|
        if num[i]=== "1"
            one+=1
        elsif num[i]==="0"
            zero+=1
        end
    end
    if zero > one
        g.each do |num|
            if num[i]=== "0"
                leftover<< num
            end
        end
    else
        g.each do |num|
            if num[i]=== "1"
                leftover<< num
            end
        end
    end
    g=leftover
    leftover = []
    i+=1
end

class Binary
  def self.to_decimal(binary)
    raise ArgumentError if binary.match?(/[^01]/)

    binary.reverse.chars.map.with_index do |digit, index|
      digit.to_i * 2**index
    end.sum
  end
end

leftoverCO2 = []

j= 0

while j < 9
    one= 0
    zero = 0
    h.each do |num|
        if num[j]=== "1"
            one+=1
        elsif num[j]==="0"
            zero+=1
        end
    end
    if zero > one
        h.each do |num|
            if num[j]=== "1"
                leftoverCO2<< num
            end
        end
    else
        h.each do |num|
            if num[j]=== "0"
                leftoverCO2<< num
            end
        end
    end
    h= leftoverCO2
    leftoverCO2 = []
    j+=1
end

p Binary.to_decimal(g[0]) * Binary.to_decimal(h[0])
