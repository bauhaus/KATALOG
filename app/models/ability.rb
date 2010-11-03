class Ability
  include CanCan::Ability

  def initialize(user)
    # visitors
    can :read, :all
    
    # dummy user enables us to call functions like admin?
    user ||= User.new
    
    # logged in users
    # there already was a user, thus new_record? returns false
    unless user.new_record?
      can :create, Thing
      can [:update,:destroy], Thing do |thing|
        # things they own
        thing.user == user
      end
      
      can :create, Person
      can :update, Person do |person|
        # people they own
        person == user.person
      end
      
      can :create, Group
      can :update, Group do |group|
        # groups they are a member in
        # or groups they own
        group.people.include? user.person or
        group.user == user
      end
      can :destroy, Group do |group|
        # groups they own
        group.user == user
      end
      
      can :manage, StudyModule do |study_module|
        user.teacher?
      end
      
      # admins
      if user.admin?
        can :manage, :all
      end
    end
  end
end