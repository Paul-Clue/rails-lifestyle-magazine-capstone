# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

art = Article.create(title: 'Tesla Article', text: 'Some News about Tesla', user_id: 1, category_id: 1)
art.image.attach(io: File.open('/capstone-logo1.png'), filename: 'capstone-logo1.png')

art = Article.create(title: 'Ford Article', text: 'Some News about Ford', user_id: 1, category_id: 2)
art.image.attach(io: File.open('/capstone-logo1.png'), filename: 'capstone-logo1.png')

art = Article.create(title: 'GM Article', text: 'Some News about Gm', user_id: 1, category_id: 3)
art.image.attach(io: File.open('/capstone-logo1.png'), filename: 'capstone-logo1.png')

art = Article.create(title: 'Lucid Article', text: 'Some News about Lucid', user_id: 1, category_id: 4)
art.image.attach(io: File.open('/capstone-logo1.png'), filename: 'capstone-logo1.png')

art = Article.create(title: 'Battery Article', text: 'Some News about Car Batteries', user_id: 1, category_id: 5)
art.image.attach(io: File.open('/capstone-logo1.png'), filename: 'capstone-logo1.png')

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

Vote.create(user_id: 1, article_id: 1)
