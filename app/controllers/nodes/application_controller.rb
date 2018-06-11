class Nodes::ApplicationController < ApplicationController
  before_filter :find_node
  around_filter :api_client_scope

  def find_node
    @node ||= current_user.nodes.find params[:node_id]
  end

  def api_client_scope(&block)
    api_client = Api::Client.new
    api_client.configure do |c|
      c.version = @node.api_version
      c.url = @node.api_url
      c.token = '719f4124b1b170ddf8ca176e6732992f'
    end

    api_client.within &block
  end
end