script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'LinkedList'
require 'Hashable'
require 'Node'
require 'IntHash'
require 'StringHash'
require 'KeyValueHash'
class HashTable
  def initialize(len)
    @table = Array.new(len)
  end
  
  def add(x)
    @table[x.hashvalue()] = Node.new(x, @table[x.hashvalue])
  end
  
  def get(x)
    if @table[x.hashvalue()] != 0
      curr = @table[x.hashvalue()]
      while curr != nil && !(curr.value() == x.to_s)
        curr = curr.nxt()
      end
      
      if curr != nil
        return curr.value()
      else
        raise "item not found"
      end
    else
      raise "item not found"
    end
  end
  
  def remove(x)
    if contains?(x)
      curr = @table[x.hashvalue()]
      prev = nil
      while !(curr.value() == x.to_s)
        prev = curr
        curr = curr.nxt()
      end
      if prev == nil
        @table[x.hashvalue()] = curr.nxt()
      else
        prev.nxt = curr.nxt()
      end
      return true
    else
      return false
    end
  end
  
  def contains?(x)
    if @table[x.hashvalue()] == 0
      return false
    else
      curr = @table[x.hashvalue()]
      while curr != nil && !(curr.value() == x.to_s)
        curr = curr.nxt()
      end
      
      if curr != nil
        return true
      else
        return false
      end
    end
  end
  
  def isEmpty?
    result = true
    @table.length().times do |i|
      if @table[i] != nil
        result = false
      end
    end
    return result
  end
  
end
