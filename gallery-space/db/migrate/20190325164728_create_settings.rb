class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :theme_name
      t.string :background_color
      t.string :font
      t.string :youtube_URL_snippet
      t.integer :gallery_id

      t.timestamps
    end
  end
end
