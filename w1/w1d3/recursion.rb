# def range(start_num, end_num)
#   arr = []
#   return arr if start_num + 1 >= end_num
#   arr.push(start_num + 1) + range(start_num + 1, end_num)
# end
#
# def iterative_range(start_num, end_num)
#   ((start_num + 1)...end_num).to_a
# end


# def exponentiation(base, power)
#   return 1 if power == 0
#   base * exponentiation(base, power-1)
# end
require 'byebug'

def exponentiation(base, power)
  return base if power == 1
  power = power.even? ? power / 2 : ((power + 1) / 2)
  return base * base if power == 1
  base * exponentiation(base, power)
end

def deepdup(arr)
  return arr if arr.length <= 1
  arr_dup = []
  if arr[0].is_a?(Array)
     arr_dup << deepdup(arr.shift)
  end
  arr_dup << arr.shift
  arr_dup += deepdup(arr)

end

# def fibonacci(n)
#   return [1] if n == 1
#   fib_dup = [1,1]
#   n.times do |i|
#     fib_dup.push(fib_dup.last + fib_dup[-2])
#   end
#   fib_dup
# end


def fibonacci( n )
  return [1] if n < 2
  return [1,1] if n == 2
  arr = fibonacci(n-1)
  fib_sum = arr[-1] + arr[-2]
  arr << fib_sum
end

def subsets(arr)
  debugger
  return [[]] if arr.empty?
  old_subsets = subsets(arr.drop(1))
  new_subsets = []
  old_subsets.each do |subset|
    new_subsets << subset + [arr.first]
  end
  old_subsets + new_subsets
end

def permutation(arr)
  perms = []
  1.upto(arr.length) do |i|
    perms << arr.rotate(i)
    perms << arr.reverse.rotate(i)
  end
  perms.uniq.sort.reverse
end

def permutation(arr)
  perms = []
  1.upto(arr.length) do |i|
    perms << arr.rotate(i) << arr.reverse.rotate(i)
  end
  perms.uniq.sort
end



def bsearch(arr, target, from = 0, to = nil)
  to = arr.count - 1 if to == nil

  middle_index = (from + to) / 2

  if middle_index == 0
    return nil if arr[middle_index] != target
  elsif middle_index == arr.length - 1
    return nil if arr[middle_index] != target
  end

  if target < arr[middle_index]
    bsearch(arr, target, from, middle_index - 1)
  elsif target > arr[middle_index]
    bsearch(arr, target, middle_index + 1, to)
  else
    middle_index
  end

end


def mergesort(array)
  array.each_cons(2) { |}
end

def merge
end


if __FILE__ == $PROGRAM_NAME
  puts subsets([1,2,3,4])
end
