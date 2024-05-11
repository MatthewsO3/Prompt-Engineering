class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :png_name
      t.string :desc

      t.timestamps
    end
  end
end
