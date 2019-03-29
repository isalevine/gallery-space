class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :owner_user_id
      t.string :target_user_id

      t.timestamps
    end
  end
end
