# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [{name: 'Exercise'}, {name: 'Education'}, {name: 'Recepie'}]

categories.each do |category|
    c = Category.find_or_create_by(category)
    puts c 
end