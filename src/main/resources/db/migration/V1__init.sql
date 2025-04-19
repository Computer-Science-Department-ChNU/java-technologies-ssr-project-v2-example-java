CREATE TABLE author
(
    id   SERIAL PRIMARY KEY,
    name TEXT,
    profile_name TEXT
);

CREATE TABLE blog_post
(
    id        SERIAL PRIMARY KEY,
    author_id INT  NOT NULL,
    title     TEXT NOT NULL,
    content   TEXT NOT NULL,
    publishing_date DATE NOT NULL,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author (id)
);
