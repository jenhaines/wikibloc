class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.references :user, index: true
      t.references :wiki, index: true

      t.timestamps
    end
  end
end
