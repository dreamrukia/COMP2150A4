script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Hashable'
class IntHash < Hashable
  attr_reader :hashvalue
  attr_reader :value
  def initialize(x)
    @hashvalue = x
    @value = x.to_s
  end
  
  def ==(compareItem)
    if @value.to_s == compareItem.to_s
      return true
    else 
      return false
    end
  end
  
  def to_s
    return @value
  end
  
end