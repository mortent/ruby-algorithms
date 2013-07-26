module Algorithms

  module Max

    # Algorithm: Maximum subarray
    # Requirements:
    # Time complexity:
    # Space complexity:
    # Stable:
    #
    # Algorithms::Sort.find_maximum_subarray(..) => (..)
    def self.find_maximum_subarray(array, low, high)
      return low, high, array[low] if low == high
      mid = (low + high)/2
      left_low, left_high, left_sum = find_maximum_subarray(array, low, mid)
      right_low, right_high, right_sum = find_maximum_subarray(array, mid + 1, high)
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

end