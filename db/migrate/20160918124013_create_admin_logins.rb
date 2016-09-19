class CreateAdminLogins < ActiveRecord::Migration
  def change
    create_table :admin_logins do |t|
      t.string :adminname
      t.string :adminpassword

      t.timestamps null: false
    end
  end
end
