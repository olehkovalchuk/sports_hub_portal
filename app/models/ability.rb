# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
   
    if user.has_role? :admin
      can [:read, :edit, :destroy], User
      can :manage, Article
      can :manage, Baner
      can :destroy, Comment
      can :manage, Advertisement
      can :manage, Survey
      can :manage, Answer
      can :manage, Team
      can :manage, Category
      can :manage, Subscription
      can :read, SurveyResponder
    elsif user.has_role? :basic
      can :show, User
      can :update, User, id: user.id
      can :read, Article, status: 'published'
      can :read, Baner, status: 'published'
      can [:create, :read], Comment
      can [:update, :destroy], Comment, author_id: user.id
      can :update, CommentReaction
      can :show, Advertisement, status: "active"
      can :read, Survey
      can :show, Answer
      cannot :read, Survey, status: "not_published"
      can :read, Team
      can :read, Category
      can :create, Subscription
      can [:show, :update], Subscription, user_id: user.id
    else
      can :create, User
      can :read, Article, status: 'published'
      can :show, Baner, status: 'published'
      can :read, Comment
      can :show, Advertisement, status: "active"
      can :read, Team
      can :read, Category
    end
     
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
