class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :image_url
      t.integer :school_id
      t.float :balance, :default => 0
      t.integer :user_id
      t.string :student_id

      t.timestamps null: false
    end
  end
end
