class CreateMasterItems < ActiveRecord::Migration
  def self.up
    create_table :master_items do |t|
      t.string :name
      t.references :master_category
      
      t.timestamps
    end
  end

  def self.down
    drop_table :master_items
  end
end
