class AddDataToReviews < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :reviews, :data, :hstore
  end
end
