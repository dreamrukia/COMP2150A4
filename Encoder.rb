script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Dictionary'
require 'StringHash'
require 'KeyValueHash'
require 'IntHash'
class Encoder
  def initialize(name)
    @name = name
  end
  
  def encode
    dict = Dictionary.new
    95.times do |i|
      dict.put(StringHash.new((i + 32).chr), i)
    end
    lzwValue = 95
    output = File.open(@name + ".lzw",'w')
    File.open(@name+'.txt','r') do |f1|
      nChar = f1.getc
      endFile = false
      while nChar && !endFile
        curr_key = nChar
        while dict.contains?(StringHash.new(curr_key)) && !endFile
          last_key = curr_key
          temp = f1.getc
          if temp != nil
            curr_key += temp
          else
            curr_key += "[EOF]"
            endFile = true
          end
        end
        dict.put(StringHash.new(curr_key), lzwValue)
        lzwValue += 1
        temp = dict.get(StringHash.new(last_key)) + " "
        temp.length().times do |i|
          output.putc(temp[i])
        end
        puts("curr_key=#{curr_key}, last_key=#{last_key}, output=#{dict.get(StringHash.new(last_key))}, Added=#{curr_key}:#{lzwValue}")
        if !endFile
          f1.ungetc(curr_key[curr_key.length() - 1])
        end
        nChar = f1.getc
      end
    end
    output.putc("-")
    output.putc("1")
    puts "output stop code (-1)."
  end
end