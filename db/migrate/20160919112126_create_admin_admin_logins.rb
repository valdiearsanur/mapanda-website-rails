class CreateAdminAdminLogins < ActiveRecord::Migration
  def change
    create_table :admin_admin_logins do |t|
      t.string :username 
      t.string :email
      t.string :encrypted_password 

      t.timestamps null: false
    end
  end
end
