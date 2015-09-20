class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :good_id
      t.integer :child_id

      t.timestamps null: false
    end
    add_index :purchases, [:good_id, :child_id], unique: true
  end
end
