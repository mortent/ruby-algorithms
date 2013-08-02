module Algorithms::Sort

  class Heapsort
    def sort(array)
      build_max_heap(array)
      heap_size = array.length
      (heap_size - 1).downto(1) do |i|
        temp = array[0]
        array[0] = array[i]
        array[i] = temp
        heap_size -= 1
        max_heapify(array, heap_size, 0)
      end
    end

    private

    def parent(i)
      return nil if i == 0
      ((i + 1) / 2) - 1
    end

    def left(i)
      (2 * (i + 1)) - 1
    end

    def right(i)
      (2 * (i + 1))
    end

    def max_heapify(array, heap_size, i)
      l = left(i)
      r = right(i)
      if l <= (heap_size - 1) and array[l] > array[i]
        largest = l
      else
        largest = i
      end
      if r <= (heap_size - 1) and array[r] > array[largest]
        largest = r
      end
      if largest != i
        temp = array[largest]
        array[largest] = array[i]
        array[i] = temp
        max_heapify(array, heap_size, largest)
      end
    end

    def build_max_heap(array)
      heap_size = array.length
      (heap_size - 1).downto(0) do |i|
        max_heapify(array, heap_size, i)
      end
    end
  end


  # Algorithm: Heap sort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.heapsort!([..]) => [..]
  def self.heapsort!(array)
    heapsort = Heapsort.new
    heapsort.sort(array)
    array
  end

end