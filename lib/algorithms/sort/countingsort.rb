module Algorithms::Sort

  class Countingsort
    def sort(array, k)
      c = Array.new(k + 1, 0)
      b = Array.new(array.length)
      array.each {|element| c[element] += 1}
      (0..k).inject(-1) {|sum, i| c[i] = sum + c[i]}
      array.reverse.each do |element|
        b[c[element]] = element
        c[element] -= 1
      end
      b
    end
  end


  # Algorithm: Countingsort
  # Requirements:
  # Time complexity: O(n)
  # Space complexity:
  # Stable: Yes
  #
  # Algorithms::Sort.countingsort([..], k) => [..]
  def self.countingsort(array, k)
    countingsort = Countingsort.new
    sorted_array = countingsort.sort(array, k)
    sorted_array
  end

end