class AddColumeToSubjectsAndPosts < ActiveRecord::Migration
  def change
  	add_column "posts", "feature_image", :string
  	add_column "subjects", "feature_image", :string
  end
end
