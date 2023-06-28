# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Recipe, user_id: user.id
    can :create, Recipe
    can :update, Recipe, user_id: user.id
    can :destroy, Recipe, user_id: user.id
  end
end