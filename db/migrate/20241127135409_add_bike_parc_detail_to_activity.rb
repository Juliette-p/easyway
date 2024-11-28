class AddBikeParcDetailToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :bike_park_detail, :string
  end
end
