class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name, index: true
      t.text :description
      t.integer :year
      t.string :director
      t.string :actor, index: true
      t.string :filming_location
      t.string :country

      t.timestamps
    end
  end
end
