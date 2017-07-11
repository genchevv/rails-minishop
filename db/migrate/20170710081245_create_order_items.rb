class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.float :price
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
    end
  end
end
