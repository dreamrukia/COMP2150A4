
script_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift script_dir

require 'Encoder'
class Main
  test = Encoder.new("hamlet")
  test.encode()
end