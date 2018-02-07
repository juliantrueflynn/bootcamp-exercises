# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('User')
ApplicationRecord.connection.reset_pk_sequence!('Poll')
ApplicationRecord.connection.reset_pk_sequence!('Question')
ApplicationRecord.connection.reset_pk_sequence!('AnswerChoice')
ApplicationRecord.connection.reset_pk_sequence!('Response')

User.import(
[:username],
[['jtf2'],
['rickie'],
['gipoi']])

Poll.import(
[:user_id, :title],
[[1, "Test1 poll by same author - 1"],
[1, "Test2 poll by same author - 2"],
[2, "New author #3 poll"],
[3, "Last random poll"]])

Question.import(
[:text, :poll_id],
[["Test1 Q to poll", 1],
["Test2 Q to poll", 2],
["New Q #3 poll", 3],
["Last randomquestion", 4]])

AnswerChoice.import(
[:text, :question_id],
[["sdfa sdfa sdfas", 1],
["rtes rtsgv dfvsd", 2],
["wera we casd", 3],
["L sdfaswefa sdfn", 4]])

Response.import(
[:answer_choice_id, :respondent_id],
[[1, 1],
[2, 1],
[3, 2],
[4, 3]])