class AddCityIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :city_id, :integer
  end
end
