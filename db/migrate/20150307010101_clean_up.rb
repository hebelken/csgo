class CleanUp < ActiveRecord::Migration
  def up
    # Maps
    remove_column :maps, :user_id
    remove_column :maps, :server_id

    add_column    :maps, :created_by_user_id, :integer

    # Servers
    remove_column :servers, :pinged
    remove_column :servers, :user_id

    add_column    :servers, :created_by_user_id, :integer

    # Server Groups
    remove_column :server_groups, :user_id

    add_column    :server_groups, :created_by_user_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
