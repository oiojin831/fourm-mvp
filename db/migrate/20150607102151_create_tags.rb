class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :price
      t.string :category
      t.string :name
      t.references :medium, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
