require 'test/unit'
require_relative '../../../lib/algorithms'

class TestCountingSort < Test::Unit::TestCase

  def test_should_correctly_sort_one_element_array
    assert_equal([1], Algorithms::Sort.countingsort([1], 1))
  end

  def test_should_correctly_sort_two_element_array
    assert_equal([0, 2], Algorithms::Sort.countingsort([0, 2], 3))
  end

  def test_should_correctly_sort_an_odd_number_of_elements
    array = [3,5,2,4,1]
    assert_equal(array.sort, Algorithms::Sort.countingsort(array, 10))
  end

  def test_should_correctly_sort_an_even_number_of_elements
    array = [3, 5, 2, 4, 1, 10, 0, 50]
    assert_equal(array.sort, Algorithms::Sort.countingsort(array, 50))
  end

end