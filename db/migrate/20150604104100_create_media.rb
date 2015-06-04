class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.belongs_to :store, index:true
      t.string :caption_text
      t.string :low_resolution
      t.string :thumbnail
      t.string :standard_resolution

      t.timestamps null: false
    end
  end
end
