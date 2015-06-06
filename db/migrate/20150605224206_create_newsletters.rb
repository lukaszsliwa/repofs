class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :email
      t.datetime :confirmed_at
      t.datetime :canceled_at

      t.timestamps null: false
    end
    add_index :newsletters, :email, unique: true
    add_index :newsletters, [:confirmed_at, :canceled_at]
  end
end
