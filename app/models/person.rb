class Person < ActiveRecord::Base
  has_many :credits
  has_many :things, :through => :credits
  
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  
  belongs_to :user
  
  belongs_to :department
  
  has_and_belongs_to_many :teaching_assignments, :class_name => 'StudyModule'
  
  validates_presence_of :first_name, :last_name
  
  attr_accessible :first_name, :last_name, :motto, :institution
  
  scope :asc, order('last_name')
  scope :by_user, lambda { |user| where( :user_id.eq % user.id ) }
  
  def full_name 
    "#{first_name} #{last_name}"
  end
  
  def real?
    ! institution
  end
  
  def institution?
    institution
  end
  
  def study_modules
    StudyModule.joins(:things => :credits).where(:credits => :person_id.eq % self.id)
  end
end
