require 'test/unit'
require_relative '../../../lib/algorithms'

class TestQuicksort < Test::Unit::TestCase

  def test_single_element_array_is_handled_correctly
    Algorithms::Sort.quicksort([1],0,0)
  end

  def test_two_element_array_is_sorted_correctly
    array = [2, 1]
    Algorithms::Sort.quicksort(array, 0, 1)
    assert_equal([1, 2], array)
  end

  def test_odd_number_of_element_array_is_sorted_correctly
    array = [2, 5, 3, 4, 1]
    Algorithms::Sort.quicksort(array, 0, 4)
    assert_equal([1, 2, 3, 4, 5], array)
  end

  def test_even_number_of_element_array_is_sorted_correctly
    array = [2, 1, 5, 4, 6, 3]
    Algorithms::Sort.quicksort(array, 0, 5)
    assert_equal([1, 2, 3, 4, 5, 6], array)
  end

end