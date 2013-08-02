module Algorithms::Sort

  # Algorithm: Merge sort
  # Requirements:
  # Time complexity:
  # Space complexity:
  # Stable:
  #
  # Algorithms::Sort.merge_sort([..]) => [..]
  def self.merge_sort!(array, first, last)
    if first < last
      middle = ((first + last)/ 2).floor
      merge_sort!(array, first, middle)
      merge_sort!(array, middle + 1, last)
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