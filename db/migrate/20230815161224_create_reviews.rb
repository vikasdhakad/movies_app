class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.integer :stars
      t.string :content

      t.timestamps
    end
  end
end
