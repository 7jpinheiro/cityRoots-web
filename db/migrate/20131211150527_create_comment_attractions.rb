class CreateCommentAttractions < ActiveRecord::Migration
  def change
    create_table :comment_attractions do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :mobile_user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
