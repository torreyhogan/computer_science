def rock_judger(rocks_arr)    
    if rocks_arr.length <= 2  # the base case
      a = rocks_arr[0]
      b = rocks_arr[-1]
    else
      a = rock_judger(rocks_arr.slice!(0,rocks_arr.length/2)) 
      # runs until rocks_arr.length == 2
      b = rock_judger(rocks_arr)
    end    
    
    return a > b ? a : b
end

 
# rocks = 30.times.map{rand(200) + 1}
# puts rocks.join(', ')
# puts "Heaviest rock is: #{rock_judger(rocks)}"

arr = []
def append(n, arr)
	return arr if n < 0
	arr.unshift(n) 
	append((n-1) , arr)
end

def factorial(number)
	return 1 if number == 1
	number * factorial(number - 1)
end


def palindrome?(string)
	
	if string.length == 1 || string.length == 0
		true
	else
		if string[0] == string[-1]
			palindrome?(string[1.. -2])
		else
			return false
		end
	end
end

def bottle_beer(n)
	if n == 0
		puts "no more bottles of beer on the wall"
	else
		puts "#{n} bottles of beer on the wall"
		bottle_beer(n-1)
	end
end

def fibonacci_number(n)
	if n == 0
		0
	elsif n == 1
		1
	else
		fibonacci_number(n - 1) + fibonacci_number(n - 2)
	end
end

new_arr = []
def flatten(arr, new_arr)
	if arr.class != 'Array'
		new_arr << arr 
	else
		flatten(arr.slice!(0))
		flatten(arr)
	end
	return new_arr
end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}
def roman_convert(integer, roman_mapping, result = "")
	roman_mapping.each do |roman_num|
		number = 








