class CreateUserNodes < ActiveRecord::Migration
  def change
    create_table :user_nodes do |t|
      t.integer :user_id
      t.integer :node_id

      t.timestamps null: false
    end
    add_index :user_nodes, [:user_id, :node_id], unique: true
  end
end
