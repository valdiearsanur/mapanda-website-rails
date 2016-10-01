class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :username 
      t.string :email
      t.string :password 

      t.timestamps null: false
    end
  end
end
