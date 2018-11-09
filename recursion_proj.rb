
def fibonacci_it(n)
	answer = [0,1]
	if n == 0
		return 0
	elsif n == 1
		return 1
	else
		i = 2
		while i <= n
			answer <<  (answer[i - 1].to_i + answer[i - 2].to_i)
			i += 1
		end
		return answer[-1]
	end
end

def fibonacci_re(n)
	if n == 0
		0
	elsif n == 1
		1
	else
		fibonacci_re(n - 1) + fibonacci_re(n - 2)
	end
end


answer = []
def merge_sort(arr)
	if arr.length < 2
		return arr
	else
		a = merge_sort(arr[0 .. (arr.length/2 - 1)])
		b = merge_sort(arr[(arr.length/2) .. -1])
	end

	return_arr = []
	while a.length != 0 && b.length != 0
		if a[0] > b[0]
			return_arr << b.slice!(0) 
		else
			return_arr << a.slice!(0)
		end
	end

	a.length == 0 ? return_arr = return_arr + b : return_arr = return_arr + a 
	return return_arr
		
end

def binary_search(arr, number)
	
end

arr1 = [1,4,3,5,7,6,3,43, 4, 6, 3, 43,65,23,4,1,3,54,25,6]
puts "#{merge_sort(arr1)}"


