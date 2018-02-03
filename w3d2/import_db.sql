DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body text NOT NULL,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),  
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Julian', 'Flynn'),
  ('Bobo', 'Clown'),
  ('Pooti', 'Tang'),
  ('Ninja', 'Man');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Hello world #1', 'Badum tshhhh', 1),
  ('Another post by me', 'This is 2nd post by me', 1),
  ('Lucky number 3 post', 'This is 3rd and final post by me', 1),
  ('Hello world #2', 'Blah blah blah blah blah', 2),
  ('Hello world #3', 'Lorem ipsum text', 2);

INSERT INTO
  question_follows (question_id, author_id)
VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2);

INSERT INTO
  replies (body, parent_id, question_id, author_id)
VALUES
  ('This is an amazing reply.', NULL, 1, 2),
  ('My reply is more amazing.', 1, 1, 1),
  ('Replying to my own post!', NULL, 1, 1);

INSERT INTO
  question_likes (question_id, author_id)
VALUES
  (1, 2), (1, 3), (1, 4), (2, 2), (2, 3), (2, 4), (3, 2), (4, 1), (5, 1);