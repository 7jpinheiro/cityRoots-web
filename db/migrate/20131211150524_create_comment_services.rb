class CreateCommentServices < ActiveRecord::Migration
  def change
    create_table :comment_services do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :mobile_user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
