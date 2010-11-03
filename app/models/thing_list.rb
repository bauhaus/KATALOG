class ThingList < ActiveRecord::Base
  has_many :thing_list_items, :order => 'position'
end
