class AddAttachmentImageToPhotoEvents < ActiveRecord::Migration
  def self.up
    add_column :photo_events, :image_file_name,:string
    add_column :photo_events, :image_content_type,:string
    add_column :photo_events, :image_file_size,:integer
    add_column :photo_events, :image_upload_at,:datetime
  end

  def self.down
    remove_column :photo_events, :image_file_name,:string
    remove_column :photo_events, :image_content_type,:string
    remove_column :photo_events, :image_file_size,:integer
    remove_column :photo_events, :image_upload_at,:datetime
  end
end
