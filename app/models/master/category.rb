class Master::Category < ActiveRecord::Base
  has_many :master_items
  validates_uniqueness_of :name
  
 
end
