class AddReviewableIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewable_id, :integer
  end
end
