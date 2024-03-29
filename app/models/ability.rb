class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role?(:new_user)
      puts "------------- NEW USER -----------------"
      can :create, WebUser
    end
    

    if user.role?(:entidade_nao_activa)

    end

    if user.role?(:entidade)
      puts "------------- entidade -----------------"
      can :manage, Attraction, :web_user_id => user.id
      can :manage, Event, :web_user_id => user.id
      can :manage, WebUser, :id => user.id
      can :manage, Service, :web_user_id => user.id
      can :manage, Itinerary, :user_id => user.id
      can :manage, AttractionTranslation, :web_user_id => user.id
      can :manage, AttractionType, :web_user_id => user.id
      can :create, Attraction
      can :create, AttractionTranslation
      user.web_user.attractions.each do |att| 
        att.photo_attractions.each do |photo|
          can :manage, PhotoAttraction, :id => photo.id
        end
      end
      can :manage, PhotoEvent, :user_id => user.id
      can :manage, PhotoService, :user_id => user.id
      can :create, AttractionType
      can :create, PhotoAttraction
      can :create, PhotoService
      can :create, PhotoEvent

    end

    if user.role?(:restauracao)
      puts "------------- restauracao -----------------"
      can :manage, Payment
      can :create, Payment
      can :manage, WebUser, :id => user.id
      can :manage, Service, :web_user_id => user.id
      can :create, Service
    end

    if user.role?(:restauracao_gold)
      puts "------------- restauracao_gold -----------------"
      can :manage, Service, :web_user_id => user.id
      can :manage, Event, :web_user_id => user.id
      can :manage, WebUser, :id => user.id
    end

    if user.role?(:admin)
      can :manage, :all
      can :create, :all
    end

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
