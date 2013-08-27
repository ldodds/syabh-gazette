$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'syabh-gazette'
require 'test/unit'

class NameGeneratorTest < Test::Unit::TestCase
  
  def test_load_honorifics
    generator = SYABHG::NameGenerator.new
    assert( generator.honorific() != nil )    
  end
end