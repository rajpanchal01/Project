# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(username: "smit", email: "smit.akhani@bacancy.com", password: "123456")
User.create!(username: "pranav", email: "pranav.dodiya@bacancy.com", password: "123456")
User.create!(username: "raj", email: "raj.panchal@bacancy.com", password: "123456")
User.create!(username: "priyanka", email: "priyanka.manna@bacancy.com", password: "123456")
User.create!(username: "smit1", email: "smitakhani2000@gmail.com", password: "123456")
User.create!(username: "raj1", email: "rajpanchal2810@gmail.com", password: "123456")
User.create!(username: "pranav1", email: "pranavdodiya72@gmail.com", password: "123456")
User.create!(username: "priyanka1", email: "mannapriyanka04@gmail.com", password: "123456")

ProjectMaster.create!(name: "Stock Market App", description: "An app for stock market equities", user_id: 1)
ProjectMaster.create!(name: "Chat App", description: "An app for real time chat App", user_id: 2)
ProjectMaster.create!(name: "E-commerce App", description: "An app for E-commerce", user_id: 3)
ProjectMaster.create!(name: "Food delivery", description: "An app for food delivery", user_id: 4)

Client.create!(name: "Client1", email: "client1@gmail.com")
Client.create!(name: "Client2", email: "client2@gmail.com")
Client.create!(name: "Client3", email: "client3@gmail.com")
Client.create!(name: "Client4", email: "client4@gmail.com")