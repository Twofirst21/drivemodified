class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
    	t.string :brand_model
    	t.integer :price
    	t.integer :cylinders
    	t.integer :horsepower
    	t.integer :torque
    	t.integer :mileage
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
