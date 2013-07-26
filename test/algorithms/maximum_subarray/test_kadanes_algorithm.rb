require 'test/unit'
require_relative '../../../lib/algorithms/maximum_subarray/maximum_subarray'
include Algorithms

class TestMaximumSubarray < Test::Unit::TestCase

  def test_should_find_maximum_subarray
    test_array = [-1, -2, 5, -3, 3, 4, 5, 6, -2]
    assert_equal([2, 7, 20], MaximumSubarray.kadanes_algorithm(test_array))
  end

  def test_should_find_maximum_subarray_with_only_negative_numbers
    test_array = [-1, -2, -5, -3, -3, -4, -5, -6, -2]
    assert_equal([0, 0, -1], MaximumSubarray.kadanes_algorithm(test_array))
  end

  def test_should_find_maximum_subarray_with_two_elements
    test_array = [1, 2]
    assert_equal([0, 1, 3], MaximumSubarray.kadanes_algorithm(test_array))
  end

end