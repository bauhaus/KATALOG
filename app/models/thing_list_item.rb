class ThingListItem < ActiveRecord::Base
  belongs_to :thing_list
  belongs_to :thing
  
  acts_as_list :scope => 'thing_list_id'
end
