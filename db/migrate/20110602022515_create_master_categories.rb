class CreateMasterCategories < ActiveRecord::Migration
  def self.up
    create_table :master_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :master_categories
  end
end
