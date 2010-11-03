class CreateThingLists < ActiveRecord::Migration
  def self.up
    create_table :thing_lists do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_lists
  end
end
