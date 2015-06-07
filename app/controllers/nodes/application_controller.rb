class Nodes::ApplicationController < ApplicationController
  before_filter :find_node

  def find_node
    @node ||= current_user.nodes.find params[:node_id]
  end
end