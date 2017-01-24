class Nonage::BaseController < ApplicationController

  load_and_authorize_resource
  layout 'nonage'

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
