script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require "test/unit"
require "hashTable"
class TestHashTable < Test::Unit::TestCase
  def test_empty
    x = HashTable.new(1000)
    assert(x.isEmpty?,"new hashTable should be empty")
  end
    
  def test_singleElement
    x = HashTable.new(1000)
    assert(x.add(IntHash.new(3)))
    assert(x.get(IntHash.new(3)))
    assert(x.remove(IntHash.new(3)))
    assert_raise(RuntimeError){x.get(IntHash.new(3))}
  end
  
  def test_IntHash
    x = HashTable.new(1000)
    2000.times do |i|
      assert(x.add(IntHash.new(Random.rand(1000))))
      assert(x.add(IntHash.new(2000)))
    end
  end
  
  def test_StringHash
    x = HashTable.new(1000)
    assert(x.add(StringHash.new("abc")))
    assert(x.add(StringHash.new("A")))
    assert_equal(x.get(StringHash.new("A")), "A")
  end
end
