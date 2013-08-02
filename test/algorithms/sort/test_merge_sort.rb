require 'test/unit'
require_relative '../../../lib/algorithms'

class TestMergeSort < Test::Unit::TestCase

  def test_merge_correct_with_one_element
    test_array = [1]
    Algorithms::Sort.merge(test_array, 0, 0, 0)
    assert_equal([1], test_array)
  end

  def test_merge_correct_with_two_elements
    test_array = [2, 1]
    Algorithms::Sort.merge(test_array, 0, 0, 1)
    assert_equal([1, 2], test_array)
  end

  def test_merge_correct_with_three_elements
    test_array = [1, 3, 2]
    Algorithms::Sort.merge(test_array, 0, 1, 2)
    assert_equal([1, 2, 3], test_array)
  end

  def test_merge_correct_with_multiple_elements
    test_array = [1, 3, 4, 2, 5, 6]
    Algorithms::Sort.merge(test_array, 0, 2, 5)
    assert_equal([1, 2, 3, 4, 5, 6] , test_array)
  end

  def test_merge_sort_correct_with_two_element
    assert_equal([1,2], Algorithms::Sort.merge_sort!([2, 1], 0, 1))
  end

  def test_merge_sort_correct_with_even_number_of_elements
    assert_equal([1, 2, 3, 4], Algorithms::Sort.merge_sort!([3, 2, 4, 1], 0, 3))
  end

  def test_merge_sort_correct_with_odd_number_of_elements
    assert_equal([1, 2, 3, 4, 5], Algorithms::Sort.merge_sort!([5, 4, 1, 3, 2], 0, 4))
  end

end