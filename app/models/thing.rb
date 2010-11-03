class Thing < ActiveRecord::Base
  has_many :credits, :dependent => :destroy
  has_many :people, :through => :credits
  accepts_nested_attributes_for :credits, :allow_destroy => true
  
  has_many :images, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  belongs_to :user
  
  has_many :kontext_links, :as => :kontextable
  has_many :kontexts, :through => :kontext_links
  
  has_many :thing_list_items
  
  has_and_belongs_to_many :study_modules
  
  validates_presence_of :title, :description, :credits, :dimensions_x,
    :dimensions_unit, :kind, :materials, :license, :release_date
  validates_associated :credits, :images
  
  attr_accessible :title, :description, :credits_attributes, :images_attributes,
    :kontext_ids, :license, :kind, :materials, :dimensions_x, :dimensions_y,
    :dimensions_z, :dimensions_unit, :dimensions_additional, :tools, :release_date, 
    :start_date, :study_module_ids
  
  def dimensions
    result = [dimensions_x, dimensions_y, dimensions_z].compact.join('×')
    result += " #{dimensions_unit}" if dimensions_unit.present?
    result if result.present?
  end
  
  scope :asc, order('title')
  scope :by_user, lambda { |user| where( :user_id.eq % user.id ) }
end
