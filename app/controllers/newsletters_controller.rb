class NewslettersController < ApplicationController
  def create
    @newsletter = Newsletter.create params_newsletter
  end

  private

  def params_newsletter
    params[:newsletter].permit(:email)
  end
end