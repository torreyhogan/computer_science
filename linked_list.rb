class LinkedList

	def initialize
		@head = nil
		@tail = nil
	end

	def append(value)
		node = Node.new
		node.value = value
		@tail.next_node = node if @tail != nil
		@tail = node 
		@head = node if @head == nil
	end

	def prepend(value)
		node = Node.new
		node.value = value
		prev_head = @head
		@head = node 
		@head.next_node = prev_head 
		@tail = node if @tail == nil
	end

	def size
		return 0 if @head == nil

		node = @head
		count = 1
		while node.next_node != nil
			node = node.next_node
			count += 1
		end
			count
	end

	def head
		puts @head.value
		@head
	end

	def tail
		puts @tail.value
		@tail
	end

	def at(index)
		return nil if @head == nil

		count = 0
		node = @head
		until count == index
			node = node.next_node
			count += 1
			return nil if node == nil
		end
		node
	end

	def pop
		return if @tail == nil
		idx = size - 2
		@tail = at(idx)
		@tail.next_node = nil
	end

	def contains?(value)
		node = @head
		contains_recursive(node, value)
	end

	def contains_recursive(node, value)
		if node.value == value
			return true
		elsif node.next_node == nil 
			return false
		else
			contains_recursive(node.next_node, value)
		end
	end

	def find(data)
		idx = 0
		node = @head
		return "nil" if node == nil
		until node.value == data || node == @tail
			node = node.next_node
			idx += 1
		end
		node.value == data ? idx : nil
	end

	def to_s
		string = ""
		node = @head
		return "nil" if node == nil
		until node == @tail 
			string += "( #{node.value} ) --> "
			node = node.next_node
		end
		string += "( #{node.value} ) --> nil"
		puts string
	end

	def insert_at(value, index)
		node = @head
		idx = 0
		until idx >= (index - 1) || node == @tail
			node = node.next_node
			idx += 1
		end

		if idx == index - 1 && node != @tail
			new_node = Node.new
			new_node.next_node = node.next_node
			node.next_node = new_node
			new_node.value = value
		elsif idx == 0
			prepend(value)
		else
			append(value)
		end
	end

	def remove_at(index)
		idx = 0
		first_node = @head
		if index >= (size - 1)
			pop
			return
		elsif size == 0
			return
		end

		until idx >= (index - 1)
			first_node = first_node.next_node
			idx += 1
		end

		if index == 0
			second_node = first_node.next_node
			@head = second_node
		else
			second_node = (first_node.next_node).next_node
			first_node.next_node = second_node
		end
	end
end

class Node
	attr_accessor :value, :next_node
	def initialize
		@value = nil
		@next_node = nil
	end

end

new_list = LinkedList.new
new_list.append("dog")
new_list.append("cat")
new_list.append("turtle")
new_list.append("bannana")
new_list.append("burd")
new_list.remove_at(3)
puts new_list.to_s
