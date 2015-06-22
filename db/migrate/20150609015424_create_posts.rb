class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title, limit: 50, null:false
    	t.text :context, null: false
    	t.integer :subject_id
      t.timestamps null: false
    end
  end
end
