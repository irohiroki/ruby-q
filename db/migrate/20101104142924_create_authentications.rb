class CreateAuthentications < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
      t.string :provider
      t.integer :uid
      t.references :user
    end
  end

  def self.down
    drop_table :authentications
  end
end
