class AddMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :url
      t.string :tier
      t.string :map_type
      t.belongs_to :user, index: true
      t.belongs_to :server, index: true
      t.timestamps
    end
  end
end
