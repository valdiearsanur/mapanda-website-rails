class CreateAdminGames < ActiveRecord::Migration
  def change
    create_table :admin_games do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
