module DataStructure

  module Heap

    def self.parent(i)
      return nil if i == 0
      ((i + 1) / 2) - 1
    end


    def self.left(i)
      (2 * (i + 1)) - 1
    end


    def self.right(i)
      (2 * (i + 1))
    end


    def self.max_heapify(array, heap_size, i)
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


    def self.verify_maxheap(array, heap_size, i)
      return if i > heap_size - 1
      if parent(i) and array[i] > array[parent(i)]
        raise RuntimeError, "Heap properties not satisfied. Parent value: #{array[parent(i)]}, child value: #{array[i]}."
      end
      verify_maxheap(array, heap_size, left(i))
      verify_maxheap(array, heap_size, right(i))
    end


    def self.build_max_heap(array)
      heap_size = array.length
      (heap_size - 1).downto(0) do |i|
        max_heapify(array, heap_size, i)
      end
    end


  end

end