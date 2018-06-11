class Nodes::DevelopersController < Nodes::ApplicationController
  def index
    @developers = Api::Client::Developer.all
  end

  def create
    @developer = Api::Client::Developer.create params_developer
  end

  def destroy
    @developer = Api::Client::Developer.find params[:id]
    @developer.destroy
  end

  private

  def params_developer
    params[:developer].permit(:login, :email)
  end
end
