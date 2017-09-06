class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
    	t.string :model
    	t.string :brand
    	t.integer :price
    	t.integer :cylinders
    	t.integer :horsepower
    	t.integer :torque
    	t.integer :mileage
      t.timestamps
    end
  end
end
