class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :username
      t.integer :insta_id
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
