class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :customer_id
      t.float :balance, :default => 0

      t.timestamps null: false
    end
  end
end
