# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('User')
ApplicationRecord.connection.reset_pk_sequence!('Artwork')
ApplicationRecord.connection.reset_pk_sequence!('ArtworkShare')

User.create(username: 'jtf234')
User.create(username: 'faaswera')
User.create(username: 'blseeedsct')
User.create(username: 'deeokkdc')
User.create(username: 'helloid')
User.create(username: 'userandaed')

Artwork.create(title: "bladef", image_url: "http://fseassfe.com", artist_id: 1)
Artwork.create(title: "sdgbladef", image_url: "http://fsfdsfe.com", artist_id: 1)
Artwork.create(title: "blf", image_url: "http://fsege.com", artist_id: 1)
Artwork.create(title: "gsdfsef", image_url: "http://asdfassfe.com", artist_id: 4)
Artwork.create(title: "efef", image_url: "http://dfgadrr.com", artist_id: 3)
Artwork.create(title: "bgtgttg", image_url: "http://cvbcfrrr.com", artist_id: 2)
Artwork.create(title: "grrrtgttg", image_url: "http://cvbcfdr.com", artist_id: 5)

ArtworkShare.create(artwork_id: 1, viewer_id: 4)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 2)
ArtworkShare.create(artwork_id: 3, viewer_id: 1)
ArtworkShare.create(artwork_id: 4, viewer_id: 5)
