class CreateMasterSpecs < ActiveRecord::Migration
  def self.up
    create_table :master_specs do |t|
      t.string :spec
      t.references :master_item
      t.timestamps
    end
  end

  def self.down
    drop_table :master_specs
  end
end
