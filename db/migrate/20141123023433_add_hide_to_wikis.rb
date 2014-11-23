class AddHideToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :hide, :boolean, :default => false
  end
end
