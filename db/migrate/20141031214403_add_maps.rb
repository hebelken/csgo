class AddMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :url
      t.string :tier
      t.string :map_type  

      t.timestamps
    end
  end
end
