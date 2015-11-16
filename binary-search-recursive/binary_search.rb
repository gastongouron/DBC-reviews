def binary_search_include?(element, array)
  array.sort!
  # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108...

  divide_by_two = array.length/2
  # => 669, 334, 167, 83, 41, 20, 10, 5, 2

  comp = array[divide_by_two]
  # => 669, 334, 167, 83, 41, 20, 10, 5, 2

  if array.empty?
  # => false, false, false, false, false, false, false, false, false

    return false
  end
  if element > comp
  # => false, false, false, false, false, false, false, false, false
    binary_search_include?(element, array[(divide_by_two+1)..-1])
  elsif element < comp
  # => true, true, true, true, true, true, true, true, FALSE!
    binary_search_include?(element,array[0...divide_by_two])
    # => true, true, true, true, true, true, true, true
  elsif element == comp
  # => true
    return true
    # => true
  end
end

binary_search_include?(2, (0..1337).to_a)  # => true

def binary_search(element, array, lower=0, upper=(array.length-1))
  array.sort!
  # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100], [0, 1, 2, 3, 4, 5, 6, 7, 8,...
  if upper < lower
  # => false, false, false, false, false
    return nil
  end
  divide_by_two = (lower + upper)/2
  # => 50, 24, 11, 5, 2
  if element > array[divide_by_two]
  # => false, false, false, false, false
    binary_search(element, array, divide_by_two+1, upper)
  elsif element < array[divide_by_two]
  # => true, true, true, true, false
    binary_search(element,array, lower, divide_by_two-1)
    # => 2, 2, 2, 2
  elsif element == array[divide_by_two]
  # => true
    return divide_by_two
    # => 2
  end
end

binary_search(2, (0..100).to_a)
# => 2
