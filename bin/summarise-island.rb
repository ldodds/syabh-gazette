$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'syabh-gazette'

def in_radius(center_x, center_y, radius, x, y)
  square_dist = (center_x - x) ** 2 + (center_y - y) ** 2
  return square_dist <= radius ** 2    
end

parser = SYABHG::IslandParser.new("Centre",:world => "/home/ldodds/Games/sir/linux/sir_alpha_v0/SaveGames/World1")

island = parser.island

puts "#{island.name} Island contains #{island.villages.length} villages"
puts "Local centre is #{island.largest_village.name}"

island.villages.entries.each do |id, village|
  puts " #{village.name} (#{village.sub_title})"
  puts "  #{village.number_of_buildings} Buildings ( #{village.types_of_buildings.entries.join(",")} )"
  puts "  #{village.loot.length} lootable items"   
  #village.loot_counts.entries.each do |k,v|
  #  puts "  #{v}, #{k}"
  #end
  puts "  Nearest: #{island.nearest_village(village).name}"
end

puts "Island contains #{island.buildings.length} individual structures"
puts " #{island.number_of_pubs} Pubs"
puts " #{island.number_of_churches} Churches"
puts " #{island.number_of_grand_houses} Grand Houses"