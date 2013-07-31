module Algorithms::Sort

  # Algorithm: Heap sort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.heap_sort([..]) => [..]
  def self.heap_sort(array)
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


  # Algorithm: Insertion sort
  # Requirements:
  # Time complexity:
  # Space complexity:
  # Stable:
  #
  # Algorithms::Sort.insertion_sort([..]) => [..]
  def self.insertion_sort(array)
    array.each_with_index do |element, count|
      next if count == 0
      i = count - 1
      while array[i] > element and i >= 0
        array[i+1] = array[i]
        i -= 1
      end
      array[i+1] = element
    end
  end


  # Algorithm: Merge sort
  # Requirements:
  # Time complexity:
  # Space complexity:
  # Stable:
  #
  # Algorithms::Sort.merge_sort([..]) => [..]
  def self.merge_sort(array, first, last)
    if first < last
      middle = ((first + last)/ 2).floor
      merge_sort(array, first, middle)
      merge_sort(array, middle + 1, last)
      merge(array, first, middle, last)
    end
    array
  end

  def self.merge(array, first, middle, last)
    first_array = array[first..middle] << Float::INFINITY
    second_array = array[middle + 1..last] << Float::INFINITY
    first_counter = 0
    second_counter = 0
    (first..last).each do |n|
      if first_array[first_counter] < second_array[second_counter]
        array[n] = first_array[first_counter]
        first_counter += 1
      else
        array[n] = second_array[second_counter]
        second_counter += 1
      end
    end
  end
end