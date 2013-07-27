require 'test/unit'
require_relative '../../../lib/data_structure/heap/heap'
include DataStructure

class TestHeap < Test::Unit::TestCase

  def test_can_find_index_of_parent_in_heap
    assert_equal(0, Heap.parent(1))
  end

  def test_returns_nil_for_parent_of_top_node
    assert_equal(nil, Heap.parent(0))
  end

  def test_finds_correct_parent_for_right_childnode
    assert_equal(0, Heap.parent(2))
  end

  def test_can_find_left_childnode_of_top_node
    assert_equal(1, Heap.left(0))
  end

  def test_can_find_left_childnode_of_interior_node
    assert_equal(3, Heap.left(1))
  end

  def test_can_find_right_childnode_of_top_node
    assert_equal(2, Heap.right(0))
  end

  def test_can_find_right_childnode_of_interior_node
    assert_equal(4, Heap.right(1))
  end

  SAMPLE_HEAP = [1, 4, 5, 2, 3]

  def test_max_heapify_correctly_handles_single_node_heap
    heap = SAMPLE_HEAP
    Heap.max_heapify(heap, 1, 0)
    assert_equal(SAMPLE_HEAP, heap)
  end

  def test_max_heapify_correctly_creates_the_heap
    heap = SAMPLE_HEAP
    Heap.max_heapify(heap, heap.length, 0)
    assert_equal([5, 4, 1, 2, 3], heap)
  end

  def test_verify_heap_handles_single_value_heaps
    Heap.verify_maxheap([1], 1, 0)
  end

  def test_verify_heap_identifies_incorrect_heap
    assert_raises(RuntimeError) {Heap.verify_maxheap([5, 4, 3, 6, 2], 5, 0)}
  end

  def test_verify_heap_indentifies_correct_heap
    Heap.verify_maxheap([6, 5, 2, 4, 3, 1], 6, 0)
  end

  def test_build_heap_handles_single_value_array
    array = [1]
    Heap.build_max_heap(array)
    assert_equal([1], array)
  end

  def test_build_heap_correctly_creates_maxheap
    array = [3, 6, 1, 5, 8, 9, 7, 2, 4]
    Heap.build_max_heap(array)
    Heap.verify_maxheap(array, array.length, 0)
  end

end