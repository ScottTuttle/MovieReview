class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, User
      
      # if user logged in ...
      if user.id?
        can :create, Movie
        can :create, Comment
        
        can :update, Movie
        can :update, Comment, :user_id => user.id
        
        can :destroy, Comment, :user_id => user.id
      end
    end
  end
end