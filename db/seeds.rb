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
Image.all.destroy_all
Friend.all.destroy_all


# user1 = User.create(user_name: "Mantis Toboggan", password: "dr")
# user2 = User.create(user_name: "ooga booga1", password: "big")
#
#
# gallery1 = Gallery.create(name: "Dr. Toboggan Gallery", theme: "TV show memes", user_id: user1.id)
# setting1 = Setting.create(gallery_id: gallery1.id, theme_name: "default", background_color: "white", font: "Times New Roman", audio: "sS3oRq7a93I")
# gallery1.current_setting_id = setting1.id
# gallery1.save
#
#
# gallery2 = Gallery.create(name: "Ooga's Bobby Hill Jamboree!", theme: "memes, gifs, koth", user_id: user2.id)
# setting2 = Setting.create(gallery_id: gallery2.id, theme_name: "default", background_color: "white", font: "Times New Roman", audio: "Y0mM-J6wisU")
# gallery2.current_setting_id = setting2.id
# gallery2.save
