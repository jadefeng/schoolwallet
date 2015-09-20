class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.float :price
      t.string :image_url
      t.string :category

      t.timestamps null: false
    end
  end
end
