class CreateThingListItems < ActiveRecord::Migration
  def self.up
    create_table :thing_list_items do |t|
      t.integer :thing_id
      t.integer :thing_list_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_list_items
  end
end
