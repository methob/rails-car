class CreateBackofficeCars < ActiveRecord::Migration[5.1]
  def change
    create_table :backoffice_cars do |t|
      t.string :marca
      t.datetime :ano
      t.string :modelo
      t.string :cor

      t.timestamps
    end
  end
end
