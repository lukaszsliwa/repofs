class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :ip
      t.string :domain

      t.timestamps null: false
    end
    add_index :nodes, :ip
    add_index :nodes, :domain, unique: true
  end
end
