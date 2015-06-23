class Nodes::KeysController < Nodes::ApplicationController
  def index
    @keys = Api::Client::Key.all
  end

  def create
    @key = Api::Client::Key.create params_key
  end

  def destroy
    @key = Api::Client::Key.find params[:id]
    @key.destroy
  end

  private

  def params_key
    params[:key].permit(:token, :content)
  end
end
