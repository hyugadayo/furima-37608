class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product, null: false
      t.text :explain, null: false
      t.integer :category_id,null: false
      t.integer :state_id, null: false
      t.integer :price, null: false
      t.integer :delivery_cost_status_id,null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_waiting_time_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
