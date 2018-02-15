class AddTokensColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tokens, :string
  end
end
