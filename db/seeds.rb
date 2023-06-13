# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
jone = User.create!({
                      name: 'Jone',
                      email: 'jone@example.com',
                      password: '********',
                      telephone_number: 111_111,
                      date_of_birth: Date.new(2000, 1, 1)
                    })
jone.icon.attach(io: File.open(Rails.root.join('app/assets/images/dog.jpg')),
                 filename: 'dog.jpeg')
jone.skip_confirmation!
jone.save!

nick = User.create!({
                      name: 'Nick',
                      email: 'nick@example.com',
                      password: '********',
                      telephone_number: 111_111,
                      date_of_birth: Date.new(2000, 1, 1)
                    })
nick.icon.attach(io: File.open(Rails.root.join('app/assets/images/shark.jpg')),
                 filename: 'shark.jpeg')
nick.skip_confirmation!
nick.save!

maria = User.create!({
                       name: 'Maria',
                       email: 'maria@example.com',
                       password: '********',
                       telephone_number: 111_111,
                       date_of_birth: Date.new(2000, 1, 1)
                     })
maria.icon.attach(io: File.open(Rails.root.join('app/assets/images/banana.jpg')),
                  filename: 'banana.jpeg')
maria.skip_confirmation!
maria.save!

emma = User.create!({
                      name: 'Emma',
                      email: 'emma@example.com',
                      password: '********',
                      telephone_number: 111_111,
                      date_of_birth: Date.new(2000, 1, 1)
                    })
emma.icon.attach(io: File.open(Rails.root.join('app/assets/images/book.jpg')),
                 filename: 'book.jpeg')
emma.skip_confirmation!
emma.save!

jone.tweets.create!(text: 'Test tweet from John')
jone.tweets.create!(text: 'Hello from John')
nick.tweets.create!(text: 'Test tweet from Nick')
nick.tweets.create!(text: 'Hello')
maria.tweets.create!(text: 'Test tweet from Maria')
maria.tweets.create!(text: 'Hello from Maria')
emma.tweets.create!(text: 'Test tweet from Emma')
emma.tweets.create!(text: 'Hello from Emma')

jone.following << nick
nick.following << maria
maria.following << emma
emma.following << jone
