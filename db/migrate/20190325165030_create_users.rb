class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :real_name
      t.string :location
      t.integer :age
      t.string :blurb

      t.timestamps
    end
  end
end
