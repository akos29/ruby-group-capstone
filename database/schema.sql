CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(120) );

CREATE TABLE book (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(50) NOT NULL,
  published_date DATE NOT NULL,
  archived BOOLEAN,
  label_id INT,
  author_id INT,
  genre_id INT,
  CONSTRAINT book_fk
    FOREIGN KEY(label_id) REFERENCES label(id) ON DELETE CASCADE
    -- FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
    -- FOREIGN KEY(genre_id) REFERENCES genre(id) ON DELETE CASCADE
);

CREATE TABLE musicalbums (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    label_id INT,
    genre_id INT,
    author_id INT,
    FOREIGN KEY (label_id) REFERENCES label (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (genre_id) REFERENCES genre (id),
);

CREATE TABLE genre (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);



