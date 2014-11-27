class AddRoledateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roledate, :datetime
  end
end
