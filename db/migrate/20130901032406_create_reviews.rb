class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :link
      t.integer :num_of_reviews
      t.integer :review_average

      t.timestamps
    end
  end
end
