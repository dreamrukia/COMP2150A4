script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Hashable'
class StringHash < Hashable
    attr_reader :hashvalue
    attr_reader :value
    
    @@prime = 31
    
    def initialize(x)
      @value = x.to_s
      getHashValue
    end
    
    def getHashValue
      @hashvalue = 0
      @value.length().times do |i|
        @hashvalue = @hashvalue * @@prime + @value[i].ord
      end
    end
    
    def ==(compareItem)
      if @value == compareItem.to_s
        return true
      else 
        return false
      end
    end
    
    def to_s
      return @value
    end
end