# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: "smit.akhani@bacancy.com", password: "123456")
User.create!(email: "pranav.dodiya@bacancy.com", password: "123456")
User.create!(email: "raj.panchal@bacancy.com", password: "123456")
User.create!(email: "priyanka.manna@bacancy.com", password: "123456")

ProjectMaster.create!(name: "Stock Market App", description: "An app for stock market equities", user_id: 2, ptype: true)