class CreateMechanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanic_rides do |t|
      t.references :mechanic, index:true, foreign_key: true
      t.references :ride, index:true, foreign_key: true

      t.timestamps
    end
  end
end
