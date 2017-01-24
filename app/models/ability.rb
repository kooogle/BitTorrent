# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.nonage?
      can :manage, Board
      can :manage, UserDirectory
      can :manage, UserFile
    else
      can :cannot, :all
    end
  end

end
