class AddUsers < ActiveRecord::Migration
  def change

    create_table "users" do |t|
      t.string   :username,               null: false
      t.string   :email,                  null: false

      t.string   :encrypted_password,     null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count,          default: 0,  null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.datetime :created_at
      t.datetime :updated_at

      t.string   :authentication_token
    end
  end
end
