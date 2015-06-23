class Nodes::SpacesController < Nodes::ApplicationController
  def index
    @spaces = Api::Client::Space.all
  end

  def create
    @space = Api::Client::Space.create params_space
  end

  def destroy
    @space = Api::Client::Space.find params[:id]
    @space.destroy
  end

  private

  def params_space
    params[:space].permit(:handle)
  end
end
