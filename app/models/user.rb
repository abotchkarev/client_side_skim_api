class User < ActiveRecord::Base
  
  validates :name, :birthdate, :gender, :country, presence: true
  validate :date_not_in_future 
  
  def date_not_in_future
    if birthdate
      errors[:birthdate] << "Cannot be in the future" if birthdate > Date.today
      errors[:base] << "Must be 21+ to register" if birthdate > Date.today - 21.years
    end
  end
   
  default_scope { order("id DESC") }
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
