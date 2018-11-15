
class Node
	attr_accessor :parent, :left, :right, :value

	def initialize(value)
		@value = value
		@parent = parent
		@left = nil
		@right = nil
	end

end

class Tree

	attr_accessor :arr, :head, :hash_store

	def initialize
		@arr = nil
		@head = nil
		@hash_store = Hash.new([])
	end

	def build_tree
		arr_dup = @arr.dup
		@head = Node.new(arr[0])
		insert_level(@head, arr, 0)
	end

	def insert_level(node, arr, i)
		if i == 0
			node.left = insert_level(node, arr, 2 * i + 1)
			node.left.parent = node
			node.right = insert_level(node, arr, 2 * i + 2)
			node.right.parent = node 
		elsif i < arr.length
			node = Node.new(arr[i])
			node.left = insert_level(node, arr, 2 * i + 1)
			node.left.parent = node if node.left != nil
			node.right = insert_level(node, arr, 2 * i + 2)
			node.right.parent = node  if node.right != nil
		else
			return nil
		end

		return node
	end

	def print_tree
		
		@hash_store[1] = @head.value
		node_print(@head, 2)
	end

	def node_print(node, level)
		if node.left == nil && node.right == nil
			return
		elsif node.right == nil
			@hash_store[level] = [] if !hash_store.key?(level)
			@hash_store[level] << [node.left.value]
		else
			@hash_store[level] = [] if !hash_store.key?(level)
			@hash_store[level] << [node.left.value, node.right.value]
			node_print(node.left, (level + 1))
			node_print(node.right, (level + 1))
		end
	end

	def depth_search_stack(value)
		stack = []
		node = @head
		stack << node
		until node.value == value
			if node == @head
				if stack.include?(node.right) && stack.include?(node.left)
					puts "none"
					return nil
				end
			end
			if node.left == nil && node.right == nil
				node = node.parent
			elsif node.left != nil && !stack.include?(node.left)
				node = node.left
				stack << node
			elsif node.right != nil && !stack.include?(node.right)
				node = node.right
				stack << node
			else
				node = node.parent
			end
		end
		return true
	end


	def depth_search_recursive(value)
		node = @head
		result = search_recursive(node, value) 
		result != nil ? result.value : false
		
	end

	def search_recursive(node, value)
		if node.value == value 
			return node
		elsif node == nil
			return nil
		elsif node.right == nil && node.left == nil
			return nil
		else 
			node_left = search_recursive(node.left, value) if node.left != nil
			node_right = search_recursive(node.right, value) if node.right != nil
		end

		  if node_left != nil
		  	node = node_left
		  elsif node_right != nil
		  	node = node_right
		  else
		  	return nil
		  end

		  return node

		# if node_left != nil 
		# 	return node_left.value
		# elsif node_right != nil
		# 	return node_right.value
		# end
	end
end

new_tree = Tree.new
new_tree.arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
new_tree.build_tree
new_tree.print_tree
puts new_tree.hash_store
puts new_tree.depth_search_recursive(4)


	

