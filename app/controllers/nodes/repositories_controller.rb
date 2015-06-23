class Nodes::RepositoriesController < Nodes::ApplicationController
  def index
    @repositories = Api::Client::Repository.all
  end

  def create
    @repository = Api::Client::Repository.create(params[:repository])
  end

  def destroy
    @repository = Api::Client::Repository.find(params[:id], {space_handle: params[:space_handle]})
    @repository.destroy
  end

  private

  def params_repository
    params[:repository].permit(:handle, :space_handle, :allow_me)
  end
end
