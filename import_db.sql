
PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;



CREATE TABLE users
(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions
(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user VARCHAR(255) NOT NULL,

  FOREIGN KEY (user) REFERENCES users(id)
);

CREATE TABLE question_follows
(
  id INTEGER PRIMARY KEY,
  user VARCHAR(255) NOT NULL,
  question VARCHAR(255) NOT NULL,
    FOREIGN KEY (user) REFERENCES users(id),
    FOREIGN KEY (question) REFERENCES questions(id)
);

CREATE TABLE replies
(
  id INTEGER PRIMARY KEY,
  user VARCHAR(255) NOT NULL,
  question VARCHAR(255) NOT NULL,
  reply VARCHAR(255),
  body VARCHAR(255),

  FOREIGN KEY (question) REFERENCES questions(id)
);


CREATE TABLE question_likes
(
  id INTEGER PRIMARY KEY,
  user VARCHAR(255) NOT NULL,
  question VARCHAR(255) NOT NULL,
  likes INTEGER NOT NULL,

  FOREIGN KEY (user) REFERENCES users(id),
  FOREIGN KEY (question) REFERENCES questions(id)
);

INSERT INTO
  users
  (fname, lname)
VALUES
  ('Ted', 'Nugent')
;

INSERT INTO
  questions
  (title, body, user)
  VALUES
    ('How to drible', 'hands, duh.', 1);

INSERT INTO
  question_follows
  (user, question)
  VALUES
    (1, 1);


INSERT INTO
  replies
  (user, question, reply, body)
VALUES
  (1, 1, 'nah with feet, dead ass cuz', 'don''t @ me brotatto');


INSERT INTO
  question_likes
  (user, question, likes)
VALUES
  (1, 1, 1);



