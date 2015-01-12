class AddServergroups < ActiveRecord::Migration
  def change
    create_table :server_groups do |t|
      t.string :name, null: false
      t.string :url
      t.string :description
      t.string :owner
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
