DROP DATABASE IF EXISTS movielook;
CREATE DATABASE movielook;
USE movielook;

-- Основные таблицы

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	id SERIAL PRIMARY KEY,
	company VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO companies VALUES
(null, '20th Century Fox'),
(null, 'Warner Bros. Pictures'),
(null, 'Miramax Films'),
(null, 'Paramount Pictures');


DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	country VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO countries VALUES
('1', 'USA'),
('2', 'Russia'),
('3', 'France'),
('4', 'China');

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id SERIAL PRIMARY KEY,
	genre VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO genres VALUES
(null, 'Drama'),
(null, 'Detective'),
(null, 'Comedy'),
(null, 'Horrors');


DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
	id SERIAL PRIMARY KEY,
	role VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO roles VALUES 
	(null,'Executive producer'),
	(null,'Producer'),
	(null,'Director'),
	(null,'Writer'),
	(null,'Star'),
	(null,'Director of photography'),
	(null,'Film editor'),
	(null,'Casting '),
	(null,'Production Design'),
	(null,'Music');


DROP TABLE IF EXISTS title_types;
CREATE TABLE title_types (
	id SERIAL PRIMARY KEY,
	title_type VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO title_types 
VALUES
	(null,'Feature Film'),
	(null,'TV Movie'),
	(null,'TV Series'),
	(null,'Short Film'),
	(null,'Mini-Series'),
	(null,'Animation');

-- Пользователи

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	signed_up_at TIMESTAMP DEFAULT now(),
	username VARCHAR(50) UNIQUE,
	email VARCHAR(100) UNIQUE,
	phone_number BIGINT UNSIGNED UNIQUE,
	password_hash VARCHAR(100)
);

INSERT INTO users 
	(signed_up_at, email, phone_number, username, password_hash)
VALUES
('2014-05-09 03:24:02', 'elenor38@example.net', '4950144780', 'Tom', '2a222fcf5b1ffbe617f76b52e5c5a6780e0887fb'),
	('2017-09-22 12:01:02', 'lonnie.kuhic@example.org', '4995294899', 'Nash',
	 '55ae81b6762d47357a7f3708b62949cd9d98af4d'),
	('2018-03-07 04:55:33', 'steuber.velva@example.net', '4976488900', 'Laron',
	 '8517d50e94d7cc224cf3891fd9a71c1ca09139e2'),
	('2017-11-22 02:36:44', 'cwolf@example.com', '4970071668', 'Adolph', 'a8072e013638d0e99f5216188b47e1f9b36449cd'),
	('2000-05-26 08:01:30', 'jody.greenfelder@example.com', '4966246382', 'Jewel',
	 '04198e320dfe2518e7d5cf935cda4022f183fe75'),
	('2018-06-30 13:36:21', 'quigley.courtney@example.net', '4965667755', 'Wyman',
	 '91cc0a6c832b89829963fbb66be787b308674477'),
	('2003-07-15 19:57:38', 'lorine.parisian@example.org', '4958005160', 'Austen',
	 '2cd2a51ca4719897191281b8b0be400ca6dd1750'),
	('2018-09-21 08:12:40', 'ggoldner@example.net', '4996424678', 'Delores',
	 'edd6e703e7dae15e653b64bad9c101aa127a196d'),
	('2018-01-23 21:27:30', 'dubuque.rupert@example.net', '4983168732', 'Chaz',
	 'b4a973c4f37754ec71a9e91762d77cdf3ef6a37e'),
	('2017-12-06 20:18:35', 'akutch@example.net', '4987902484', 'Michale', '443c2e68a2cb04ee1294437690d594b0c39ccf14'),
	('2019-11-04 18:38:11', 'elian34@example.com', '4951774599', 'Merritt', '7b065af1269b7174d7e77e5dd81e0c300b29632a'),
	('2018-03-11 01:54:25', 'renner.gideon@example.net', '4990971678', 'Nellie',
	 'ae36d94fa976e1b2c3b2407eaa9a2337cd9e8380');


DROP TABLE IF EXISTS user_profiles;
CREATE TABLE user_profiles (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	updated_at TIMESTAMP DEFAULT now(),
	first_name VARCHAR(100) DEFAULT ' ',
	last_name VARCHAR(100) DEFAULT ' ',
	gender ENUM ('m', 'f'),
	date_of_birth DATE,
	country_id BIGINT UNSIGNED,
	about VARCHAR(350) DEFAULT ' ',
	is_private BIT DEFAULT 0,
    user_del_id BIGINT DEFAULT NULL,
	INDEX user_name_idx (first_name, last_name),
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (country_id) REFERENCES countries (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO user_profiles
	(user_id, first_name, last_name, gender, date_of_birth, country_id, about, is_private)
VALUES
	('1', 'Isai', 'Mraz', 'm', '1996-02-04', '4',
	 'Said cunning old Fury: \"I\'ll try the whole cause, and condemn you to leave off being arches to do with you. Mind now!\' The poor little thing was snorting like a stalk out of court! Suppress him! Pinch him! Off with his tea spoon at the Footman\'s head: it just at first, but, after watching it a violent blow underneath her chin: it had fallen into.',
	 0),
	('2', 'Quentin', 'O\'Kon', 'f', '1977-03-06', '2',
	 'I might venture to say to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have dropped them, I wonder?\' As she said to herself; \'I should like to show you! A little bright-eyed terrier, you know, and he hurried off. Alice thought to herself, \'if one only knew how to.',
	 0),
	('3', 'Dorothea', 'Luettgen', 'f', '1995-10-16', '1',
	 'Alice was beginning to write out a box of comfits, (luckily the salt water had not gone (We know it to the tarts on the door and went on all the first witness,\' said the Queen, tossing her head down to them, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the arches are gone from this side of the court. (As that is.',
	 1),
	('4', 'Heath', 'Towne', 'f', '2011-06-10', '2',
	 'I hadn\'t quite finished my tea when I got up this morning? I almost think I may as well wait, as she could see, as she spoke. Alice did not dare to disobey, though she felt unhappy. \'It was much pleasanter at home,\' thought poor Alice, \'it would be of any that do,\' Alice hastily replied; \'at least--at least I know is, something comes at me like.',
	 1),
	('5', 'Darrel', 'Funk', 'm', '1995-07-10', '3',
	 'I needn\'t be afraid of it. Presently the Rabbit angrily. \'Here! Come and help me out of THIS!\' (Sounds of more broken glass.) \'Now tell me, please, which way you can;--but I must have been a RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know where Dinn may be,\' said the Mock Turtle sighed deeply, and began, in a shrill,.',
	 1),
	('6', 'Nayeli', 'Zemlak', 'f', '1999-02-02', '1',
	 'VOICE OF THE SLUGGARD,\"\' said the Rabbit whispered in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least notice of them at last, and they went up to them to sell,\' the Hatter were having tea at it: a Dormouse was sitting on a bough of a book,\' thought Alice to herself, as she was quite impossible to.',
	 0),
	('7', 'Gay', 'Johnson', 'm', '2001-08-13', '2',
	 'Mock Turtle, who looked at Alice. \'I\'M not a VERY good opportunity for making her escape; so she took up the other, trying every door, she found her head made her look up in such long ringlets, and mine doesn\'t go in ringlets at all; and I\'m sure she\'s the best cat in the distance, sitting sad and lonely on a branch of a muchness?\' \'Really, now.',
	 0),
	('8', 'Cassie', 'Bernier', 'f', '2010-04-05', '1',
	 'I suppose, by being drowned in my time, but never ONE with such sudden violence that Alice had no idea what a Mock Turtle replied in a rather offended tone, \'so I should say what you had been broken to pieces. \'Please, then,\' said the Mouse heard this, it turned round and look up and bawled out, \"He\'s murdering the time! Off with his tea spoon at.',
	 1),
	('9', 'Roxane', 'Davis', 'f', '2018-12-08', '4',
	 'CHAPTER VI. Pig and Pepper For a minute or two to think to herself, \'Which way? Which way?\', holding her hand in hand, in couples: they were getting extremely small for a minute, trying to box her own ears for having cheated herself in the air. Even the Duchess asked, with another dig of her head pressing against the roof of the country is, you.',
	 1),
	('10', 'Tania', 'Schmeler', 'f', '1997-08-17', '3',
	 'Queen ordering off her knowledge, as there was Mystery,\' the Mock Turtle with a little while, however, she again heard a little wider. \'Come, it\'s pleased so far,\' thought Alice, \'and if it thought that SOMEBODY ought to be ashamed of yourself for asking such a thing before, but she added, \'and the moral of that is, but I think that there was no.',
	 0);


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user BIGINT UNSIGNED,
	to_user BIGINT UNSIGNED,
	created_at TIMESTAMP DEFAULT now(),
	body_text TEXT NOT NULL,
	FOREIGN KEY (from_user) REFERENCES users (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	FOREIGN KEY (to_user) REFERENCES users (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO messages
	(from_user, to_user, body_text)
VALUES
	('2', '3',
	 'Et esse est qui culpa fugiat. Quis et autem unde ut reprehenderit est delectus. Quae laborum ad iste vel provident animi. Rerum dolores ex aut quis.'),
	('8', '4',
	 'Assumenda occaecati laboriosam non culpa placeat deserunt. Dicta sed aut dolorem est. Laudantium iusto molestias assumenda fugit id iste.'),
	('1', '5',
	 'Corporis qui consequatur quod corporis exercitationem sunt corrupti. Qui assumenda unde quia repudiandae. Voluptate qui alias rerum molestiae fuga sunt quo.'),
	('5', '2',
	 'Reprehenderit nobis molestiae quisquam ad ea. Deleniti ut qui ut occaecati praesentium. Aut enim rerum est sit.'),
	('4', '8',
	 'Sint praesentium eaque sint. Ut enim et consequuntur et veniam aliquam ullam. Amet aut saepe repellendus iure. Velit voluptate labore minima qui aperiam officia. Quo eos aperiam porro ipsa cumque.'),
	('2', '6',
	 'Repellat laboriosam nulla et aut aut in. Eos atque corporis placeat molestiae voluptas. Quia quia temporibus quidem id ab.'),
	('3', '1',
	 'Excepturi expedita numquam harum aut rerum consequatur omnis illo. Et ipsam ullam aut eius. Eaque sequi eligendi consectetur. Autem a facere error nam exercitationem.'),
	('3', '8',
	 'Soluta occaecati aliquam culpa. Sequi alias et repudiandae nam ea ab iure. Libero voluptas veritatis qui debitis eius. Architecto expedita doloremque rerum a qui sequi facere soluta.'),
	('7', '8',
	 'Sint iste optio voluptas sunt. Aut quam ut accusamus similique. Ducimus cumque soluta perspiciatis et qui quia est et. Expedita sed non beatae ex et consectetur corporis.'),
	('2', '3',
	 'Architecto et beatae qui incidunt pariatur reprehenderit repellendus. Reiciendis necessitatibus inventore aspernatur esse. Nobis expedita hic placeat sunt nostrum atque.');


-- Название

DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	original_title VARCHAR(100) DEFAULT ' ',
	INDEX (title),
	INDEX (original_title)
);

INSERT INTO titles 
VALUES
	('1', 'Greenfelder Inc', 'Kovacek-Gleason'),
	('2', 'Waelchi, Reichel and Haley', 'Botsford, Howe and Klocko'),
	('3', 'Roob, Dibbert and Ebert', ''),
	('4', 'Mertz, Durgan and Heaney', 'Ondricka, Farrell and Christiansen'),
	('5', 'Wisozk Ltd', 'Boyle-Armstrong'),
	('6', 'Stiedemann, Bernier and Ullrich', 'Wisozk, Haag and Schuster'),
	('7', 'Beer-Cruickshank', ''),
	('8', 'O\'Hara-Ziemann', '');

DROP TABLE IF EXISTS title_info;
CREATE TABLE title_info (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	title_type_id BIGINT UNSIGNED DEFAULT 1,
	tagline VARCHAR(200) DEFAULT ' ',
	synopsis VARCHAR(500) DEFAULT ' ',
	release_date DATE,
	rars ENUM ('0+', '6+', '12+', '16+', '18+', 'NR') DEFAULT 'NR',
	INDEX (release_date),
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (title_type_id) REFERENCES title_types (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO title_info(title_id, title_type_id, tagline, synopsis, release_date, rars)
VALUES
	('1', '4', 'Expanded secondary product',
	 'Alice, \'when one wasn\'t always growing larger and smaller, and being so many lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t like them!\' When the procession moved on, three of the day; and this was not even room for this, and she thought to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I suppose?\' said Alice. \'Call.',
	 '2000-05-19', 'NR'),
	('2', '6', 'Multi-channelled bottom-line complexity',
	 'I to do it! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a tree. \'Did you say it.\' \'That\'s nothing to what I should be like then?\' And she began again: \'Ou est ma chatte?\' which was full of soup. \'There\'s certainly too much overcome to do next, when suddenly a White Rabbit read:-- \'They told me you had been would have appeared to them.',
	 '2002-04-13', '18+'),
	('3', '5', 'Enhanced regional concept',
	 'As soon as it turned round and swam slowly back again, and all must have imitated somebody else\'s hand,\' said the Gryphon replied very solemnly. Alice was not here before,\' said Alice,) and round Alice, every now and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to you?.',
	 '2016-11-07', '6+'),
	('4', '2', 'Fully-configurable fault-tolerant flexibility',
	 'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go nearer till she was playing against herself, for this curious child was very fond of pretending to be seen--everything seemed to Alice a good thing!\' she said this, she was quite a long time with the day and night! You see the earth takes twenty-four hours to turn into a pig, my dear,\' said.',
	 '2006-08-15', '18+'),
	('5', '5', 'Fully-configurable real-time knowledgeuser',
	 'Hatter. \'You might just as she could guess, she was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter with a bound into the loveliest garden you ever saw. How she longed to get in at once.\' And in she went. Once more she found that it had gone. \'Well! I\'ve often seen them at dinn--\' she checked herself hastily. \'I thought you.',
	 '1985-10-18', '16+'),
	('6', '4', 'Diverse background emulation',
	 'Alice, surprised at her own courage. \'It\'s no business of MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a good character, But said I didn\'t!\' interrupted Alice. \'You did,\' said the Caterpillar contemptuously. \'Who are YOU?\' said the Mock Turtle repeated thoughtfully. \'I should like to be.',
	 '1994-04-27', '18+');


-- Доп. информация

DROP TABLE IF EXISTS title_country;
CREATE TABLE title_country (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	country_id BIGINT UNSIGNED,
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (country_id) REFERENCES countries (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO title_country(title_id, country_id)
VALUES
	('1', '4'),
	('2', '3'),
	('3', '1'),
	('4', '2'),
	('5', '1');

DROP TABLE IF EXISTS title_company;
CREATE TABLE title_company (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	company_id BIGINT UNSIGNED,
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (company_id) REFERENCES companies (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO title_company(title_id, company_id)
VALUES
	('1', '3'),
	('2', '4'),
	('3', '2'),
	('4', '1'),
	('5', '4'),
	('6', '2');


DROP TABLE IF EXISTS creators;
CREATE TABLE creators (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	date_of_birth DATE,
	date_of_death DATE DEFAULT NULL,
	gender ENUM ('m', 'f'),
	country_id BIGINT UNSIGNED,
	INDEX creator_name_idx (first_name, last_name),
	FOREIGN KEY (country_id) REFERENCES countries (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO creators(first_name, last_name, date_of_birth, gender, country_id)
VALUES
	('Watson', 'White', '1987-06-23', 'm', '1'),
	('Otis', 'Jacobson', '1987-12-14', 'f', '2'),
	('Vilma', 'McLaughlin', '1987-08-23', 'f', '4'),
	('Karley', 'Moore', '1987-06-29', 'f','4'),
	('Elsie', 'Corkery', '1987-08-16', 'm','3'),
	('Antwan', 'Dooley', '1987-01-31', 'f', '1');


DROP TABLE IF EXISTS person;
CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	role_id BIGINT UNSIGNED,
	creator_id BIGINT UNSIGNED,
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (role_id) REFERENCES roles (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	FOREIGN KEY (creator_id) REFERENCES creators (id)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

INSERT INTO person(title_id, role_id, creator_id)
VALUES
	('1', '3', '4'),
	('2', '3', '3'),
	('3', '3', '1'),
	('4', '3', '2');

-- Информация о пользователях для выбора ограничений

DROP TABLE IF EXISTS all_keywords;
CREATE TABLE all_keywords (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	keyword VARCHAR(100) UNIQUE,
	created_at TIMESTAMP DEFAULT now(),

	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO all_keywords
	(user_id, keyword)
VALUES
	('1', 'marvel'),
	('2', 'var'),
	('3', 'police'),
	('4', 'vikings'),
	('5', 'ships');

DROP TABLE IF EXISTS votes_keywords;
CREATE TABLE votes_keywords (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	keyword_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED,
	vote BIT DEFAULT 1,
	created_at TIMESTAMP DEFAULT now(),
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (keyword_id) REFERENCES all_keywords (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO votes_keywords(title_id, keyword_id, user_id, vote)
VALUES
	('1', '1', '4', 0),
	('2', '3', '4', 1),
	('3', '3', '2', 1),
	('4', '3', '3', 1),
	('5', '4', '1', 0),
	('2', '5', '2', 1),
	('4', '2', '1', 1),
	('1', '3', '3', 1);

DROP TABLE IF EXISTS votes_genre;
CREATE TABLE votes_genre (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	genre_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED,
	vote BIT,
	created_at TIMESTAMP DEFAULT now(),
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES genres (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO votes_genre(title_id, genre_id, user_id, vote)
VALUES
	('4', '1', '1', 0),
	('1', '2', '3', 1),
	('3', '4', '5', 0),
	('5', '4', '2', 1),
	('2', '3', '4', 0);

DROP TABLE IF EXISTS rating;
CREATE TABLE rating (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	rating TINYINT UNSIGNED NOT NULL DEFAULT 0,
	created_at TIMESTAMP DEFAULT now(),
	updated_at TIMESTAMP DEFAULT now(),
	INDEX (rating),
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO rating
	(title_id, user_id, rating) 
VALUES
	('5', '1', '2'),
	('4', '5', '4'),
	('2', '5', '5'),
	('1', '4', '1'),
	('3', '3', '1');


-- фильмы

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
	id SERIAL PRIMARY KEY,
	title_id BIGINT UNSIGNED,
	user_id BIGINT UNSIGNED,
	is_seen BIT DEFAULT 0,
	created_at TIMESTAMP DEFAULT now(),
	updated_at TIMESTAMP DEFAULT now(),
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO movies(title_id, user_id, is_seen) 
VALUES
	('5', '5', 1),
	('1', '2', 1),
	('3', '1', 1),
	('2', '1', 1),
	('4', '4', 0);


DROP TABLE IF EXISTS user_lists;
CREATE TABLE user_lists (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED,
	list_name VARCHAR(50) DEFAULT ' ',
	description VARCHAR(100) DEFAULT ' ',
	is_private BIT DEFAULT 0,
	created_at TIMESTAMP DEFAULT now(),
	INDEX (list_name),
	INDEX (is_private),
	FOREIGN KEY (user_id) REFERENCES users (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO user_lists(user_id, list_name, description, is_private)
VALUES
	('2', 'O\'Kon PLC', 'Cross-group real-time customerloyalty', 0),
	('3', 'Jakubowski-O\'Conner', 'Multi-layered encompassing GraphicalUserInterface', 1),
	('5', 'Grimes Group', 'Advanced national project', 0),
	('1', 'Bartell Inc', 'Profound methodical function', 0),
	('4', 'Reilly-Schneider', 'Multi-tiered clear-thinking access', 1);
    
    

DROP TABLE IF EXISTS user_list_items;
CREATE TABLE user_list_items (
	id SERIAL PRIMARY KEY,
	list_id BIGINT UNSIGNED NOT NULL,
	title_id BIGINT UNSIGNED,
	created_at TIMESTAMP DEFAULT now(),
	FOREIGN KEY (list_id) REFERENCES user_lists (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (title_id) REFERENCES titles (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

INSERT INTO user_list_items(list_id, title_id)
VALUES
	('1', '2'),
	('2', '3'),
	('3', '5'),
	('4', '1'),
	('5', '4');


-- Функции удаления из списка

DROP FUNCTION IF EXISTS g_relevancy;
DELIMITER //
CREATE FUNCTION g_relevancy(t_id INT UNSIGNED, g_id INT UNSIGNED)
	RETURNS INT DETERMINISTIC
BEGIN
	RETURN (SELECT likes.c - dislikes.c
			  FROM (
					   SELECT count(vote) AS c
						 FROM votes_genre
						WHERE vote = 1 AND title_id = t_id AND genre_id = g_id
				   ) AS likes
					   JOIN (
				  SELECT count(vote) AS c
					FROM votes_genre
				   WHERE vote = 0 AND title_id = t_id AND genre_id = g_id
							) AS dislikes
		   );
END;
//
DELIMITER ;
DROP FUNCTION IF EXISTS g_relevancy;

-- Функция реливантности ключевых слов
DROP FUNCTION IF EXISTS k_relevancy;
DELIMITER //
CREATE FUNCTION k_relevancy(t_id INT UNSIGNED, k_id INT UNSIGNED)
	RETURNS INT DETERMINISTIC
BEGIN
	RETURN (SELECT likes.c - dislikes.c
			  FROM (
					   SELECT count(vote) AS c
						 FROM votes_keywords
						WHERE vote = 1 AND title_id = t_id AND keyword_id = k_id
				   ) AS likes
					   JOIN (
				  SELECT count(vote) AS c
					FROM votes_keywords
				   WHERE vote = 0 AND title_id = t_id AND keyword_id = k_id
							) AS dislikes
		   );
END;
//
DELIMITER ;
DROP FUNCTION IF EXISTS k_relevancy;

