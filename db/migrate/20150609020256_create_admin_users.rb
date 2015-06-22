class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
    	t.string :last_name, limit: 30
    	t.string :first_name, limit: 30
    	t.string :username
    	t.string :password_digest
      t.timestamps null: false
    end
  end
end
