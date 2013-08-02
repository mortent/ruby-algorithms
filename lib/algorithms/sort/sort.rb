module Algorithms::Sort

  # Algorithm: Countingsort
  # Requirements:
  # Time complexity: O(n)
  # Space complexity:
  # Stable: Yes
  #
  # Algorithms::Sort.counting_sort([..]) => [..]
  def self.counting_sort(array, k)
    c = Array.new(k + 1, 0)
    b = Array.new(array.length)
    array.each {|element| c[element] += 1}
    (0..k).inject(-1) {|sum, i| c[i] = sum + c[i]}
    array.reverse.each do |element|
      b[c[element]] = element
      c[element] -= 1
    end
    b
  end


  # Algorithm: Randomized quicksort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.randomized_quicksort([..]) => [..]
  def self.randomized_quicksort(array, low, high)
    if low < high
      split = randomized_partition(array, low, high)
      randomized_quicksort(array, low, split - 1)
      randomized_quicksort(array, split + 1, high)
    end
  end

  def self.randomized_partition(array, low, high)
    p = rand(low..high)
    swap(array, p, high)
    partition(array, low, high)
  end


  # Algorithm: Quicksort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.quicksort([..]) => [..]
  def self.quicksort(array, low, high)
    if low < high
      split = partition(array, low, high)
      quicksort(array, low, split - 1)
      quicksort(array, split + 1, high)
    end
  end

  def self.partition(array, low, high)
    x = array[high]
    i = low - 1
    (low..high - 1).each do |j|
      if array[j] <= x
        i = i + 1
        swap(array, i, j)
      end
    end
    swap(array, i + 1, high)
    i + 1
  end


  def self.swap(array, index1, index2)
    temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
  end


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