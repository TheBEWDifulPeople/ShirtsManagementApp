class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :reject_authenticated

  def index
  end

  private

  def reject_authenticated
    redirect_to shirts_path if current_user
  end
end
