class PossessionsController < ApplicationController
  def create
    shirt = Shirt.find params[:shirt_id]
    current_user.shirts << shirt
    redirect_to profile_path
  end
end