script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Node'
class LinkedList
  def initialize
    @head = nil
    puts "initialized"
  end
  
  def add(item)
    @head = Node.new(item,@head)
  end
  
  def get(position)
    curr = @head
    position.times do |i|
      curr = curr.nxt()
    end
    return curr.value()
  end
  
end

