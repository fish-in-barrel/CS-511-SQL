CREATE database IF NOT EXISTS movie_theater_lab;
USE movie_theater_lab;

CREATE TABLE IF NOT EXISTS movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    rating VARCHAR(5),
    length INT,
    release_year INT
);

CREATE TABLE IF NOT EXISTS theaters (
    theater_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS districts (
    district_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS movies2theaters (
    movie_id INT REFERENCES movies(movie_id),
    theater_id INT REFERENCES theaters(theater_id),
    movie_time TIME,
    PRIMARY KEY (movie_id, theater_id, movie_time)
);

CREATE TABLE IF NOT EXISTS theaters2districts (
    theater_id INT REFERENCES theaters(theater_id),
    district_id INT REFERENCES districts(district_id),
    PRIMARY KEY (theater_id, district_id)
);

INSERT INTO movies (title, rating, length, release_year) VALUES
('The Shawshank Redemption', 'R', 142, 1994),
('The Godfather', 'R', 175, 1972),
('The Dark Knight', 'PG-13', 152, 2008),
('Pulp Fiction', 'R', 154, 1994),
('The Lord of the Rings: The Return of the King', 'PG-13', 201, 2003),
('Forrest Gump', 'PG-13', 142, 1994),
('Inception', 'PG-13', 148, 2010),
('Fight Club', 'R', 139, 1999),
('The Matrix', 'R', 136, 1999),
('Goodfellas', 'R', 146, 1990),
('Se7en', 'R', 127, 1995),
('Gladiator', 'R', 155, 2000),
('Interstellar', 'PG-13', 169, 2014),
('The Green Mile', 'R', 189, 1999),
('Braveheart', 'R', 178, 1995),
('The Lion King', 'G', 88, 1994),
('Toy Story', 'G', 81, 1995),
('Finding Nemo', 'G', 100, 2003),
('The Incredibles', 'PG', 115, 2004),
('Shrek', 'PG', 90, 2001),
('Monsters, Inc.', 'G', 92, 2001),
('Coco', 'PG', 105, 2017),
('Up', 'PG', 96, 2009),
('WALL-E', 'G', 98, 2008),
('Inside Out', 'PG', 95, 2015);

INSERT INTO districts (name) VALUES
('Capitol Hill'), ('Downtown'), ('University District'),
('Ballard'), ('Fremont'), ('Greenwood'), ('Magnolia'),
('West Seattle'), ('Northgate'), ('Rainier Valley'),
('Belltown'), ('Queen Anne'), ('Columbia City'),
('Lake City'), ('Beacon Hill'), ('Central District'),
('International District'), ('Wallingford'),
('Ravenna'), ('Madrona'), ('Madison Park'),
('SoDo'), ('South Lake Union'), ('Phinney Ridge'),
('Montlake');

INSERT INTO theaters (name, phone) VALUES
('Landmark Neptune Theatre', '206-555-1001'),
('AMC Pacific Place', '206-555-1002'),
('Regal Meridian 16', '206-555-1003'),
('Cinerama', '206-555-1004'),
('Majestic Bay Theatres', '206-555-1005'),
('Ark Lodge Cinemas', '206-555-1006'),
('Central Cinema', '206-555-1007'),
('SIFF Cinema Uptown', '206-555-1008'),
('Northwest Film Forum', '206-555-1009'),
('The Big Picture', '206-555-1010'),
('Varsity Theatre', '206-555-1011'),
('Grand Illusion Cinema', '206-555-1012'),
('Seven Gables Theater', '206-555-1013'),
('Crest Cinema Center', '206-555-1014'),
('Kirkland Performance Center', '206-555-1015'),
('Olympic Cinemas', '206-555-1016'),
('Redmond Town Center Cinema', '206-555-1017'),
('Everett Mall Stadium 16', '206-555-1018'),
('Alderwood Mall 16', '206-555-1019'),
('Lincoln Square Cinemas', '206-555-1020'),
('Parkway Plaza', '206-555-1021'),
('Issaquah Cineplex', '206-555-1022'),
('Bellevue Cinebarre', '206-555-1023'),
('Federal Way Cinemark', '206-555-1024'),
('Tacoma Grand Cinemas', '206-555-1025');

INSERT INTO movies2theaters (movie_id, theater_id, movie_time) VALUES
(1, 1, '18:00:00'), (2, 2, '20:00:00'), (3, 3, '21:30:00'),
(4, 4, '19:45:00'), (5, 5, '17:15:00'), (6, 6, '16:00:00'),
(7, 7, '14:30:00'), (8, 8, '18:30:00'), (9, 9, '20:45:00'),
(10, 10, '15:00:00'), (11, 11, '21:00:00'), (12, 12, '17:45:00'),
(13, 13, '19:00:00'), (14, 14, '16:15:00'), (15, 15, '13:00:00'),
(16, 16, '12:00:00'), (17, 17, '14:15:00'), (18, 18, '18:45:00'),
(19, 19, '20:30:00'), (20, 20, '15:45:00'), (21, 21, '19:15:00'),
(22, 22, '13:30:00'), (23, 23, '11:00:00'), (24, 24, '10:30:00'),
(25, 25, '17:00:00');

INSERT INTO theaters2districts (theater_id, district_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25);