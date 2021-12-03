f= File.read("input")
g= f.split(("\n"))

gamma = []
epsilon = []

i= 0

while i < g[1].length
    one= 0
    zero = 0
    g.each do |num|
        if num[i]=== "1"
            one+=1
        elsif num[i]==="0"
            zero+=1
        end
    end
    if one > zero
        gamma << 1
        epsilon << 0
    else
        gamma << 0
        epsilon << 1
    end
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

p Binary.to_decimal(gamma.join(""))*Binary.to_decimal(epsilon.join(""))
