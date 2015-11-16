class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username # Gotta add constraints, especially here on this table **ESPECIALLY on Users**
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
