class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :email
      t.string :name
      t.string :surname
      t.string :date_of_concert

      t.timestamps
    end
    add_index :guests, :email, unique: true
  end
end
