require 'test/unit'
require_relative '../../lib/datastructure'

class TestHeap < Test::Unit::TestCase

  def test_heap_can_be_constructed_from_existing_array
    array = [1, 3, 2]
    heap = DataStructure::MaxHeap.new(array)
    refute(heap.is_empty?)
  end

  def test_that_one_element_is_a_heap
    heap = DataStructure::MaxHeap.new([1])
    assert(heap.is_a_heap?)
  end

  def test_that_original_heap_is_still_heap
    heap = DataStructure::MaxHeap.new([5, 4, 2, 1, 3])
    assert(heap.is_a_heap?)
  end

  def test_that_first_element_can_be_inserted
    heap = DataStructure::MaxHeap.new
    heap.insert(1)
    heap.is_a_heap?
  end

  def test_that_subsequent_element_can_be_inserted
    heap = DataStructure::MaxHeap.new([1, 2, 3])
    heap.insert(4)
    heap.is_a_heap?
  end

  def test_that_peek_returns_the_biggest_element
    heap = DataStructure::MaxHeap.new([1, 2, 3, 4, 5, 10])
    assert_equal(10, heap.peek)
  end

  def test_that_peek_handles_empty_heap
    heap = DataStructure::MaxHeap.new()
    refute(heap.peek)
  end

  def test_that_pop_handles_empty_heap
    heap = DataStructure::MaxHeap.new
    refute(heap.pop)
  end

  def test_that_pop_handles_single_element_heap
    heap = DataStructure::MaxHeap.new([1])
    assert_equal(1, heap.pop)
    assert_equal(0, heap.size)
  end

  def test_that_pop_handles_multiple_element_heap
    heap = DataStructure::MaxHeap.new([1, 2, 3, 4, 5, 10, 11])
    assert_equal(11, heap.pop)
    assert_equal(6, heap.size)
    assert(heap.is_a_heap?)
  end

  def test_that_min_heap_is_correct
    heap = DataStructure::MinHeap.new([10, 2, 4, 6, 90])
    assert_equal(2, heap.pop)
    assert_equal(4, heap.pop)
  end

end