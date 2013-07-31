module Algorithms::MaximumSubarray

  # Algorithm: Kadane's algorithm for finding maximum subarray
  # Requirements:
  # Time complexity: O(n)
  # Space complexity: O(1)
  #
  # Algorithms::MaximumSubarray.kadanes_algorithm(..) => (..)
  def self.kadanes_algorithm(array)
    max_so_far = max_ending_here = array[0]
    start_index = end_index = max_so_far_start_index = max_so_far_end_index = 0
    array.drop(1).each_with_index do |element, index|
      # max_ending_here = [element, max_ending_here + element].maximum_subarray
      if element > max_ending_here + element
        max_ending_here = element
        start_index = end_index = index + 1
      else
        max_ending_here = max_ending_here + element
        end_index = index + 1
      end

      # max_so_far = [max_so_far, max_ending_here].maximum_subarray
      if max_ending_here > max_so_far
        max_so_far = max_ending_here
        max_so_far_start_index = start_index
        max_so_far_end_index = end_index
      end
    end
    [max_so_far_start_index, max_so_far_end_index, max_so_far]
  end


  # Algorithm: Maximum subarray with divide and conquer
  # Requirements:
  # Time complexity: O(n ln n)
  # Space complexity: O(1)
  #
  # Algorithms::MaximumSubarray.divide_and_conquer(..) => (..)
  def self.divide_and_conquer(array, low, high)
    return low, high, array[low] if low == high
    mid = (low + high)/2
    left_low, left_high, left_sum = divide_and_conquer(array, low, mid)
    right_low, right_high, right_sum = divide_and_conquer(array, mid + 1, high)
    cross_low, cross_high, cross_sum = find_max_crossing_subarray(array, low, mid, high)
    if left_sum >= right_sum and left_sum >= cross_sum
      return left_low, left_high, left_sum
    elsif right_sum >= left_sum and right_sum >= cross_sum
      return right_low, right_high, right_sum
    else
      return cross_low, cross_high, cross_sum
    end
  end


  def self.find_max_crossing_subarray(array, low, mid, high)
    raise RuntimeError, 'Array must have at least two elements' if array.length < 2
    left_sum = -Float::INFINITY
    sum = 0
    max_left = 0
    mid.downto(low) do |i|
      sum = sum + array[i]
      if sum > left_sum
        left_sum = sum
        max_left = i
      end
    end

    right_sum = -Float::INFINITY
    sum = 0
    max_right = 0
    (mid + 1).upto(high) do |i|
      sum = sum + array[i]
      if sum > right_sum
        right_sum = sum
        max_right = i
      end
    end
    return max_left, max_right, left_sum + right_sum
  end
end