class LandingsController < ApplicationController
  def show
    redirect_to dashboard_path if user_signed_in?
  end
end