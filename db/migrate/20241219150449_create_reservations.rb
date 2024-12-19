class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.date :date
      t.string :time
      t.text :message

      t.timestamps
    end
  end
end
