require 'test/unit'
require_relative '../../../lib/algorithms/sort/sort'
include Algorithms

class TestHeapSort < Test::Unit::TestCase

  def test_should_handle_array_with_one_element
    array = [1]
    Sort.heap_sort(array)
    assert_equal([1], array)
  end

  def test_should_correctly_sort
    array = [3, 6, 8, 9, 4, 1, 7, 2, 5]
    Sort.heap_sort(array)
    assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], array)
  end

end