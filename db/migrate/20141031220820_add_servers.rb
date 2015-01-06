class AddServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :url
      t.string :ip
      t.string :status

      t.timestamps
    end

  end
end
