class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string :name, null:false, limit:30
    	t.string :body, null: false
    	t.integer :position
      t.timestamps null: false
    end
  end
end
