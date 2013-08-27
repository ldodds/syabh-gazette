require 'rexml/document'

module SYABHG
  
  class IslandParser
        
    attr_reader :island
    
    #id, building,x,y
    def self.parse_inventory_name( name )
      match = name.match(/V_LootDoor ([0-9]+) for ([a-zA-Z_\-0-9]+)\(Clone\) At ([0-9]+) ([0-9]+)/)
      return nil if !match
      return match[1], match[2], match[3], match[4]
    end
            
    #:inventory => the XML
    #:world => the world dir
    def initialize(name, opts)
      @name = name
      @opts = opts
      @island = SYABHG::Island.new(name)     
      @init = false      
    end

    def island
      if !@init
        @island.villages = parse_villages()        
        @island.loot_doors = parse_inventory()
        @island.regions = parse_regions()
        @island.allocate_loot_doors_to_villages
        @init = true
      end        
      @island      
    end
        
    def parse_villages()
      villages = {}
      doc = REXML::Document.new( @opts[:villages] || village_names_config )
      doc.elements.each("ArrayOfC_VillageName/C_VillageName") do |village_tag|
        id = village_tag.get_text("m_RegionID").value
        villages[id] = Village.new(
          id,
          village_tag.get_text("m_Title").value,
          village_tag.get_text("m_SubTitle").value
        )
        villages[id].island = @island
      end
      villages
    end
    
    def parse_inventory()
      loot_doors = []
      doc = REXML::Document.new( @opts[:inventory] || inventory_config )
      doc.elements.each("ArrayOfC_InventoryData/C_InventoryData") do |loot_door|
        id, building, x, y = IslandParser.parse_inventory_name( loot_door.get_text("m_InventoryName").value )

        door = SYABHG::LootDoor.new(id, building, x, y)
        door.island = @island
        #m_PickupItemList -> string
        items = []
        loot_door.elements.each("m_PickupItemList/string") do |item|
          items << { :type => item.get_text.value }
        end
        
        count = 0
        loot_door.elements.each("m_PickupItemValueList/int") do |item|
          items[count][:value] = item.get_text.value
          count += 1
        end
        door.items = items
        #m_PickupPositionList -> where
        loot_doors << door
      end
      loot_doors
    end
    
    def parse_regions()
      regions = {}
      doc = REXML::Document.new( @opts[:regions] || regions_config )
      doc.elements.each("ArrayOfC_RegionData/C_RegionData") do |region_tag|
        #TODO create an Island class, which holds Region objects
        #provides scope for calculating nearest regions, etc.
        id = region_tag.get_text("m_RegionID").value
        #TODO identify types
        centre = region_tag.get_elements("m_Centre").first
        region = {
          :id => id,
          :name => region_tag.get_text("m_RegionName").value,          
          :type => region_tag.get_text("m_RegionType").value,
          :position => {
            :x => centre.get_text("x").value,
            :y => centre.get_text("y").value,
            :z => centre.get_text("z").value
          },
          :radius => region_tag.get_text("m_MinRadius").value,
          :num_props => region_tag.get_text("m_NumProps").value
          
        }        
        regions[id] = region
      end
      regions      
    end
      
    def inventory_config
      File.new( File.join( @opts[:world], "Dynamic_Content", "#{@name}Inv.xml" ) )
    end

    def village_names_config
      File.new( File.join( @opts[:world], "Static_Content", "#{@name}VillageNames.xml" ) )
    end

    def regions_config
      File.new( File.join( @opts[:world], "Static_Content", "#{@name}Regions.xml" ) )
    end    
            
  end
end