class CreateSalles < ActiveRecord::Migration
  def change
    create_table :salles do |t|
      t.integer :document_id, :auto_increment=1, :null => false
      t.string :purchaser
      t.string :description
      t.float :unit_price
      t.integer :quantity
      t.string :address
      t.string :provider

      t.timestamps
    end
  end
end
