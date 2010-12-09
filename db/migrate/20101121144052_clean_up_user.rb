class CleanUpUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :updated_at
    remove_column :users, :created_at
    remove_column :users, :last_sign_in_ip
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_at
    remove_column :users, :sign_in_count
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :name
    add_column :users, :sign_in_count, :integer, :default => 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    add_column :users, :reset_password_token
    add_column :users, :encrypted_password, :string, :limit => 128, :default => "", :null => false
  end
end
