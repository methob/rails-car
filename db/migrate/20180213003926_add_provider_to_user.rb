class AddProviderToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string, :null => true, :default => "email"
    add_column :users, :uid, :string, :null => true

    add_index :users, [:uid, :provider], unique: true
  end
end
