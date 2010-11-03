class Credit < ActiveRecord::Base
  belongs_to :person
  belongs_to :thing
  
  validates_presence_of :person, :role
  
  attr_accessible :person_id, :role, :tools
end
