-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 11:33 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mal`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime`
--

CREATE TABLE `anime` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `synopsis` text DEFAULT NULL,
  `episodes` int(11) DEFAULT 0,
  `status` enum('Airing','Completed','Planned') NOT NULL,
  `release_date` date DEFAULT NULL,
  `studio` varchar(100) DEFAULT NULL,
  `rating` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`id`, `title`, `synopsis`, `episodes`, `status`, `release_date`, `studio`, `rating`) VALUES
(1, 'Attack on Titan', 'In a world where humanity resides within enormous walled cities to protect themselves from Titans, gigantic humanoid creatures. Eren Yeager seeks revenge against them after a Titan destroyed his town.', 75, 'Airing', '2013-04-07', 'WIT Studio', 0),
(2, 'Fullmetal Alchemist: Brotherhood', 'In a world where alchemy is one of the most advanced sciences, two brothers search for the Philosopher\'s Stone to restore their bodies after a failed alchemical experiment.', 64, 'Completed', '2009-04-05', 'Studio Bones', 0),
(3, 'Steins;Gate', 'A group of friends discover a way to send messages to the past, but their meddling with time causes unforeseen consequences.', 24, 'Completed', '2011-04-06', 'White Fox', 0),
(4, 'Naruto: Shippuden', 'Naruto Uzumaki continues his journey to become the greatest ninja and protect his village while facing various challenges and enemies.', 500, 'Completed', '2007-02-15', 'Pierrot', 0),
(5, 'One Piece', 'Monkey D. Luffy and his pirate crew search for the world\'s ultimate treasure, the One Piece, in order to become the next Pirate King.', 1070, 'Airing', '1999-10-20', 'Toei Animation', 0),
(6, 'Death Note', 'A high school student discovers a notebook that allows him to kill anyone whose name is written in it, which leads him to a battle of wits with a brilliant detective.', 37, 'Completed', '2006-10-03', 'Madhouse', 0),
(7, 'Your Name', 'Two teenagers, a girl and a boy, find themselves mysteriously swapping bodies and must figure out how to communicate with each other across time and space.', 1, 'Completed', '2016-08-26', 'CoMix Wave Films', 0),
(8, 'Demon Slayer', 'Tanjiro Kamado seeks revenge against demons that killed his family and a cure for his sister Nezuko, who has turned into a demon.', 26, 'Airing', '2019-04-06', 'ufotable', 0),
(9, 'My Hero Academia', 'In a world where people with superpowers, called \"quirks,\" are the norm, a young boy without them dreams of becoming the greatest hero.', 113, 'Airing', '2016-04-03', 'Bones', 0),
(10, 'Cowboy Bebop', 'Set in the year 2071, a ragtag group of bounty hunters travels the galaxy in search of criminals, encountering various adventures and deep philosophical themes along the way.', 26, 'Completed', '1998-04-03', 'Sunrise', 0),
(11, 'Hunter x Hunter', 'Gon Freecss, a young boy who aspires to become a Hunter, sets out on a journey to find his father and become the greatest Hunter in the world.', 148, 'Completed', '2011-10-02', 'Madhouse', 0),
(12, 'Code Geass: Lelouch of the Rebellion', 'Lelouch vi Britannia, a former prince of the Holy Britannian Empire, gains the power to control others and uses it to lead a rebellion against the empire.', 25, 'Completed', '2006-10-05', 'Sunrise', 0),
(13, 'One Punch Man', 'Saitama is a hero who can defeat any opponent with a single punch. Bored with his power, he searches for a worthy opponent.', 12, 'Completed', '2015-10-05', 'Madhouse', 0),
(14, 'Neon Genesis Evangelion', 'A group of teenagers pilots giant mechs to protect Earth from mysterious creatures known as Angels, while struggling with their own personal and psychological issues.', 26, 'Completed', '1995-10-05', 'Gainax', 0),
(15, 'The Promised Neverland', 'A group of children escape an orphanage after discovering the horrifying truth about their lives and the fate that awaits them.', 12, 'Completed', '2019-01-11', 'CloverWorks', 0),
(16, 'Sword Art Online', 'Players of a virtual reality MMORPG find themselves trapped in the game and must fight their way to the top to escape.', 25, 'Completed', '2012-07-08', 'A-1 Pictures', 0),
(17, 'Attack on Titan: The Final Season', 'The final chapter of the struggle for humanity\'s survival against the Titans unfolds, as the truth behind their origin is revealed.', 16, 'Airing', '2020-12-07', 'MAPPA', 0),
(18, 'Mob Psycho 100', 'Shigeo Kageyama, a young boy with immense psychic powers, seeks to live a normal life despite his overwhelming abilities.', 12, 'Completed', '2016-07-11', 'Bones', 0),
(19, 'Fullmetal Alchemist', 'The story of two brothers who, after a failed alchemical experiment, must find the Philosopher\'s Stone to restore their bodies.', 51, 'Completed', '2003-10-04', 'Studio Bones', 0),
(20, 'Fruits Basket', 'Tohru Honda, an orphaned girl, becomes involved with a family cursed to transform into animals of the Chinese zodiac when hugged by the opposite sex.', 25, 'Completed', '2001-07-05', 'Studio Deen', 0),
(21, 'Re:Zero - Starting Life in Another World', 'Natsuki Subaru is transported to a fantasy world, where he must use his ability to return to death in order to change the course of events and save his friends.', 25, 'Airing', '2016-04-04', 'White Fox', 0),
(22, 'Black Clover', 'Asta, a young boy born without magic in a world where magic is everything, aims to become the Wizard King by overcoming various challenges.', 170, 'Airing', '2017-10-03', 'Studio Pierrot', 0),
(23, 'Gintama', 'Gintoki Sakata, an eccentric samurai in a futuristic world dominated by aliens, embarks on various comedic and action-packed adventures with his friends.', 367, 'Completed', '2006-04-04', 'Sunrise', 0),
(24, 'Toradora!', 'Ryuuji Takasu and Taiga Aisaka form an unlikely partnership as they try to help each other with their respective crushes while navigating high school life.', 25, 'Completed', '2008-10-02', 'J.C. Staff', 0),
(25, 'The Seven Deadly Sins', 'A group of knights called the Seven Deadly Sins is tasked with saving the kingdom from various threats, but their past is filled with dark secrets.', 24, 'Completed', '2014-10-05', 'A-1 Pictures', 0),
(26, 'Attack on Titan: No Regrets', 'A spinoff that focuses on Levi and his past before he became the legendary soldier he is known as in the main series.', 10, 'Completed', '2014-12-09', 'WIT Studio', 0),
(27, 'Attack on Titan', 'Humans fight for survival against the Titans, massive humanoid creatures.', 75, 'Airing', '2013-04-07', 'Wit Studio', 0),
(28, 'Fullmetal Alchemist: Brotherhood', 'Two brothers use alchemy in their quest to find the Philosopher\'s Stone and restore their bodies.', 64, 'Completed', '2009-04-05', 'Studio Bones', 0),
(29, 'Steins;Gate', 'A group of friends discover a way to send messages to the past, with dangerous consequences.', 24, 'Completed', '2011-04-06', 'White Fox', 0),
(30, 'Naruto: Shippuden', 'Naruto Uzumaki strives to become the strongest ninja and protect his village.', 500, 'Completed', '2007-02-15', 'Pierrot', 0),
(31, 'One Piece', 'Monkey D. Luffy and his pirate crew search for the One Piece, the greatest treasure in the world.', 1070, 'Airing', '1999-10-20', 'Toei Animation', 0),
(32, 'Death Note', 'A high school student gains the power to kill anyone whose name he writes in a magical notebook.', 37, 'Completed', '2006-10-03', 'Madhouse', 0),
(33, 'Your Name', 'Two high school students mysteriously switch bodies and try to meet each other.', 1, 'Completed', '2016-08-26', 'CoMix Wave Films', 0),
(34, 'Demon Slayer: Kimetsu no Yaiba', 'A boy becomes a demon slayer to avenge his family and cure his sister, turned into a demon.', 26, 'Completed', '2019-04-06', 'ufotable', 0),
(35, 'My Hero Academia', 'In a world where almost everyone has superpowers, a powerless boy dreams of becoming a hero.', 113, 'Airing', '2016-04-03', 'Bones', 0),
(36, 'Cowboy Bebop', 'A group of bounty hunters search for criminals in space, blending genres of sci-fi and noir.', 26, 'Completed', '1998-04-03', 'Sunrise', 0),
(37, 'Hunter x Hunter', 'A boy sets out to find his father and become a Hunter, a special title given to the best of the best.', 148, 'Completed', '2011-10-02', 'Madhouse', 0),
(38, 'Code Geass', 'A young man gains the power to control people and aims to bring down a corrupt empire.', 50, 'Completed', '2006-10-05', 'Sunrise', 0),
(39, 'One Punch Man', 'A hero who can defeat any opponent with a single punch struggles with boredom and lack of challenge.', 12, 'Completed', '2015-10-05', 'Madhouse', 0),
(40, 'Neon Genesis Evangelion', 'A group of teenagers pilot giant robots to fight off alien creatures known as Angels.', 26, 'Completed', '1995-10-05', 'Gainax', 0),
(41, 'The Promised Neverland', 'A group of children escapes from an orphanage that hides dark secrets.', 12, 'Completed', '2019-01-11', 'CloverWorks', 0),
(42, 'Sword Art Online', 'Players of a virtual reality MMORPG must fight to escape the game after becoming trapped in it.', 25, 'Completed', '2012-07-08', 'A-1 Pictures', 0),
(43, 'Mob Psycho 100', 'A young psychic struggles to find his place in the world and control his overwhelming powers.', 12, 'Completed', '2016-07-12', 'Bones', 0),
(44, 'Fruits Basket', 'A girl becomes involved with a family cursed to turn into animals of the Chinese Zodiac.', 25, 'Completed', '2001-07-05', 'Studio Deen', 0),
(45, 'Re:Zero - Starting Life in Another World', 'A boy is transported to a fantasy world where he has the power to rewind time upon his death.', 25, 'Airing', '2016-03-23', 'White Fox', 0),
(46, 'Black Clover', 'A boy born without magic in a world where magic is everything strives to become the Wizard King.', 170, 'Airing', '2017-10-03', 'Studio Pierrot', 0),
(47, 'Gintama', 'A samurai lives in a world dominated by aliens, fighting to protect his friends and his way of life.', 367, 'Completed', '2006-04-04', 'Sunrise', 0),
(48, 'Toradora!', 'A high school student forms a strange relationship with two of his classmates, a tough girl and a quiet boy.', 25, 'Completed', '2008-10-02', 'J.C. Staff', 0),
(49, 'The Seven Deadly Sins', 'A group of knights sets out to protect their kingdom, battling against evil forces and powerful enemies.', 24, 'Completed', '2014-10-05', 'A-1 Pictures', 0),
(50, 'Attack on Titan: No Regrets', 'The prequel to Attack on Titan, detailing the life of Levi Ackerman.', 2, 'Completed', '2014-12-08', 'Wit Studio', 0),
(51, 'Angel Beats!', 'A group of high school students in the afterlife fight to accept their pasts and move on.', 13, 'Completed', '2010-04-03', 'P.A. Works', 0),
(52, 'K-On!', 'A group of high school girls form a band and work together to achieve their musical dreams.', 13, 'Completed', '2009-04-03', 'Kyoto Animation', 0),
(53, 'Clannad: After Story', 'The continuation of Clannad, following the lives and struggles of Tomoya and his family.', 24, 'Completed', '2008-10-03', 'Kyoto Animation', 0),
(54, 'Attack on Titan: Junior High', 'A comedic spinoff of Attack on Titan where the characters are in middle school.', 12, 'Completed', '2015-10-04', 'Production I.G', 0),
(55, 'Bleach', 'A teenager gains the ability to see spirits and fights evil spirits called Hollows.', 366, 'Completed', '2004-10-05', 'Pierrot', 0),
(56, 'Tokyo Ghoul', 'A college student becomes a half-ghoul after a near-fatal encounter with one of the monsters.', 12, 'Completed', '2014-07-03', 'Studio Pierrot', 0),
(57, 'Hellsing', 'The Hellsing Organization, led by Sir Integra Hellsing, battles supernatural forces.', 13, 'Completed', '2001-10-11', 'Geneon', 0),
(58, 'Noragami', 'A minor god seeks followers in the human world while fighting to protect spirits from demons.', 12, 'Completed', '2014-01-05', 'Bones', 0),
(59, 'Fairy Tail', 'A group of wizards embarks on quests to protect the world and fight dark forces.', 328, 'Completed', '2009-10-12', 'A-1 Pictures', 0),
(60, 'Psycho-Pass', 'A dystopian future where people’s mental states are monitored by the government, and criminals are hunted.', 22, 'Completed', '2012-10-12', 'Production I.G', 0),
(61, 'Kuroko no Basket', 'A high school basketball team fights to prove themselves as the best in the nation.', 75, 'Completed', '2012-04-07', 'Production I.G', 0),
(62, 'JoJo’s Bizarre Adventure', 'A multi-generational tale of the Joestar family and their strange, supernatural adventures.', 152, 'Airing', '2012-10-06', 'David Production', 0),
(63, 'Mob Psycho 100 II', 'The psychic Mob continues his journey to understand his powers and find meaning in life.', 13, 'Completed', '2019-01-07', 'Bones', 0),
(64, 'Haikyuu!!', 'A high school volleyball team strives to reach the national championships, overcoming rivals and challenges.', 85, 'Airing', '2014-04-06', 'Production I.G', 0),
(65, 'Gurren Lagann', 'A group of humans fight against oppressive forces in a futuristic, post-apocalyptic world.', 27, 'Completed', '2007-04-01', 'Gainax', 0),
(66, 'No Game No Life', 'A brother and sister team are transported to a world where everything is decided by games.', 12, 'Completed', '2014-04-09', 'Madhouse', 0),
(67, 'Sword Art Online II', 'Following the events of SAO, Kirito must navigate a new game to protect his friends and confront a new threat.', 24, 'Completed', '2014-07-05', 'A-1 Pictures', 0),
(68, 'Dr. Stone', 'Two million years after humanity’s fall, a brilliant boy leads the effort to rebuild civilization with science.', 24, 'Airing', '2019-07-05', 'TMS Entertainment', 0),
(69, 'Mob Psycho 100 III', 'Mob struggles with maintaining his personal life while continuing his growth as a psychic.', 12, 'Airing', '2022-10-05', 'Bones', 0),
(70, 'Black Lagoon', 'A group of mercenaries fight their way through dangerous situations in Southeast Asia.', 12, 'Completed', '2006-04-09', 'Madhouse', 0),
(71, 'High School DxD', 'High School DxD follows the story of Issei Hyoudou, a high school student who is killed by a fallen angel and reincarnated as a devil by Rias Gremory. The show mixes action, comedy, and ecchi elements as Issei navigates his new life as a devil.', 12, '', '2012-01-06', 'TNK', 0),
(72, 'Overflow', 'Overflow is an ecchi comedy anime that follows a male protagonist who finds himself in compromising situations with two girls, leading to awkward and humorous moments.', 12, '', '2020-07-06', 'Studio Hokiboshi', 0),
(73, 'Prison School', 'Prison School is a comedy, ecchi anime set in a strict all-girls school where five male students are enrolled. They are soon sent to the prison of the school, run by the underground student council, leading to hilarious and outrageous situations.', 12, '', '2015-07-11', 'J.C. Staff', 0),
(74, 'Shimoneta', 'Shimoneta, or \"A Boring World Where the Concept of Dirty Jokes Doesn’t Exist,\" takes place in a society where any form of obscene or sexual content is illegal. The protagonist joins a group that aims to bring back obscene humor and expressions to the world.', 12, '', '2015-07-04', 'J.C. Staff', 0),
(75, 'Detroit Metal City', 'Detroit Metal City follows the life of Soichi Negishi, a mild-mannered, sweet-natured young man who dreams of becoming a pop musician. However, he ends up as the lead vocalist of a death metal band, Detroit Metal City, where he adopts the persona of the foul-mouthed, aggressive \"Johny.\" The series explores the stark contrast between his real self and his alter-ego.', 12, '', '2008-07-08', 'Madhouse', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `anime_genres`
--

CREATE TABLE `anime_genres` (
  `anime_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime_genres`
--

INSERT INTO `anime_genres` (`anime_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 4),
(3, 2),
(3, 10),
(4, 8),
(4, 17),
(5, 2),
(5, 17),
(6, 1),
(6, 10),
(7, 12),
(7, 13),
(8, 1),
(8, 14),
(9, 1),
(9, 17),
(10, 2),
(10, 16),
(11, 1),
(11, 17),
(12, 1),
(12, 10),
(13, 1),
(13, 3),
(14, 1),
(14, 9),
(15, 6),
(15, 13),
(16, 1),
(16, 7),
(17, 1),
(17, 14),
(18, 1),
(18, 11),
(19, 1),
(19, 5),
(20, 12),
(20, 13),
(21, 1),
(21, 14),
(22, 7),
(22, 17),
(23, 1),
(23, 17),
(24, 12),
(24, 13),
(25, 1),
(25, 7),
(26, 1),
(27, 1),
(28, 1),
(29, 10),
(30, 17),
(31, 17),
(32, 10),
(33, 12),
(34, 1),
(35, 17),
(36, 2),
(37, 17),
(38, 10),
(39, 1),
(40, 9),
(41, 6),
(42, 1),
(43, 1),
(44, 13),
(45, 14),
(46, 7),
(47, 17),
(48, 12),
(49, 1),
(50, 1),
(51, 13),
(52, 3),
(53, 13),
(54, 1),
(55, 1),
(56, 6),
(57, 1),
(58, 14),
(59, 20),
(60, 16),
(61, 20),
(62, 2),
(63, 1),
(64, 20),
(65, 2),
(66, 2),
(67, 7),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(71, 5),
(71, 12),
(71, 19),
(72, 12),
(72, 19),
(73, 3),
(73, 15),
(73, 19),
(74, 3),
(74, 15),
(74, 19),
(75, 3),
(75, 13),
(75, 21);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Drama'),
(19, 'Ecchi'),
(5, 'Fantasy'),
(6, 'Horror'),
(7, 'Magic'),
(8, 'Martial Arts'),
(9, 'Mecha'),
(21, 'Music'),
(10, 'Mystery'),
(11, 'Psychological'),
(12, 'Romance'),
(15, 'School'),
(16, 'Sci-Fi'),
(18, 'Shoujo'),
(17, 'Shounen'),
(13, 'Slice of Life'),
(20, 'Sports'),
(14, 'Supernatural');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `score` tinyint(4) DEFAULT NULL CHECK (`score` between 1 and 10),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_anime_progress`
--

CREATE TABLE `user_anime_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `status` enum('Watching','Completed','Dropped','On-hold','Plan to watch','Not assigned') NOT NULL DEFAULT 'Not assigned',
  `episodes_watched` int(11) DEFAULT 0,
  `score` tinyint(4) DEFAULT NULL CHECK (`score` between 1 and 10),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `anime` ADD FULLTEXT KEY `title` (`title`,`synopsis`);

--
-- Indeksy dla tabeli `anime_genres`
--
ALTER TABLE `anime_genres`
  ADD PRIMARY KEY (`anime_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indeksy dla tabeli `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indeksy dla tabeli `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `user_anime_progress`
--
ALTER TABLE `user_anime_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anime`
--
ALTER TABLE `anime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_anime_progress`
--
ALTER TABLE `user_anime_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anime_genres`
--
ALTER TABLE `anime_genres`
  ADD CONSTRAINT `anime_genres_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anime_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_anime_progress`
--
ALTER TABLE `user_anime_progress`
  ADD CONSTRAINT `user_anime_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_anime_progress_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
