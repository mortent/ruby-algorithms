module Algorithms::Sort

# Algorithm: Randomized quicksort
# Requirements:
# Time complexity: O(n ln n)
# Space complexity: O(1)
# Stable:
#
# Algorithms::Sort.randomized_quicksort([..]) => [..]
  def self.randomized_quicksort!(array, low, high)
    if low < high
      split = randomized_partition!(array, low, high)
      randomized_quicksort!(array, low, split - 1)
      randomized_quicksort!(array, split + 1, high)
    end
  end

  def self.randomized_partition!(array, low, high)
    p = rand(low..high)
    swap!(array, p, high)
    partition!(array, low, high)
  end


# Algorithm: Quicksort
# Requirements:
# Time complexity: O(n ln n)
# Space complexity: O(1)
# Stable:
#
# Algorithms::Sort.quicksort([..]) => [..]
  def self.quicksort!(array, low, high)
    if low < high
      split = partition!(array, low, high)
      quicksort!(array, low, split - 1)
      quicksort!(array, split + 1, high)
    end
  end

  def self.partition!(array, low, high)
    x = array[high]
    i = low - 1
    (low..high - 1).each do |j|
      if array[j] <= x
        i = i + 1
        swap!(array, i, j)
      end
    end
    swap!(array, i + 1, high)
    i + 1
  end


  def self.swap!(array, index1, index2)
    temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
  end

end

