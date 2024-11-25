class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :category
      t.string :address
      t.string :phone_number
      t.string :url
      t.boolean :stroller
      t.boolean :changing_table
      t.boolean :high_chair
      t.boolean :kids_friendly
      t.boolean :public_transport
      t.string :public_transport_detail
      t.boolean :car_park
      t.string :car_park_detail
      t.boolean :bike_park

      t.timestamps
    end
  end
end
