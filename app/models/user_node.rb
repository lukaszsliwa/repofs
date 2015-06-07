class UserNode < ActiveRecord::Base
  belongs_to :user
  belongs_to :node

  validates :node_id, uniqueness: { scope: :user_id }
end
