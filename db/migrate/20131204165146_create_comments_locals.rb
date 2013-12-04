class CreateCommentsLocals < ActiveRecord::Migration
  def change
    create_table :comments_locals do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :user_mobile_id
      t.integer :local_id

      t.timestamps
    end
  end
end
