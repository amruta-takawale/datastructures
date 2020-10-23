#Circular linked List implementation using singly linked list
class Node
  attr_accessor :value, :next_node

  def initialize(val, next_node=nil)
    @value = val
    @next_node = next_node
  end
end

class CircularLinkedList
  attr_accessor :head

  def insert(val)
    if !head
      @head = Node.new(val)
      head.next_node = @head
    else
      current = head
      while current.next_node.value != head.value
        current = current.next_node
      end
      new_node = Node.new(val)
      new_node.next_node = head
      current.next_node = new_node
    end
  end

  def traverse
    puts
    current = head
    loop do
      puts current.value
      current = current.next_node
      break if current == head
    end
  end

  def reverse
    current = head
    prev = nil
    loop do
      temp = current.next_node
      current.next_node = prev
      prev = current
      current = temp
      break if current == head
    end
    @head.next_node = prev
    @head = prev
  end

end

cll = CircularLinkedList.new
cll.insert(66)
cll.insert(23)
cll.insert(44)
cll.insert(11)
cll.traverse
cll.reverse
cll.traverse

