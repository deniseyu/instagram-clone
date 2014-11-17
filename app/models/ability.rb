class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can :read, :all 
    else
        can [:read, :create], :all 
        can :create, Post
        can [:update, :destroy], Post, :user_id => user.id
    end
  end

end
