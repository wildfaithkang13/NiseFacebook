class AddTitleToFacebooks < ActiveRecord::Migration
  def change
    add_column :facebooks, :title, :string
  end
end
