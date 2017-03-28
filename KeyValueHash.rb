script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Hashable'
require 'StringHash'
require 'IntHash'
class KeyValueHash
    attr_reader :hashvalue
    attr_accessor :value
    def initialize(key, value)
      @hashvalue = key.hashvalue
      @key = key
      @value = value
    end
    
    def ==(compareItem)
      if @key.to_s == compareItem.to_s
        return true
      else 
        return false
      end
    end
    
    def to_s
      return @key
    end
end