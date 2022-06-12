class CreateDeliveryinformations < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveryinformations do |t|

      t.timestamps
    end
  end
end
