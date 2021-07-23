class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string     :postal,        null: false
      t.integer    :from_id,       null: false
      t.string     :city,          null: false
      t.string     :street,        null: false
      t.string     :bldg,          null: true
      t.string     :tel,           null: false
      t.references :sale,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
