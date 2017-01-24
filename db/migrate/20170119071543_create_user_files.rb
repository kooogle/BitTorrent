class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.integer :user_id
      t.integer :file_id
      t.integer :directory_id
      t.string :full_name
      t.string :short_name
      t.string :cover
      t.integer :down_count, default:1

      t.timestamps null: false
    end
  end
end
