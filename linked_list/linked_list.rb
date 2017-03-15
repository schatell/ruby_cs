class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  #append adds a new node to the end of the list
  def append(value)
    new_data = Node.new(value)
    if @head.nil?
      @head = new_data
    else
      @tail.next_node = new_data
    end
    @tail = new_data
    @size += 1
  end

  #prepend adds a new node to the start of the list
  def prepend(value)
    if @head.nil?
      append(value)
    else
      new_data = Node.new(value)
      new_data.next_node = @head
      @head = new_data
      @size += 1
    end
  end

  #size returns the total number of nodes in the list
  def size
    return @size
  end

  #head returns the first node in the list
  def head
    return @head
  end

  #tail returns the last node in the list
  def tail
    return @tail
  end

  #at(index) returns the node at the given index
  def at(index)
    return nil if index < 0
    return nil if index > @size
    node = @head
    index.times {node = node.next_node}
    node
  end

  #pop removes the last element from the list
  def pop
    if @size > 0
      if @size == 1
        popped_node = @head
        @size = 0
        @head = nil
        @tail = nil
      else
        node = @head
        while node.next_node != tail do
          node = node.next_node
        end
        popped_node = @tails
        node.next_node = nil
        @tail = node
        @size -= 1
      end
    else
      popped_node = nil
    end
    popped_node
  end

  #contains? returns true if the passed in value is in the list and otherwise
  #returns false.
  def contains?(value)
    found = false
    node = @head
    while node != nil do
      if node.value == value
        found = true
        break
      end
      node = node.next_node
    end
    found
  end

  #find(data) returns the index of the node containing data, or nil if not
  #found.
  def find(data)
    found = false
    index = 0
    node = @head
    while !node.nil? do
      if node.value == data
        found = true
        break¸
      end
      index += 1
      node = node.next_node
      if found
        index
      else
        nil
      end
    end
  end

  #to_s represent your LinkedList objects as strings, so you can print them out
  #and preview them in the console. The format should be:
  # ( data ) -> ( data ) -> ( data ) -> nil
	def to_s
		node = @head
		outstr = ""
		while !node.nil? do
			outstr += "( #{node.value} ) -> "
			node = node.next_node
		end
		outstr += "nil"
	end

  #EXTRA CREDIT

  #insert_at(index) that inserts the data at the given index
	def insert_at(index, data)
		if index == 0
			prepend(data)
		else
			node = at(index - 1)
			if !node.nil?
				new_node = Node.new(data)
				node_after = node.next_node
				node.next_node = new_node
				new_node.next_node = node_after
				@size += 1
			end
		end
	end

  #remove_at(index) that removes the node at the given index.
  #(You will need to update the links of your nodes in the list when you
  #remove a node.)
	def remove_at(index)
		node = at(index)
		if !node.nil?
			if node == @head
				@head = @head.next_node
				@size -= 1
			elsif node == @tail
				pop
			else
				last_node = @head
				while last_node.next_node != node do
					last_node = last_node.next_node
				end
				last_node.next_node = node.next_node
				@size -= 1
			end
		end
	end

end

class Node

  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end

end
