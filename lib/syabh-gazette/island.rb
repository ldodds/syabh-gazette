module SYABHG
    
  class LootDoor
    
    attr_reader :id, :building_type, :x, :y
    attr_accessor :village, :items, :island, :building
        
    def initialize(id, building_type, x, y)
      @items = []
      @id = id
      @building_type = building_type
      @x = x
      @y = y
    end

  end
  
  class Village
    attr_reader :name, :sub_title, :region_id
    attr_accessor :island
    attr_accessor :loot_doors
    
    def initialize(region_id, name, sub_title)
      @region_id = region_id
      @name = name
      @sub_title = sub_title
      @loot_doors = []
    end
    
    def add_door( door)
      @loot_doors << door
      door.village = self
    end
    
    def number_of_buildings
      return ( @loot_doors.length / 2 )
    end
    
    def types_of_buildings
      if !@types
        @types = Set.new
        @loot_doors.each do |door|
          @types << door.building_type
        end
      end
      @types
    end
    
    def loot
      if !@items
        @items = []
        @loot_doors.each do |door|
          @items += door.items
        end        
      end
      @items 
    end
    
    def loot_counts
      if !@item_counts
        @item_counts = {}
        @loot_doors.each do |door|
          door.items.each do |item|
            if @item_counts[ item[:type] ]
              @item_counts[ item[:type] ] += 1
            else
              @item_counts[ item[:type] ] = 1
            end
          end
        end             
      end
      @item_counts
    end
  end
  
  class Building    
    attr_accessor :loot_doors, :island, :building_type, :region
        
    def initialize(island, region)
      @island = island
      @region = region
      @loot_doors = []  
      @building_type = "Non-lootable"
    end
    
    def add_door( door)
      @loot_doors << door
      #puts "Adding door to building. #{door.building_type}. At #{door.x}, #{door.y}. Region: #{@region[:id]}"
      @building_type = door.building_type
    end
    
    def pub?
      @building_type.include?("pub")
    end    
    
    def church?
      @building_type.include?("Church")
    end        

    def cottage?
      @building_type.include?("Cottage")
    end        

    def farm?
      @building_type.include?("farm")
    end        

    def shack?
      @building_type.include?("shack")
    end        
            
    def grand_house?
      @building_type.include?("GrandHouse")
    end        
        
    def other?
      @building_type == "Non-lootable"
    end
    
  end
  
  class Island
    
    attr_reader :name
    attr_accessor :loot_doors, :villages, :regions
    attr_accessor :buildings
    
    def initialize(name)
      @name = name
      @loot_doors = []
      @villages = {}
      @regions = {}
      @buildings = []
    end
    
    def allocate_loot_doors_to_villages
      @regions.values.each do |region|
        if region[:type] == "8"
          village = @villages[ region[:id] ]          
          @loot_doors.each do |door|
            if in_radius( region[:position][:x].to_f, region[:position][:z].to_f, region[:radius].to_f, door.x.to_f, door.y.to_f)
              village.add_door( door )
            end
          end
        end        
        if region[:type] == "14" || region[:type] == "7" || region[:type] == "31"                    
          building = Building.new( self, region )
          @buildings << building 
          @loot_doors.each do |door|
            if in_radius( region[:position][:x].to_f, region[:position][:z].to_f, region[:radius].to_f, door.x.to_f, door.y.to_f)
              building.add_door( door )
            end
          end
        end
      end
    end
    
    def largest_village
      largest = nil
      @villages.values.each do |village|
        if largest == nil || 
           village.number_of_buildings > largest.number_of_buildings
          largest = village
        end
      end
      largest
    end
    
    def nearest_village(village)
      nearest = nil
      @villages.values.each do |candidate|
        if village != candidate
          if nearest == nil || ( distance(village, nearest) > distance(village, candidate) )
            nearest = candidate
          end
        end
      end
      nearest
    end
    
    def distance(v1, v2)
       region1 = @regions[ v1.region_id ]
       region2 = @regions[ v2.region_id ]       
       x = ( region2[:position][:x].to_f - region1[:position][:x].to_f ) ** 2
       y = ( region2[:position][:z].to_f - region1[:position][:z].to_f ) ** 2
       return Math.sqrt( x + y )  
    end

    def number_of_pubs      
      pubs.length
    end    
    
    def pubs
      b = []
      @buildings.each do |building|
        b << building if building.pub?
      end
      b
    end
    
    def grand_houses
      b = []
      @buildings.each do |building|
        b << building if building.grand_house?
      end
      b      
    end
    
    def number_of_grand_houses
      grand_houses.length
    end
    
    def number_of_churches
      churches.length
    end
    
    def churches
      b = []
      @buildings.each do |building|
        b << building if building.church?
      end
      b      
    end
    
    #TODO
    #rare items
    #common items
    #available loot (across whole island)
    #number of buildings (across whole island)    
    #number of solo buildings
    #loot in solo buildings
    
  end
end