class AddServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name, null: false
      t.string :url
      t.string :port, null: false
      t.string :ip, null: false
      t.boolean :pinged, default: false
      t.integer :number_of_players
      t.integer :max_players
      t.string :map_name
      t.integer :ping
      t.text :player_names, array: true
      t.belongs_to :server_group, index: true
      t.belongs_to :user, index: true, null: false
      t.timestamps
    end
  end
end
