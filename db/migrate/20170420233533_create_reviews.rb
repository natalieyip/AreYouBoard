class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :game
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
