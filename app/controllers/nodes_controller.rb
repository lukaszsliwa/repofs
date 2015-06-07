class NodesController < ApplicationController
  def index
    @nodes = current_user.nodes.page params[:page]
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new params_node
    @node.created_by = current_user

    respond_to do |format|
      if @node.save
        format.html { redirect_to nodes_path }
      else
        format.html { render action: :new }
      end
    end
  end

  def show
    @node = current_user.nodes.find params[:id]
  end

  private

  def params_node
    params[:node].permit(:name, :ip, :subdomain, :domain)
  end
end