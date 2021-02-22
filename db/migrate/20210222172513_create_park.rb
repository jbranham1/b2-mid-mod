class CreatePark < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :ticket_price
      t.string :integer

      t.timestamps
    end
  end
end
