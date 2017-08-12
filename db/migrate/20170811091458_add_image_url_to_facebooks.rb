class AddImageUrlToFacebooks < ActiveRecord::Migration
  def change
    add_column :facebooks, :image_url, :string
  end
end
