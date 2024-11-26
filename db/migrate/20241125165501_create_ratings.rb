class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.date :visit_date
      t.integer :rating
      t.text :comment
      t.boolean :stroller
      t.boolean :changing_table
      t.boolean :high_chair
      t.boolean :kids_friendly
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
