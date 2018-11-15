
class Move

	attr_accessor  :previous, :pos, :children

	def initialize(pos)
		@pos = pos
		@previous = nil
		@children = []
	end
end


class Tree
	attr_accessor :first, :final, :head
	def initialize(first, final)
		@first = first
		@final = final
		@possible_solution = []
		@head = nil
	end

	def knight_moves_tree
		@head = Move.new(@first)
		next_move(@head, 1)
		
	end

	def next_move(node, count)
		if node.pos == @final || count == 8
			return 
		end
		available_moves = moves(node.pos)
		available_moves.each do |x|
			child_node = Move.new(x)
			child_node.previous = node
			node.children << child_node
			next_move(child_node, count + 1)
		end
	end

	def moves(arr)
		arr1 = [arr[0] + 1, arr[1] + 2]
		arr2 = [arr[0] + 1, arr[1] - 2]
		arr3 = [arr[0] + 2, arr[1] + 1]
		arr4 = [arr[0] + 2, arr[1] - 1]
		arr5 = [arr[0] - 1, arr[1] + 2]
		arr6 = [arr[0] - 1, arr[1] - 2]
		arr7 = [arr[0] - 2, arr[1] + 1]
		arr8 = [arr[0] - 2, arr[1] - 1]

		available_moves = [arr1, arr2, arr3, arr4, arr5, arr6, arr7, arr8]
		available_moves.select do |x| 
			x[0] >= 0 && x[0] < 8 && x[1] >= 0 && x[1] < 8
		end
	end

	def solution_nodes
		shortest_path(@head)
	end

	def shortest_path_n
		solution = nil
		first= @head.dup
		final_num = @final.dup
		storage_arr = [first]
		count = 0
		until storage_arr[count].pos == final_num
			storage_arr[count].children.each do |x|
				storage_arr << x
			end
			count += 1
		end
		storage_arr[count]
	end

	def upchain
		answer_node = shortest_path_n
		moves = [answer_node]
		until moves[0].previous == nil
			moves.unshift(moves[0].previous)
		end
		string = ""
		moves.each do |x|
			string += "#{x.pos} "
		end
		puts string
	end
end

new_tree = Tree.new([0,0],[7,7])
new_tree.knight_moves_tree
new_tree.upchain

