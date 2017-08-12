class RemoveTitleFromFacebooks < ActiveRecord::Migration
  def change
    remove_column :facebooks, :title, :string
  end
end
