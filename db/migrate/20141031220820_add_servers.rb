class AddServers < ActiveRecord::Migration
  def change
    create_table :surf_servers do |t|
      t.string :name, null: false
      t.string :url
      t.string :ip, null: false
      t.string :status
      t.string :rank
      t.integer :players
      t.integer :max_players
      t.text :player_names, array: true
      t.belongs_to :server_group, index: true
      t.belongs_to :user, index: true, null: false
      t.timestamps
    end
  end
end
