class AddNameToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :setting_name, :string
  end
end
