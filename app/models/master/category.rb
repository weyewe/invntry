class Master::Category < ActiveRecord::Base
  has_many :master_items
end
