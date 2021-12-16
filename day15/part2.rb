class MinHeap

  def initialize(elements=nil, &block)
    @heap = []
    @cmp = block || lambda { |a, b| a <=> b }
    replace(elements) if elements
  end

 protected

  attr_reader :heap

 public

  attr_reader :cmp

  def size
    heap.size
  end

  def <<(v)
    heap << v
    heapify_up! (size - 1)
    self
  end
  alias push <<

  def shift
    return nil if empty?
    swap_at! 0, (size - 1)
    r = heap.pop
    heapify_down! 0
    r
  end

  def first
    return nil if empty?
    heap.first
  end

  def empty?
    heap.empty?
  end

  def clear
    heap.clear
    self
  end

  def replace(elements)
    heap.replace(elements.to_a)
    sort!
    self
  end

  def to_a
    a = []
    dup.each_shift { |x| a << x }
    a
  end

  # TODO: Use a more efficient impl
  def swap(v)
    r = shift
    self << v
    r
  end

  def each_shift
    until empty?
      yield shift
    end
    nil
  end

  def inspect
    "<#{self.class}: size=#{size}, first=#{first || "nil"}>"
  end

  def ==(other)
    size == other.size && to_a == other.to_a
  end

 private

  def initialize_copy(other)
    @cmp = other.cmp
    @heap = other.heap.dup
  end

  def swap_at! i1, i2
    heap[i1], heap[i2] = heap[i2], heap[i1]
  end

  def heapify_up! index
    while index > 0
      parent = (index - 1) / 2
      if cmp.call(heap[parent], heap[index]) > 0
        swap_at! parent, index
        index = parent
      else
        break
      end
    end

    self
  end

  def heapify_down! index
    loop do
      next_index = index

      if 2 * index + 1 < size && cmp.call(heap[next_index], heap[2 * index + 1]) > 0
        next_index = 2 * index + 1
      end

      if 2 * index + 2 < size && cmp.call(heap[next_index], heap[2 * index + 2]) > 0
        next_index = 2 * index + 2
      end

      break if next_index == index

      swap_at! index, next_index
      index = next_index
    end

    self
  end

  def sort!
    (size / 2 - 1).downto(0) do |i|
      heapify_down! i
    end

    self
  end

end

f= File.read("input")
g= f.split(("\n"))
h= []
g.each do |str|
    h<< str.split("").map(&:to_i)
end

def cost(grid, x, y)
  xx = x / grid.size
  xm = x % grid.size
  yy = y / grid[0].size
  ym = y % grid[0].size
  ans = grid[xm][ym] + xx + yy
  ans = ans % 9
  ans = 9 if ans == 0
  ans
end

def dijkstra(grid, xmax, ymax, start, end_)
  dist = {}
  dist[start] = 0
  pqueue = MinHeap.new([start]) { |x, y| dist[x] <=> dist[y] }
  until pqueue.empty?
    x, y = pqueue.shift
    d = dist[[x, y]]
    return d if [x, y] == end_
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
      next unless (0..xmax) === x + dx && (0..ymax) === y + dy
      next if dist.has_key?([x + dx, y + dy])
      cost = cost(grid, x + dx, y + dy)
      dist[[x + dx, y + dy]] = d + cost
      pqueue << [x + dx, y + dy]
    end
  end
end

p dijkstra(h, (h.size * 5 - 1), (h[0].size * 5 - 1), [0, 0], [h.size * 5 - 1, h[0].size * 5 - 1])