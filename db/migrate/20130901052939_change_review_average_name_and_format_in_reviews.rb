class ChangeReviewAverageNameAndFormatInReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :review_average, :average
    change_column :reviews, :average, :float
  end
end
