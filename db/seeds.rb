# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users_data = [{name: "Sam Pedro", email: "sampedro@mail.com", password: 'p78@rt4AAzk'},
              {name: "Peter Troll", email: "petertroll@mail.com", password: 'p78@rt4AAzk'},
              {name: "Chris Bla", email: "chrisbla@mail.com", password: 'p78@rt4AAzk'},
              {name: "Suzan Something", email: "suzansomething@mail.com", password: 'p78@rt4AAzk'},
              {name: "Axel Ontheway", email: "axelontheway@mail.com", password: 'p78@rt4AAzk'},
              {name: "Mack Boe", email: "mackboe@mail.com", password: 'p78@rt4AAzk'},
              {name: "Rik van der Kroon", email: "rikvanderkroon@mail.com", password: 'p78@rt4AAzk'}]
User.create([users_data])
