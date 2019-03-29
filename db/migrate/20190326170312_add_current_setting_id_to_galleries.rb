class AddCurrentSettingIdToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :current_setting_id, :integer
  end
end
