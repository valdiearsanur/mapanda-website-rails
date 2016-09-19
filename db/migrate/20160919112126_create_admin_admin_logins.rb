class CreateAdminAdminLogins < ActiveRecord::Migration
  def change
    create_table :admin_admin_logins do |t|
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
