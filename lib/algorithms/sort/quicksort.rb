module Algorithms::Sort

  class Quicksort
    def sort!(array, low, high)
      if low < high
        split = partition!(array, low, high)
        sort!(array, low, split - 1)
        sort!(array, split + 1, high)
      end
    end

    def randomized_sort!(array, low, high)
      if low < high
        split = randomized_partition!(array, low, high)
        randomized_sort!(array, low, split - 1)
        randomized_sort!(array, split + 1, high)
      end
    end

    private

    def randomized_partition!(array, low, high)
      p = rand(low..high)
      swap!(array, p, high)
      partition!(array, low, high)
    end

    def partition!(array, low, high)
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

    def swap!(array, index1, index2)
      temp = array[index1]
      array[index1] = array[index2]
      array[index2] = temp
    end
  end


  # Algorithm: Randomized quicksort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.randomized_quicksort!([..]) => [..]
  def self.randomized_quicksort!(array)
    quicksort = Quicksort.new
    quicksort.randomized_sort!(array, 0, array.length - 1)
    array
  end


  # Algorithm: Quicksort
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  # Stable:
  #
  # Algorithms::Sort.quicksort!([..]) => [..]
  def self.quicksort!(array)
    quicksort = Quicksort.new
    quicksort.sort!(array, 0, array.length - 1)
    array
  end

end

