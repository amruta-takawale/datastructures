class Node

  attr_accessor :value, :next_node

  def initialize(val, next_node = nil)
    @value = val
    @next_node = next_node
  end

end

class SinglyLinkedList

  attr_accessor :head

  def insert(val)
    new_node = Node.new(val)
    current = head
    if !current
      @head = new_node
    else
      while(current.next_node != nil)
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def insert_after(old_val, new_val)
    current = head
    while current.value != old_val
      current = current.next_node
    end
    new_node = Node.new(new_val)
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def insert_before(old_val, new_val)
    current = head
    prev = head
    while current.value != old_val
      prev = current
      current = current.next_node
    end
    new_node = Node.new(new_val, prev.next_node)
    prev.next_node = new_node
  end

  def remove(val)
    current = head
    if head.value == val
      @head = current.next_node
    else
      prev = head
      while current.value != val
        prev = current
        current = current.next_node
      end
      prev.next_node = current.next_node
    end
  end
  
  def traverse
    current = head
    while(current)
      puts current.value
      current = current.next_node
    end
  end

end

sll = SinglyLinkedList.new

sll.insert(37)
sll.insert(51)
sll.insert(15)
sll.insert(80)
sll.insert(10)
sll.insert(57)
puts sll.traverse
puts "Insert value after"
sll.insert_after(80,88)
puts sll.traverse
puts "Insert value before"
sll.insert_before(15,11)
puts sll.traverse
puts "Delete element from sll"
sll.remove(37)
puts sll.traverse