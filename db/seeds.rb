# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
connection = ActiveRecord::Base.connection()
connection.execute('ALTER SEQUENCE categories_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE articles_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE votes_id_seq RESTART WITH 1')

User.create(user_name: 'Initial Data')

Category.create(name: 'Tesla', priority: 1)
Category.create(name: 'Ford', priority: 2)
Category.create(name: 'GM', priority: 3)
Category.create(name: 'Lucid', priority: 4)
Category.create(name: 'Battery', priority: 5)

Article.create(title: 'Tesla Article', text: 'Some News about Tesla', 
image: "https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
user_id: 1, category_id: 1)

Article.create(title: 'Ford Article', text: 'Some News about Ford',
 image: "https://images.pexels.com/photos/3757231/pexels-photo-3757231.png?auto=compress&cs=tinysrgb&dpr=1&w=500", 
user_id: 1, category_id: 2)


 Article.create(title: 'GM Article', text: 'Some News about Gm', 
 image: "https://images.pexels.com/photos/5214413/pexels-photo-5214413.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
 user_id: 1, category_id: 3)

 Article.create(title: 'Lucid Article', text: 'Some News about Lucid', 
 image: "https://images.pexels.com/photos/4143686/pexels-photo-4143686.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
 user_id: 1, category_id: 4)

Article.create(title: 'Battery Article', text: 'Some News about Car Batteries', 
image: "https://images.pexels.com/photos/358189/pexels-photo-358189.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", 
user_id: 1, category_id: 5)

Vote.create(user_id: 1, article_id: 1)
