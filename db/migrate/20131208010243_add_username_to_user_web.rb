class AddUsernameToUserWeb < ActiveRecord::Migration
  def change
    add_column :user_web, :username, :string
  end
end
