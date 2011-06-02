class Master::Item < ActiveRecord::Base
  belongs_to :master_category
  has_many :specs
end
