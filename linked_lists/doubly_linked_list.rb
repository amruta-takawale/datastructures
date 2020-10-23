class Node

  attr_accessor :value, :prev_node, :next_node
  def initialize(val, prev_node=nil, next_node= nil)
    @value = val
    @prev_node = prev_node
    @next_node = next_node
  end
end

class DoublyLinkedList

  attr_accessor :head, :tail

  #Inserts first node or append to the end
  def insert(val)
    if !head
      @head = Node.new(val)
      @tail = @head
    else

      new_node = Node.new(val)
      tail.next_node = new_node
      new_node.prev_node = tail
      @tail = new_node
    end
  end

  #insert before
  def insert_before(old_val, new_val)
    current = head
    while(current.value != old_val)
      current = current.next_node
    end
    new_node = Node.new(new_val)
    new_node.prev_node = current.prev_node
    current.prev_node = new_node
    new_node.prev_node.next_node = new_node
    new_node.next_node = current
  end

  def remove(val)
    current = head
    while(current.value != val )
      current = current.next_node
    end
    current.prev_node.next_node = current.next_node
    current.next_node.prev_node = current.prev_node
  end

  def reverse
    current = head
    while(current != nil)
      temp = current.next_node
      current.next_node = current.prev_node
      current.prev_node = temp
      current = temp
    end
    temp = head
    @head = tail
    @tail = temp
  end

  def traverse
    puts
    current = head
    while(current)
      p current.value
      current = current.next_node
    end
  end

end

dll = DoublyLinkedList.new
dll.insert(4)
dll.insert(8)
dll.insert(1)
dll.insert(5)
dll.traverse

dll.insert_before(8, 10)
dll.traverse

dll.remove(1)
dll.traverse
puts
puts "Reverse"
dll.reverse
dll.traverse