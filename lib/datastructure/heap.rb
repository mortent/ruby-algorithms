class DataStructure::Heap

  def initialize(array = [])
    @elements = []
    array.each { |element| insert(element) } if not array.empty?
  end

  def is_empty?
    @elements.length == 0
  end

  def insert(element)
    @elements << element
    heapify_up(@elements.length - 1)
  end

  def peek
    @elements[0]
  end

  def pop
    return nil if @elements.empty?
    top_value = @elements[0]
    if @elements.length == 1
      @elements.delete_at(0)
    else
      @elements[0] = @elements.delete_at(@elements.length - 1)
      heapify_down(0)
    end
    top_value
  end

  def size
    @elements.length
  end

  def is_a_heap?(i = 0)
    return true if i > @elements.length - 1
    if parent(i) and is_first_element_top_most_element(@elements[i], @elements[parent(i)])
      return false
    end
    is_a_heap?(left(i)) and is_a_heap?(right(i))
  end

  private

  def heapify_up(i)
    return if not parent(i)
    if is_first_element_top_most_element(@elements[i], @elements[parent(i)])
      swap(i, parent(i))
      heapify_up(parent(i))
    end
  end

  def heapify_down(i)
    l = left(i)
    r = right(i)
    if l <= (@elements.length - 1) and is_first_element_top_most_element(@elements[l], @elements[i])
      largest = l
    else
      largest = i
    end
    if r <= (@elements.length - 1) and is_first_element_top_most_element(@elements[r], @elements[largest])
      largest = r
    end
    if largest != i
      swap(i, largest)
      heapify_down(largest)
    end
  end

  def parent(i)
    return nil if i == 0
    ((i + 1) / 2) - 1
  end

  def left(i)
    (2 * (i + 1)) - 1
  end

  def right(i)
    (2 * (i + 1))
  end

  def swap(index1, index2)
    temp = @elements[index2]
    @elements[index2] = @elements[index1]
    @elements[index1] = temp
  end
end


class DataStructure::MaxHeap < DataStructure::Heap
  def is_first_element_top_most_element(element1, element2)
    element1 > element2
  end
end


class DataStructure::MinHeap < DataStructure::Heap
  def is_first_element_top_most_element(element1, element2)
    element1 < element2
  end
end
