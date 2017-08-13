class RenameImageUrlToFacebook < ActiveRecord::Migration
  def change
    rename_column :facebooks, :image_url, :content_image
  end
end
