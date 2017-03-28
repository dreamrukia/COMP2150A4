script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'hashTable'
require 'StringHash'
require 'KeyValueHash'
require 'IntHash'

class Dictionary
  def initialize
    @data = HashTable.new(1000)
  end
  
  def put(k,v)
    if @data.contains?(k)
      @data.get(k).value = v
    else
      @data.add(KeyValueHash.new(k,v))
    end
  end
  
  def get(k)
    if @data.contains?(StringHash.new(k))
      return @data.get(k).value().to_s
    else
      raise "key value can not be find in the dictionary"
    end
  end
  
  def contains?(x)
    return @data.contains?(x)
  end
  
  def isEmpty?
    return @data.isEmpty?()
  end
end
