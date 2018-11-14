
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

	# def node_print(node, string, level)
	# 	puts "#{node.value}"
	# 	if node.left == nil && node.right == nil
	# 		return
	# 	elsif node.right == nil
	# 		node_print(node.left, string)
	# 	else
	# 		node_print(node.left, string)
	# 		node_print(node.right, string)
	# 	end
	# end
end

new_tree = Tree.new
new_tree.arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
new_tree.build_tree
new_tree.print_tree
puts new_tree.hash_store


	

