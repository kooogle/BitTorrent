class CreateFileSources < ActiveRecord::Migration
  def change
    create_table :file_sources do |t|
      t.string :file_name
      t.string :file_type
      t.string :file_size
      t.string :file_md5
      t.string :file_path

      t.timestamps null: false
    end
    add_index :file_sources, :file_md5, unique: true
  end
end
