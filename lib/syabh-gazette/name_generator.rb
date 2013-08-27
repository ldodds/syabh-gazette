module SYABHG
  
  class NameGenerator
       
    def NameGenerator.read(file)
      File.new( File.join( File.dirname( __FILE__ ) , "config", file) ).read. split("\n")
    end
        
    @@HONORIFICS = read("honorifics.txt")
    @@SURNAMES = read("surnames.txt")
    @@MALE = read("male-names.txt")
    @@FEMALE = read("female-names.txt")

    def male
      @@MALE.sample(1).first
    end
    
    def female
      @@FEMALE.sample(1).first
    end
    
    def honorific
      @@HONORIFICS.sample(1).first
    end
        
    def surname
      @@SURNAMES.sample(1).first
    end
    
    def male_or_female
      rand.round == 0 ? male : female
    end
    
    def full_male_name(add_honorific=false)
      return "#{honorific} #{male} #{surname}" if add_honorific
      return "#{male} #{surname}"
    end

    def full_female_name(add_honorific=false)
      return "#{honorific} #{female} #{surname}" if add_honorific
      return "#{female} #{surname}"
    end        
    
    def full_name(honorific=false)
      rand.round == 0 ? full_male_name(honorific) : full_female_name(honorific)
    end
    
  end
end