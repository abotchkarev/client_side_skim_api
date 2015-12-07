class User < ActiveRecord::Base
  
  class <<  self
    def supported_countries
      %w[CA US]
    end
    
    def enum_countries
      TZInfo::Country.all.select{|country| self.supported_countries.include? country.code}.
        map{|c| [c.name, c.code]}
    end
  end
  
  def age
    return nil if birthdate.blank?
    today = Date.today
    age = today.year - birthdate.year 
    today - age.years > birthdate ? age : age - 1 
  end
end
