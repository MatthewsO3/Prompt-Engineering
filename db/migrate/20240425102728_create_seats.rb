class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.string :number
      t.references :screen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
