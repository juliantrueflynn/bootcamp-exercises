# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'activerecord-import'

cats = []
10.times do |i|
  random_date = Time.at(rand * Time.now.to_i)

  cats << Cat.new(
    :name => "Cat #{i}",
    :birth_date => random_date.to_date,
    :sex => %w(M F).shuffle.first,
    :color => Cat::CAT_COLORS.sample,
    :description => "This is number: #{i}. Lorem ipsum text."
  )
end
Cat.import! cats

rental_requests = []
start_date = Time.at(rand * Time.now.to_i).to_date
rental_requests << CatRentalRequest.new(
  :cat_id => 1,
  :start_date => start_date.to_date,
  :end_date => start_date.change(month: (1..9).to_a.sample).to_date,
  :status => "APPROVED"
)
3.times do |i|
  start_date = Time.at(rand * Time.now.to_i)

  rental_requests << CatRentalRequest.new(
    :cat_id => i + 1,
    :start_date => start_date.to_date,
    :end_date => start_date.change(month: (1..9).to_a.sample).to_date,
    :status => "APPROVED"
  )
end
CatRentalRequest.import! rental_requests