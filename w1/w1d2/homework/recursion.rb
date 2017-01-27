### Exercise 1 - sum_to
# Write a function sum_to(n) that uses recursion to calculate
# the sum from 1 to n (inclusive of n).

def sum_to(n)
  # return nil if n < 1
  # return n if n == 1

  return 1 if n <= 1
  n + sum_to(n - 1)
end

sum_to(-8) # => returns nil # no: 1


### Exercise 2 - add_numbers
#
# Write a function add_numbers(nums_array) that takes in an array
# of Fixnums and returns the sum of those numbers.

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

add_numbers([]) # => returns nil #yes


### Exercise 3 - Gamma Function
# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.


def gamma_fnc(n)
  #return nil if n < 1
  #return n if n == 1

  return n if n <= 1
  (n - 1) * gamma_fnc(n - 1)
end

gamma_fnc(0) # => returns nil # no: 0
