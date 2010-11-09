class AddToolsToCredits < ActiveRecord::Migration
  def self.up
    add_column :credits, :tools, :string
    
    Credit.reset_column_information
    
    Credit.all.each do |credit|
      credit.tools = credit.thing.tools
      credit.save
    end
    
    remove_column :things, :tools
  end

  def self.down
    add_column :things, :tools, :string
    
    Thing.reset_column_information
    
    Thing.all.each do |thing|
      thing.tools = thing.credits.first.tools
      thing.save
    end
    
    remove_column :credits, :tools
  end
end
