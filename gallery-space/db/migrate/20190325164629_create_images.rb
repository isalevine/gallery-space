class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.integer :gallery_id
      t.string :artist
      t.string :medium
      t.string :link
      t.timestamps
    end
  end
end
