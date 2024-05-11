class CreateShowings < ActiveRecord::Migration[7.1]
  def change
    create_table :showings do |t|
      t.datetime :screening_time
      t.references :screen, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
