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
