class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.role?(:entidade)
      can :read, :all
      can :manage, Attraction, :web_user_id => user.id
      can :manage, Event, :web_user_id => user.id
      can :manage, Itinerary, :web_user_id => user.id
      can :manage, AttractionTranslation, :web_user_id => user.id
      can :manage, AttractionType, :web_user_id => user.id
      can :create, Attraction
      can :create, AttractionTranslation
      can :create, AttractionType
    end

    if user.role?(:restauracao)
      can :read, :all
      can :manage, Service, :web_user_id => user.id
    end

    if user.role?(:mobile)
      can :read, :all
      can :read, Attraction
      can :read, Service
      can :read, Event
    end

    can :read, :all
    can :manage, :all
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
