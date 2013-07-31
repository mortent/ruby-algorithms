require 'test/unit'
require_relative '../../../lib/algorithms'
include Algorithms

class TestInsertionSort < Test::Unit::TestCase

  def test_insertion_sort_two_numbers_correct
    test_array = [2, 1]
    assert_equal([1, 2], Sort.insertion_sort(test_array))
  end

  def test_insertion_sort_multiple_numbers
    test_array = [3, 2, 1, 5, 4]
    assert_equal([1, 2, 3, 4, 5], Sort.insertion_sort(test_array))
  end

end