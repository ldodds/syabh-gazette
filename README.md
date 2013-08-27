Sir, You Are Being Hunted Gazette Generator
-------------------------------------------

Some code for parsing and working with the SYABH world files.

Working towards generating a newspaper to provide a backstory and some achievements to add a bit of colour when exploring an island.

INSTALLATION
------------

You'll need Ruby 1.9.2+

SUMMARISING AN ISLAND
---------------------

`ruby bin/summarise-island.rb /path/to/the/world`

Generates output like this:

    Centre Island contains 7 villages
    Local centre is Lesser Harpington
     Great Bumpstead (Please Drive Carefully)
      6 Buildings ( P_V_SmallHouse1,P_V_House4,P_V_Shop )
      60 lootable items
      Nearest: Mild Cheating
     Mild Cheating (No Funny Business)
      5 Buildings ( P_V_Shop,P_V_Building1,P_V_SmallHouse1,P_V_House4 )
      66 lootable items
      Nearest: Slippery Upton
     Odd Fitchet (Please Drive Carefully)
      13 Buildings ( P_V_Shop,P_V_House4,P_V_SmallHouse1,P_V_Building1,P_V_House2 )
      150 lootable items
      Nearest: Trump Dreading
     Trump Dreading (Please Drive Carefully)
      3 Buildings ( P_V_Shop,P_V_SmallHouse1,P_V_House2 )
      45 lootable items
      Nearest: Odd Fitchet
     Lesser Harpington (Welcomes You)
      16 Buildings ( P_V_SmallHouse1,P_V_Building1,P_V_House4,P_V_Shop )
      206 lootable items
      Nearest: Sandy Bucket
     Sandy Bucket (in-the-Wold)
      5 Buildings ( P_V_SmallHouse1,P_V_House2,P_V_House4 )
      70 lootable items
      Nearest: Lesser Harpington
     Slippery Upton (No Funny Business)
      7 Buildings ( P_V_Shop,P_V_Building1,P_V_SmallHouse1,P_V_House4 )
      88 lootable items
      Nearest: Mild Cheating
    Island contains 13 individual structures
     1 Pubs
     2 Churches
     1 Grand Houses

RANDOM NAME GENERATOR
---------------------

Configuration files are in the `lib/config` directory. Lists of names and honorifics sourced from various websites.

TODO: add a better demo. Currently, from project directory, run `irb`:
    
    irb(main):001:0> $:.unshift File.join(File.dirname(__FILE__), "lib")
    => ...
    irb(main):002:0> require 'syabh-gazette'
    => true
    irb(main):003:0> names = SYABHG::NameGenerator.new
    => #<SYABHG::NameGenerator:0x8dead34>
    irb(main):004:0> names.full_name
    => "Rosie Thackeray"
    irb(main):005:0> names.full_name
    => "Agripina York"
    irb(main):006:0> names.full_name
    => "Olivia Stratford"
    irb(main):009:0> names.full_name(true)
    => "Gen Lawerence Wade"
    irb(main):010:0> names.full_name(true)
    => "Lt Connor Tyndall"
    irb(main):011:0> names.full_name(true)
    => "Prof Aimee Westbrook"
    irb(main):012:0> names.full_name(true)
    => "Lt Col Logan Wordsworth"
    irb(main):016:0> names.full_male_name(true)
    => "Sir Finley Hayden"
    irb(main):018:0> names.full_female_name(true)
    => "Rev Maryam Landon"

CONCEPT/IDEAS
-------

Local paper to include:

* Adverts -- specific adverts to be based on which lootable items are on the island, and their relative amounts
* Randomly generated people names
* Templated newspaper reports driven off items on the island
* Attempt to provide "achievements", e.g. "John Smith has lost his trombone"; "Local author publishes new book"
* Pub walks/rambles

![Concept](/etc/concept.png "Screenshot of wireframe")

LICENSE
--------

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
  
You may obtain a copy of the License at 
  
http://www.apache.org/licenses/LICENSE-2.0 
  
Unless required by applicable law or agreed to in writing, 
software distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
  
See the License for the specific language governing permissions and limitations 
under the License.     
