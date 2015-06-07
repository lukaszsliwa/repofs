class Node < ActiveRecord::Base
  before_validation :prepare_domain
  after_commit :associate_creator_with_node

  validates :subdomain, presence: true
  validates :domain, uniqueness: true

  belongs_to :created_by, class_name: 'User'

  has_many :user_nodes, dependent: :destroy
  has_many :users, through: :user_nodes

  def prepare_domain
    self.domain = Settings.node.domain % {subdomain: subdomain}
  end

  private

  def associate_creator_with_node
    UserNode.create(user_id: created_by_id, node_id: id)
  end
end
