class CreateUserDirectories < ActiveRecord::Migration
  def change
    create_table :user_directories do |t|
      t.integer :user_id
      t.string :name
      t.integer :parent_id
      t.string :cover

      t.timestamps null: false
    end
  end
end
