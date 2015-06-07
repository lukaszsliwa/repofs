class AddCreatedByIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :created_by_id, :integer
  end
end
