require 'test/unit'
require_relative '../../../lib/algorithms/max/max'
include Algorithms

class TestMaximumSubarray < Test::Unit::TestCase

  def test_should_identify_correct_max_crossing_subarray
    test_array = [-1, -2, 5, -3, 3, 4, 5, 6, -2]
    cross_left, cross_right, cross_sum = Max.find_max_crossing_subarray(test_array, 0, 5, test_array.length - 1)
    assert_equal(2, cross_left)
    assert_equal(7, cross_right)
    assert_equal(20, cross_sum)
  end

  def test_should_identify_correct_max_crossing_subarray_from_only_two_elements
    test_array = [1, -1]
    cross_left, cross_right, cross_sum = Max.find_max_crossing_subarray(test_array, 0,0,1)
    assert_equal(0, cross_left)
    assert_equal(1, cross_right)
    assert_equal(0, cross_sum)
  end

  def test_should_throw_exception
    assert_raises(RuntimeError) {Max.find_max_crossing_subarray([1], 0, 0, 0)}
  end

  def test_should_find_max_subarray
    test_array = [-1, -2, 5, -3, 3, 4, 5, 6, -2]
    left, right, sum = Max.find_maximum_subarray(test_array, 0, 8)
    assert_equal(2, left)
    assert_equal(7, right)
    assert_equal(20, sum)
  end

end