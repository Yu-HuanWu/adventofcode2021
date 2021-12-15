f= File.read("input")
g= f.split(("\n"))
h= []
g.each do |str|
    h<< str.split("").map(&:to_i)
end
p h

