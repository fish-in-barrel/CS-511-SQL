CREATE DATABASE IF NOT EXISTS example_db;

USE example_db;

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each movie
    Title VARCHAR(255) NOT NULL,            -- Title of the movie
    Genre VARCHAR(100),                     -- Genre of the movie
    ReleaseYear INT,                        -- Year the movie was released
    Rating DECIMAL(3, 1) CHECK (Rating >= 0 AND Rating <= 10) -- Rating between 0 and 10
);

-- Insert 10 sample movies into the Movies table
INSERT INTO Movies (Title, Genre, ReleaseYear, Rating) VALUES
('The Shawshank Redemption', 'Drama', 1994, 9.3),
('The Godfather', 'Crime', 1972, 9.2),
('The Dark Knight', 'Action', 2008, 9.0),
('12 Angry Men', 'Drama', 1957, 9.0),
('Schindler''s List', 'Biography', 1993, 8.9),
('The Lord of the Rings: The Return of the King', 'Adventure', 2003, 8.9),
('Pulp Fiction', 'Crime', 1994, 8.9),
('The Good, the Bad and the Ugly', 'Western', 1966, 8.8),
('Forrest Gump', 'Drama', 1994, 8.8),
('Inception', 'Sci-Fi', 2010, 8.8);