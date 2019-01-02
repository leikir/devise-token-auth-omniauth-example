class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## User Info
      t.string :email

      ## Tokens
      t.text :tokens

      ## Rememberable
      t.datetime :remember_created_at
      t.string :remember_token # TODO : remove ?

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider],     :unique => true
  end
end
