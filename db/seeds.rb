# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bob = User.create(username: "big bob")
bill = User.create(username: "coding kiddo", password: "secret")
sam = User.create(username: "iluvminions")
joe = User.create(username: "champ")

first_q = Question.create(title: "help", body: "how do i write code", user: bob)
second_q = Question.create(title: "how to use rails", body: "how do i create a new rails app?", user: bill)
third_q = Question.create(title: "what do i do with my life", body: "does god exist", user: sam)

first_a = Answer.create(title: "read a book", body: "try chris pine", user: joe, question: first_q)
second_a = Answer.create(title: "google it", body: "check out the rails documentation", user: sam, question: second_q)
