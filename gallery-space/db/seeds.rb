# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all
Gallery.all.destroy_all
Setting.all.destroy_all

user1 = User.create(user_name: "Mantis Toboggan", password: "dr")
user2 = User.create(user_name: "ooga booga1", password: "big")

settings1 = Setting.create(theme_name: "test", background_color: "pink")

gallery1 = Gallery.create(name: "Dr. Toboggan Gallery", theme: "TV show memes", user_id: user1.id, current_setting_id: settings1.id)
