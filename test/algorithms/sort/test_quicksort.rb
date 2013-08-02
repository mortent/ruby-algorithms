require 'test/unit'
require_relative '../../../lib/algorithms'

class TestQuicksort < Test::Unit::TestCase

  EVEN_NUMBER_OF_ELEMENTS_ARRAY = [2, 1, 5, 4, 6, 3]

  ODD_NUMBER_OF_ELEMENTS_ARRAY = [2, 5, 3, 4, 1]

  def test_single_element_array_is_handled_correctly
    Algorithms::Sort.quicksort!([1])
  end

  def test_two_element_array_is_sorted_correctly
    array = [2, 1]
    Algorithms::Sort.quicksort!(array)
    assert_equal([1, 2], array)
  end

  def test_odd_number_of_element_array_is_sorted_correctly
    Algorithms::Sort.quicksort!(ODD_NUMBER_OF_ELEMENTS_ARRAY)
    assert_equal([1, 2, 3, 4, 5], ODD_NUMBER_OF_ELEMENTS_ARRAY)
  end

  def test_even_number_of_element_array_is_sorted_correctly
    Algorithms::Sort.quicksort!(EVEN_NUMBER_OF_ELEMENTS_ARRAY)
    assert_equal([1, 2, 3, 4, 5, 6], EVEN_NUMBER_OF_ELEMENTS_ARRAY)
  end

  def test_odd_number_of_element_array_is_sorted_correctly_with_randomization
    Algorithms::Sort.randomized_quicksort!(ODD_NUMBER_OF_ELEMENTS_ARRAY)
    assert_equal([1, 2, 3, 4, 5], ODD_NUMBER_OF_ELEMENTS_ARRAY)
  end

  def test_even_number_of_element_array_is_sorted_correctly_with_randomization
    Algorithms::Sort.randomized_quicksort!(EVEN_NUMBER_OF_ELEMENTS_ARRAY)
    assert_equal([1, 2, 3, 4, 5, 6], EVEN_NUMBER_OF_ELEMENTS_ARRAY)
  end

end