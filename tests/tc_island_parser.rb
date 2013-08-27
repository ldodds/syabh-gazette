$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'syabh-gazette'
require 'test/unit'

class IslandParser < Test::Unit::TestCase
  
  def test_parse_villages
    parser = SYABHG::IslandParser.new("Centre", :world => File.dirname( __FILE__ ) )
    assert_equal( 7, parser.parse_villages.keys.length )    
  end
  
  def test_parse_inventory_name
    id, building, x, y = SYABHG::IslandParser.parse_inventory_name("V_LootDoor 0 for P_Solo-farm(Clone) At 217 465")
    
    assert_equal("0", id)
    assert_equal("P_Solo-farm", building)
    assert_equal("217", x)
    assert_equal("465", y)
    
    id, building, x, y = SYABHG::IslandParser.parse_inventory_name("V_LootDoor 117 for P_V_House4(Clone) At 796 433")
    
    assert_equal("117", id)
    assert_equal("P_V_House4", building)
    assert_equal("796", x)
    assert_equal("433", y)    
  end
  
  
  
end