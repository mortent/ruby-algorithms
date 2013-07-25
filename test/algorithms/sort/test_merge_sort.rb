require 'test/unit'
require_relative '../../../lib/algorithms/sort/sort'
include Algorithms

class TestMergeSort < Test::Unit::TestCase

  def test_merge_correct_with_one_element
    assert_equal([1], Sort.merge([1], 0, 0, 0))
  end

  def test_merge_correct_with_two_elements
    assert_equal([1, 2], Sort.merge([2, 1], 0, 0, 1))
  end

  def test_merge_correct_with_three_elements
    assert_equal([1, 2, 3], Sort.merge([1, 3, 2], 0, 1, 2))
  end

  def test_merge_correct_with_multiple_elements
    assert_equal([1, 2, 3, 4, 5, 6] , Sort.merge([1,3,4,2,5,6], 0, 2, 5))
  end

  def test_merge_sort_correct_with_two_element
    assert_equal([1,2], Sort.merge_sort([2, 1], 0, 1))
  end

  def test_merge_sort_correct_with_even_number_of_elements
    assert_equal([1, 2, 3, 4], Sort.merge_sort([3, 2, 4, 1], 0, 3))
  end

  def test_merge_sort_correct_with_odd_number_of_elements
    assert_equal([1, 2, 3, 4, 5], Sort.merge_sort([5, 4, 1, 3, 2], 0, 4))
  end

end