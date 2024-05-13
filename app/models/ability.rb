# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    # Define abilities for the passed in user here. For example:
    #
    account ||= Account.new # guest user (not logged in)
    if account.superuser? || account.admin?
      can :manage, :all
    else
      account.role.permissions.each do |permission|
        permission.permission_items.each do |permission_item|
          can permission_item.action_name.to_sym, Feature.find(permission_item.permission.feature_id).subject_class.constantize
        end
      end
       #:read, :all
    end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
