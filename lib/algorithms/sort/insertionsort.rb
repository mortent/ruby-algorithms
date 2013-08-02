module Algorithms::Sort

  class Insertionsort
    def sort(array)
      array.each_with_index do |element, count|
        next if count == 0
        i = count - 1
        while array[i] > element and i >= 0
          array[i+1] = array[i]
          i -= 1
        end
        array[i+1] = element
      end
    end
  end

  # Algorithm: Insertion sort
  # Requirements:
  # Time complexity:
  # Space complexity:
  # Stable:
  #
  # Algorithms::Sort.insertion_sort!([..]) => [..]
  def self.insertionsort!(array)
    insertionsort = Insertionsort.new
    insertionsort.sort(array)
    array
  end

end