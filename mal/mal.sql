-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2025 at 03:28 PM
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
  `rating` float DEFAULT 0,
  `image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`id`, `title`, `synopsis`, `episodes`, `status`, `release_date`, `studio`, `rating`, `image_url`) VALUES
(1, 'Attack on Titan', 'In a world where humanity resides within enormous walled cities to protect themselves from Titans, gigantic humanoid creatures. Eren Yeager seeks revenge against them after a Titan destroyed his town.', 75, 'Airing', '2013-04-07', 'WIT Studio', 0, 'https://cdn.myanimelist.net/images/anime/10/47347.jpg'),
(2, 'Fullmetal Alchemist: Brotherhood', 'In a world where alchemy is one of the most advanced sciences, two brothers search for the Philosopher\'s Stone to restore their bodies after a failed alchemical experiment.', 64, 'Completed', '2009-04-05', 'Studio Bones', 0, 'https://cdn.myanimelist.net/images/anime/1208/94745.jpg'),
(3, 'Steins;Gate', 'A group of friends discover a way to send messages to the past, but their meddling with time causes unforeseen consequences.', 24, 'Completed', '2011-04-06', 'White Fox', 0, 'https://cdn.myanimelist.net/images/anime/1935/127974.jpg'),
(4, 'Naruto: Shippuden', 'Naruto Uzumaki continues his journey to become the greatest ninja and protect his village while facing various challenges and enemies.', 500, 'Completed', '2007-02-15', 'Pierrot', 0, 'https://cdn.myanimelist.net/images/anime/1565/111305.jpg'),
(5, 'One Piece', 'Monkey D. Luffy and his pirate crew search for the world\'s ultimate treasure, the One Piece, in order to become the next Pirate King.', 1070, 'Airing', '1999-10-20', 'Toei Animation', 0, 'https://cdn.myanimelist.net/images/anime/1244/138851.jpg'),
(6, 'Death Note', 'A high school student discovers a notebook that allows him to kill anyone whose name is written in it, which leads him to a battle of wits with a brilliant detective.', 37, 'Completed', '2006-10-03', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/1079/138100.jpg'),
(7, 'Your Name', 'Two teenagers, a girl and a boy, find themselves mysteriously swapping bodies and must figure out how to communicate with each other across time and space.', 1, 'Completed', '2016-08-26', 'CoMix Wave Films', 0, 'https://cdn.myanimelist.net/images/anime/5/87048.jpg'),
(8, 'Demon Slayer', 'Tanjiro Kamado seeks revenge against demons that killed his family and a cure for his sister Nezuko, who has turned into a demon.', 26, 'Airing', '2019-04-06', 'ufotable', 0, 'https://cdn.myanimelist.net/images/anime/1286/99889.jpg'),
(9, 'My Hero Academia', 'In a world where people with superpowers, called \"quirks,\" are the norm, a young boy without them dreams of becoming the greatest hero.', 113, 'Airing', '2016-04-03', 'Bones', 0, 'https://cdn.myanimelist.net/images/anime/10/78745.jpg'),
(10, 'Cowboy Bebop', 'Set in the year 2071, a ragtag group of bounty hunters travels the galaxy in search of criminals, encountering various adventures and deep philosophical themes along the way.', 26, 'Completed', '1998-04-03', 'Sunrise', 0, 'https://cdn.myanimelist.net/images/anime/4/19644.jpg'),
(11, 'Hunter x Hunter', 'Gon Freecss, a young boy who aspires to become a Hunter, sets out on a journey to find his father and become the greatest Hunter in the world.', 148, 'Completed', '2011-10-02', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/1337/99013.jpg'),
(12, 'Code Geass: Lelouch of the Rebellion', 'Lelouch vi Britannia, a former prince of the Holy Britannian Empire, gains the power to control others and uses it to lead a rebellion against the empire.', 25, 'Completed', '2006-10-05', 'Sunrise', 0, 'https://cdn.myanimelist.net/images/anime/1032/135088.jpg'),
(13, 'One Punch Man', 'Saitama is a hero who can defeat any opponent with a single punch. Bored with his power, he searches for a worthy opponent.', 12, 'Completed', '2015-10-05', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/12/76049.jpg'),
(14, 'Neon Genesis Evangelion', 'A group of teenagers pilots giant mechs to protect Earth from mysterious creatures known as Angels, while struggling with their own personal and psychological issues.', 26, 'Completed', '1995-10-05', 'Gainax', 0, 'https://cdn.myanimelist.net/images/anime/1314/108941.jpg'),
(15, 'The Promised Neverland', 'A group of children escape an orphanage after discovering the horrifying truth about their lives and the fate that awaits them.', 12, 'Completed', '2019-01-11', 'CloverWorks', 0, 'https://cdn.myanimelist.net/images/anime/1830/118780.jpg'),
(16, 'Sword Art Online', 'Players of a virtual reality MMORPG find themselves trapped in the game and must fight their way to the top to escape.', 25, 'Completed', '2012-07-08', 'A-1 Pictures', 0, 'https://cdn.myanimelist.net/images/anime/11/39717.jpg'),
(17, 'Attack on Titan: The Final Season', 'The final chapter of the struggle for humanity\'s survival against the Titans unfolds, as the truth behind their origin is revealed.', 16, 'Airing', '2020-12-07', 'MAPPA', 0, 'https://cdn.myanimelist.net/images/anime/1000/110531.jpg'),
(18, 'Mob Psycho 100', 'Shigeo Kageyama, a young boy with immense psychic powers, seeks to live a normal life despite his overwhelming abilities.', 12, 'Completed', '2016-07-11', 'Bones', 0, 'https://cdn.myanimelist.net/images/anime/8/80356.jpg'),
(19, 'Fullmetal Alchemist', 'The story of two brothers who, after a failed alchemical experiment, must find the Philosopher\'s Stone to restore their bodies.', 51, 'Completed', '2003-10-04', 'Studio Bones', 0, 'https://cdn.myanimelist.net/images/anime/10/75815.jpg'),
(20, 'Fruits Basket', 'Tohru Honda, an orphaned girl, becomes involved with a family cursed to transform into animals of the Chinese zodiac when hugged by the opposite sex.', 25, 'Completed', '2001-07-05', 'Studio Deen', 0, 'https://cdn.myanimelist.net/images/anime/4/75204.jpg'),
(21, 'Re:Zero - Starting Life in Another World', 'Natsuki Subaru is transported to a fantasy world, where he must use his ability to return to death in order to change the course of events and save his friends.', 25, 'Airing', '2016-04-04', 'White Fox', 0, 'https://cdn.myanimelist.net/images/anime/1522/128039.jpg'),
(22, 'Black Clover', 'Asta, a young boy born without magic in a world where magic is everything, aims to become the Wizard King by overcoming various challenges.', 170, 'Airing', '2017-10-03', 'Studio Pierrot', 0, 'https://cdn.myanimelist.net/images/anime/2/88336.jpg'),
(23, 'Gintama', 'Gintoki Sakata, an eccentric samurai in a futuristic world dominated by aliens, embarks on various comedic and action-packed adventures with his friends.', 367, 'Completed', '2006-04-04', 'Sunrise', 0, 'https://cdn.myanimelist.net/images/anime/10/73274.jpg'),
(24, 'Toradora!', 'Ryuuji Takasu and Taiga Aisaka form an unlikely partnership as they try to help each other with their respective crushes while navigating high school life.', 25, 'Completed', '2008-10-02', 'J.C. Staff', 0, 'https://cdn.myanimelist.net/images/anime/13/22128.jpg'),
(25, 'The Seven Deadly Sins', 'A group of knights called the Seven Deadly Sins is tasked with saving the kingdom from various threats, but their past is filled with dark secrets.', 24, 'Completed', '2014-10-05', 'A-1 Pictures', 0, 'https://cdn.myanimelist.net/images/anime/8/65409.jpg'),
(51, 'Angel Beats!', 'A group of high school students in the afterlife fight to accept their pasts and move on.', 13, 'Completed', '2010-04-03', 'P.A. Works', 0, 'https://cdn.myanimelist.net/images/anime/4/25073.jpg'),
(52, 'K-On!', 'A group of high school girls form a band and work together to achieve their musical dreams.', 13, 'Completed', '2009-04-03', 'Kyoto Animation', 0, 'https://cdn.myanimelist.net/images/anime/10/76120.jpg'),
(53, 'Clannad: After Story', 'The continuation of Clannad, following the lives and struggles of Tomoya and his family.', 24, 'Completed', '2008-10-03', 'Kyoto Animation', 0, 'https://cdn.myanimelist.net/images/anime/1299/110774.jpg'),
(55, 'Bleach', 'A teenager gains the ability to see spirits and fights evil spirits called Hollows.', 366, 'Completed', '2004-10-05', 'Pierrot', 0, 'https://cdn.myanimelist.net/images/anime/3/40451.jpg'),
(56, 'Tokyo Ghoul', 'A college student becomes a half-ghoul after a near-fatal encounter with one of the monsters.', 12, 'Completed', '2014-07-03', 'Studio Pierrot', 0, 'https://cdn.myanimelist.net/images/anime/1498/134443.jpg'),
(57, 'Hellsing', 'The Hellsing Organization, led by Sir Integra Hellsing, battles supernatural forces.', 13, 'Completed', '2001-10-11', 'Geneon', 0, 'https://cdn.myanimelist.net/images/anime/10/19956.jpg'),
(58, 'Noragami', 'A minor god seeks followers in the human world while fighting to protect spirits from demons.', 12, 'Completed', '2014-01-05', 'Bones', 0, 'https://cdn.myanimelist.net/images/anime/1886/128266.jpg'),
(59, 'Fairy Tail', 'A group of wizards embarks on quests to protect the world and fight dark forces.', 328, 'Completed', '2009-10-12', 'A-1 Pictures', 0, 'https://cdn.myanimelist.net/images/anime/5/18179.jpg'),
(60, 'Psycho-Pass', 'A dystopian future where people’s mental states are monitored by the government, and criminals are hunted.', 22, 'Completed', '2012-10-12', 'Production I.G', 0, 'https://cdn.myanimelist.net/images/anime/1314/142015.jpg'),
(61, 'Kuroko no Basket', 'A high school basketball team fights to prove themselves as the best in the nation.', 75, 'Completed', '2012-04-07', 'Production I.G', 0, 'https://cdn.myanimelist.net/images/anime/11/50453.jpg'),
(62, 'JoJo’s Bizarre Adventure', 'A multi-generational tale of the Joestar family and their strange, supernatural adventures.', 152, 'Airing', '2012-10-06', 'David Production', 0, 'https://cdn.myanimelist.net/images/anime/3/40409.jpg'),
(63, 'Mob Psycho 100 II', 'The psychic Mob continues his journey to understand his powers and find meaning in life.', 13, 'Completed', '2019-01-07', 'Bones', 0, 'https://cdn.myanimelist.net/images/anime/1918/96303.jpg'),
(64, 'Haikyuu!!', 'A high school volleyball team strives to reach the national championships, overcoming rivals and challenges.', 85, 'Airing', '2014-04-06', 'Production I.G', 0, 'https://cdn.myanimelist.net/images/anime/7/76014.jpg'),
(65, 'Gurren Lagann', 'A group of humans fight against oppressive forces in a futuristic, post-apocalyptic world.', 27, 'Completed', '2007-04-01', 'Gainax', 0, 'https://cdn.myanimelist.net/images/anime/4/5123.jpg'),
(66, 'No Game No Life', 'A brother and sister team are transported to a world where everything is decided by games.', 12, 'Completed', '2014-04-09', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/1074/111944.jpg'),
(67, 'Sword Art Online II', 'Following the events of SAO, Kirito must navigate a new game to protect his friends and confront a new threat.', 24, 'Completed', '2014-07-05', 'A-1 Pictures', 0, 'https://cdn.myanimelist.net/images/anime/1223/121999.jpg'),
(68, 'Dr. Stone', 'Two million years after humanity’s fall, a brilliant boy leads the effort to rebuild civilization with science.', 24, 'Airing', '2019-07-05', 'TMS Entertainment', 0, 'https://cdn.myanimelist.net/images/anime/1613/102576.jpg'),
(69, 'Mob Psycho 100 III', 'Mob struggles with maintaining his personal life while continuing his growth as a psychic.', 12, 'Airing', '2022-10-05', 'Bones', 0, 'https://cdn.myanimelist.net/images/anime/1228/125011.jpg'),
(70, 'Black Lagoon', 'A group of mercenaries fight their way through dangerous situations in Southeast Asia.', 12, 'Completed', '2006-04-09', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/1906/121592.jpg'),
(71, 'High School DxD', 'High School DxD follows the story of Issei Hyoudou, a high school student who is killed by a fallen angel and reincarnated as a devil by Rias Gremory. The show mixes action, comedy, and ecchi elements as Issei navigates his new life as a devil.', 12, '', '2012-01-06', 'TNK', 0, 'https://cdn.myanimelist.net/images/anime/1331/111940.jpg'),
(72, 'Overflow', 'Overflow is an ecchi comedy anime that follows a male protagonist who finds himself in compromising situations with two girls, leading to awkward and humorous moments.', 12, '', '2020-07-06', 'Studio Hokiboshi', 0, 'https://cdn.myanimelist.net/images/anime/1781/104461.jpg'),
(73, 'Prison School', 'Prison School is a comedy, ecchi anime set in a strict all-girls school where five male students are enrolled. They are soon sent to the prison of the school, run by the underground student council, leading to hilarious and outrageous situations.', 12, '', '2015-07-11', 'J.C. Staff', 0, 'https://cdn.myanimelist.net/images/anime/1286/112161.jpg'),
(74, 'Shimoneta', 'Shimoneta, or \"A Boring World Where the Concept of Dirty Jokes Doesn’t Exist,\" takes place in a society where any form of obscene or sexual content is illegal. The protagonist joins a group that aims to bring back obscene humor and expressions to the world.', 12, '', '2015-07-04', 'J.C. Staff', 0, 'https://cdn.myanimelist.net/images/anime/6/75106.jpg'),
(75, 'Detroit Metal City', 'Detroit Metal City follows the life of Soichi Negishi, a mild-mannered, sweet-natured young man who dreams of becoming a pop musician. However, he ends up as the lead vocalist of a death metal band, Detroit Metal City, where he adopts the persona of the foul-mouthed, aggressive \"Johny.\" The series explores the stark contrast between his real self and his alter-ego.', 12, '', '2008-07-08', 'Madhouse', 0, 'https://cdn.myanimelist.net/images/anime/3/9853.jpg');

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
(51, 13),
(52, 3),
(53, 13),
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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `anime_id`, `review_text`, `score`, `created_at`) VALUES
(1, 2, 72, 'As an anime enthusiast who’s seen it all—from heart-pounding action to soul-stirring drama—Overflow is a masterpiece in its own right, and I’m giving it a solid 10/10. It’s a series that embraces the taboo with unapologetic intensity, while somehow managing to stay true to its art form and creative vision. If you’re looking for a show that pushes boundaries, both narratively and visually, Overflow delivers on all fronts.\r\n\r\nStory\r\nOverflow may be controversial due to its adult content, but what sets it apart is its raw and unfiltered portrayal of complex emotions. The narrative, while bold and explicit, doesn’t shy away from exploring the characters\' vulnerabilities and desires in a way that feels authentic—something that is often overlooked in other anime of its genre. The pacing and the interactions between characters, especially in emotionally charged moments, make it a surprisingly engaging experience despite the nature of the subject matter.\r\n\r\nCharacter Development\r\nThe characters in Overflow feel real, despite the extreme circumstances they find themselves in. The show does a fantastic job of letting the viewer connect with each of the leads, especially as they struggle with their own moral dilemmas and desires. It\'s not just about shock value or fanservice; there’s a deeper layer to each character that makes them stand out from the usual stereotypes we often see in similar shows. You’ll find yourself rooting for them, even though you know they’re part of a story that’s not for the faint of heart.\r\n\r\nAnimation & Art\r\nThe animation is sleek and fluid, giving the intimate moments just the right amount of attention without feeling overdone. The art style isn’t groundbreaking, but it’s certainly above average for a show of this genre. The character designs are distinct, and the expressions are well-crafted, helping to add emotional weight to the more intense scenes. Plus, the color palette and visual aesthetics tie perfectly with the tone of the story, making the whole viewing experience more immersive.\r\n\r\nFanservice\r\nLet’s be real, Overflow leans heavily into fanservice—but that’s exactly what makes it so compelling. It’s unapologetically bold, and yet it never feels gratuitous or out of place in the context of the characters’ development. If you\'re into shows that delve into mature themes with a sense of freedom and openness, this is a show you won\'t want to miss. The fanservice here serves the narrative, not just the shock factor.\r\n\r\nFinal Thoughts\r\nOverflow is a show that knows exactly what it is—and it doesn’t apologize for it. For those who appreciate more mature, boundary-pushing content in their anime, this series is a must-watch. Yes, it’s controversial, yes, it’s explicit, but it’s also an unfiltered look at human desire and emotion. It’s not for everyone, but for those who are into this niche, it’s an experience you won’t forget.\r\n\r\nI’m giving it a 10/10 because it takes risks, delivers on its promise, and does so with a surprising amount of heart and depth. Don’t let the title fool you—it’s not just another fanservice-heavy show. It’s Overflow—and it’s here to make a lasting impact on the genre.', 10, '2025-02-25 14:06:01'),
(2, 1, 5, 'Dropped after Alabasta Arc\r\n\r\nAs an anime fan who\'s been around the block for quite a while, I have to say, One Piece is one of those anime that, for all its popularity, just didn’t do it for me. I know, I know—it\'s a fan-favorite, a cultural phenomenon, and one of the most iconic shows ever, but after grinding through the Alabasta arc, I had to walk away. Here’s why I’m giving it a 4/10 and calling it quits.\r\n\r\nStory  \r\nOkay, let’s talk about the pacing. One Piece drags. Like, seriously drags. I get that it\'s a long-running series with tons of episodes, but for me, the constant filler, the drawn-out arcs, and the repetition started to kill my interest. The whole treasure hunt thing felt like it was taking forever to move forward, and after the Alabasta arc, I felt like I was stuck in a loop. I didn’t feel that urgency or excitement to continue—just more of the same, stretched over too many episodes.\r\n\r\nThat being said, I get why people love the world-building and the sense of adventure. The idea of a vast world filled with pirates, unique characters, and different islands is cool, but the execution felt more like filler content than actual progression. The emotional beats didn’t hit me as hard as they did for others, and I found the drawn-out character backstories to be more tedious than touching.\r\n\r\nCharacter Development  \r\nLuffy, the main character, is the definition of \"hit or miss.\" Sure, he\'s got his charm, but there’s a point where his relentless optimism starts to feel like a broken record. It’s like, I get it, dude—you\'re going to be the Pirate King, but how many times do we have to hear you say it? The rest of the Straw Hat crew didn’t fare much better in my eyes. They’re all quirky and have their own goals, but nothing about them felt particularly unique or interesting to me after the initial introduction. After Alabasta, I wasn’t really invested in any of their arcs.\r\n\r\nAnimation & Art  \r\nLet’s be real—the art style of One Piece is a bit... weird. I mean, I can appreciate the unique design choices, but some of the character designs look downright goofy to me. The exaggerated facial expressions, while part of the charm, often felt more annoying than funny. The animation itself is decent, but I was more focused on the pacing and plot issues than on the visuals, so it didn’t stand out in any major way.\r\n\r\nThe Alabasta Arc  \r\nThis was supposed to be the turning point, the arc where things would get intense and exciting. But by the time I reached the end, I was already feeling burnout. The stakes felt high, sure, but I wasn’t emotionally invested enough to care about the outcome. There were moments where I thought, \"Okay, this is going somewhere,\" but by the time the arc wrapped up, I just couldn’t muster up the motivation to keep going.\r\n\r\nFinal Thoughts  \r\nMaybe it’s just me, but One Piece feels like it’s trying too hard to be everything to everyone. The characters, the story, the world—it’s all so massive and sprawling that it ends up feeling bloated and aimless. After 100+ episodes and the Alabasta arc, I just didn’t feel the hook anymore. It’s definitely got its moments, but it wasn’t enough to keep me watching.\r\n\r\nAt the end of the day, I respect why people love One Piece, but it just wasn’t for me. It’s got the potential to be a great adventure, but after the pacing issues, the repetitive nature, and the lack of emotional investment, I had to drop it. A 4/10 feels like the right score for me.', 4, '2025-02-25 14:14:07'),
(20, 1, 2, 'The animation was stunning, and the story kept me engaged throughout. A great mix of action and drama!', 8, '2025-02-25 15:28:23'),
(21, 3, 5, 'The pacing was a bit slow, but the character development was fantastic. I’m excited for the next season.', 7, '2025-02-25 15:28:23'),
(22, 4, 7, 'Not my favorite, but still a solid show. The plot was interesting, though it felt a bit predictable.', 6, '2025-02-25 15:28:23'),
(23, 2, 1, 'This is one of the best anime I’ve watched! Incredible world-building and unforgettable characters.', 10, '2025-02-25 15:28:23'),
(24, 5, 10, 'It was a fun ride, but the ending left me wanting more. I hope there’s a second season.', 7, '2025-02-25 15:28:23'),
(25, 6, 12, 'I wasn’t a fan of the animation style, but the story was strong enough to keep me watching.', 6, '2025-02-25 15:28:23'),
(26, 7, 3, 'An emotional rollercoaster with fantastic music and a memorable cast. Highly recommend it!', 9, '2025-02-25 15:28:23'),
(27, 8, 15, 'The humor was great, but the plot felt a bit repetitive at times. Still, it was enjoyable overall.', 7, '2025-02-25 15:28:23'),
(28, 9, 9, 'Amazing fight scenes and deep character struggles. One of the best in its genre.', 9, '2025-02-25 15:28:23'),
(29, 10, 14, 'The storyline is predictable, but the execution is top-notch. Solid show overall.', 6, '2025-02-25 15:28:23'),
(30, 11, 18, 'Beautiful animation and a captivating story. It\'s a must-watch for fans of fantasy.', 8, '2025-02-25 15:28:23'),
(31, 12, 20, 'It was alright, but it didn\'t live up to the hype. Some parts felt rushed.', 5, '2025-02-25 15:28:23'),
(32, 13, 13, 'Incredible pacing, but the ending left too many loose ends. I wish it was more conclusive.', 7, '2025-02-25 15:28:23'),
(33, 14, 8, 'The characters were relatable, and the animation was beautiful. I could watch it over and over.', 9, '2025-02-25 15:28:23'),
(34, 15, 6, 'The plot was fascinating, but the slow pacing made it hard to keep up with the series.', 6, '2025-02-25 15:28:23'),
(35, 16, 4, 'Not my style of anime, but I can see why others would enjoy it. Decent but not great.', 5, '2025-02-25 15:28:23'),
(36, 17, 25, 'Amazing. The character growth was phenomenal, and the ending was perfect. Highly recommended.', 10, '2025-02-25 15:28:23');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `user_desc` text DEFAULT NULL,
  `user_avatar` varchar(255) NOT NULL DEFAULT 'default_avatar.png',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `user_desc`, `user_avatar`, `created_at`) VALUES
(1, 'testuser1', 'testuser1@mail.com', '$2y$10$AnHXl5aOTngLKyhfPk3B1uygrs4b0WF3YlB3eb3D3xO3P9WcwdNtm', 'A new anime fan exploring all types of series, from mainstream hits to hidden gems.', 'default_avatar.png', '2025-02-18 14:00:27'),
(2, 'freak', 'sigma@sigma.pl', '$2y$10$S1lJ2zltIwZpuHu7IfkBTOoAKDizes2yjT7EDe.nXRDnrA.NFdfMO', 'A passionate anime enthusiast who dives into every corner of the medium, from classic series to the more niche subgenres.', 'stopa.png', '2025-02-21 19:48:19'),
(4, 'testuser2', 'testuser2@mail.com', '$2y$10$eSwuyavNnex4VOMA6acF2.xOT/vZjxKTUIRl6zWC8940FbLC2g9ym', 'A casual anime viewer who enjoys light-hearted comedies and romantic slice-of-life shows.', 'default_avatar.png', '2025-02-25 14:15:59'),
(5, 'testuser3', 'testuser3@mail.com', '$2y$10$wpFmXnXQlsp0EONr2W/oHeVQ.p0LxYOQ7x1UUqCG.b2zL7ySCqjTu', 'An anime critic who loves diving deep into storytelling, exploring plot intricacies and character arcs.', 'default_avatar.png', '2025-02-25 14:16:10'),
(6, 'testuser4', 'testuser4@mail.com', '$2y$10$Ftht5hX1eWr6YdXj.KAKBuigaUXP7zvy0D.5H.tfWATiFKLXivboS', 'Enjoys classic, nostalgic anime from the 90s and early 2000s with a particular fondness for mecha series.', 'default_avatar.png', '2025-02-25 14:17:13'),
(7, 'testuser5', 'testuser5@mail.com', '$2y$10$0wAUS0VpKGwIAZ2k8RAj2.5QN6fHO8vq4c1Xa9IaEWgg/jdrOXlrO', 'An action fan with a penchant for shonen anime, preferring long-running shows full of epic battles.', 'default_avatar.png', '2025-02-25 14:17:24'),
(8, 'testuser6', 'testuser6@mail.com', '$2y$10$d97qRs42zsAlkmlUT0M5.etq0s5NhMS2mdpM5kvn3PNE1R/HbKNPG', 'Loves exploring darker themes in anime, such as psychological thrillers and horror-based stories.', 'default_avatar.png', '2025-02-25 14:17:35'),
(9, 'testuser7', 'testuser7@mail.com', '$2y$10$pUG4J/c5OH7FA0SySq6KieI4Tkxj.Z2NYJKwSa8Juk9Ov/RApbMFO', 'A fan of the fantasy genre, often found enjoying anime with magical worlds and fantastical elements.', 'default_avatar.png', '2025-02-25 14:17:56'),
(10, 'testuser8', 'testuser8@mail.com', '$2y$10$9J2DRlUkOzIPNEai3aRjCuBt1u/I4BXstL9o0toWC88cGpGkWozA6', 'A video game and anime crossover fan who enjoys shows with game-like worlds and complex systems.', 'default_avatar.png', '2025-02-25 14:18:10'),
(11, 'testuser9', 'testuser9@mail.com', '$2y$10$pC8k1oH.QpxerAx2H82fjukAi./LwzUKjvQD2EmGDoRXG3qirmf2S', 'A fan of anime with strong female leads, particularly in sports and drama genres.', 'default_avatar.png', '2025-02-25 14:18:24'),
(12, 'testuser10', 'testuser10@mail.com', '$2y$10$yUSoR/7vl3tw6TGyA2cI1.YcsZTTuXyADmiMG8n2HqHtbYgCkCeNu', 'An avid manga reader with a love for supernatural themes. Enjoys diving into deep lore and character-driven plots.', 'default_avatar.png', '2025-02-25 14:19:00'),
(13, 'testuser11', 'testuser11@mail.com', '$2y$10$3ybrppdDHiOYo/1Mb7cPMVyzLz1.W3pOfO0ocpYh6OH63.D5OZBqC', 'A casual anime watcher who enjoys popular shonen series and action-packed stories. Known for being a bit of a meme lord in online communities.', 'default_avatar.png', '2025-02-25 14:19:10'),
(14, 'testuser12', 'testuser12@mail.com', '$2y$10$ggKnURoiF6XvX0ghKqzD2ZT7oS.vjIHkfxG5Q2hgs6mBvUp0bhPbG', 'Focusing on character development and heartwarming moments, this user loves slice-of-life anime with an emphasis on emotional storytelling.', 'default_avatar.png', '2025-02-25 14:19:20'),
(15, 'testuser13', 'testuser13@mail.com', '$2y$10$V4bJxhYO3P1d0EvzOS6a9JdV81CzPBqvlb2W8XqeF32NTFHsYrRZy', 'An anime critic with a sharp eye for art and animation. Enjoys breaking down series and providing in-depth reviews of both mainstream and niche anime.', 'default_avatar.png', '2025-02-25 14:19:30'),
(16, 'testuser14', 'testuser14@mail.com', '$2y$10$Kv4GZBxh3LDwm3nlHPAQjOmlLBQkxgnzF0E6bw5TYhRi8cA2pBGva', 'Loves exploring historical settings in anime, with a focus on samurai and war-themed stories.', 'default_avatar.png', '2025-02-25 14:19:40'),
(17, 'testuser15', 'testuser15@mail.com', '$2y$10$W7VE9HskKmrhpCz.UKDEkckEJw9T8t9gDjeRrx06pbwPxm/Nty5QO', 'A comedy fan who prefers light-hearted anime that doesn’t take itself too seriously. Enjoys parodies and absurd humor.', 'default_avatar.png', '2025-02-25 14:19:50'),
(18, 'testuser16', 'testuser16@mail.com', '$2y$10$7LOg5rA1bb3RmS98pMlXBv8wnE2lnEScQ6nIqgFzJ8yAak.LkocLm', 'A fan of high-stakes dramas and shows with strong emotional beats, often drawn to tragedy and conflict.', 'default_avatar.png', '2025-02-25 14:20:00'),
(19, 'testuser17', 'testuser17@mail.com', '$2y$10$GVvlAxsxeOu4wIk0u0WBhR6BrmczGg3DImjXZly1Xre6JcZG8Aqf2', 'Enjoys anime with a futuristic setting, often revolving around technology, cyberpunk, and dystopian worlds.', 'default_avatar.png', '2025-02-25 14:20:10'),
(20, 'testuser18', 'testuser18@mail.com', '$2y$10$ZY0jtCZsQ7Ay59pdwXQfyA2xQzEScQeJYczfl4UrV51Q97ttwGpAq', 'A music enthusiast who loves anime with strong soundtracks or stories revolving around music and performance.', 'default_avatar.png', '2025-02-25 14:20:20'),
(21, 'testuser19', 'testuser19@mail.com', '$2y$10$3yqzLk1oIc74Yvs3rR5eIo9UBvbnF9ZC1QswSMoIF5H8KKLlt3Gsq', 'A collector of anime merchandise and memorabilia, often engaging in cosplay and fandom events.', 'default_avatar.png', '2025-02-25 14:20:30'),
(22, 'testuser20', 'testuser20@mail.com', '$2y$10$u0E7c8yM0F2NRz5VsAb3Bb6MfTylRm0bGx3tNO7VZ9wG6aDNFTJFe', 'An otaku with a deep interest in the slice-of-life genre, focusing on the small, meaningful moments in character relationships.', 'default_avatar.png', '2025-02-25 14:20:40'),
(23, 'testuser21', 'testuser21@mail.com', '$2y$10$YZ95zpUsf8weEHV8.g15HLzPpgfMlFmbfzJd0AAnlX7B9fXYykvlm', 'An anime watcher who loves older, classic anime series with retro art and storytelling styles.', 'default_avatar.png', '2025-02-25 14:20:50'),
(24, 'testuser22', 'testuser22@mail.com', '$2y$10$MzAYlHtH1u1C0ZKmP9ymgh1XjeZIKsBKwAKshGlHzL1rg5IcVpF32', 'A sports anime aficionado, enjoying everything from intense team battles to personal growth stories.', 'default_avatar.png', '2025-02-25 14:21:00'),
(25, 'testuser23', 'testuser23@mail.com', '$2y$10$1nduVnl85GZbFHEJqxszQ.5e/m7z7Pfw8xeC2wm.k6guWy9ft3w2u', 'Loves anime that pushes boundaries, often drawn to shows with experimental animation or unconventional storytelling.', 'default_avatar.png', '2025-02-25 14:21:10'),
(26, 'testuser24', 'testuser24@mail.com', '$2y$10$D0m8f4uQ2nROt8aOtoJq6p5UGk8pSRuAQj3G6F4pJdyDa0ls72hEC', 'A fan of magical girl and fantasy anime, always on the lookout for enchanting adventures with strong female protagonists.', 'default_avatar.png', '2025-02-25 14:21:20'),
(27, 'testuser25', 'testuser25@mail.com', '$2y$10$F7GkA2YcUwYbHLFvZX1UmGHDs5DzR1HnRnpUBFqaayTQv4JwS6.C2', 'A passionate fan of anime films, particularly Ghibli and other critically acclaimed animated works.', 'default_avatar.png', '2025-02-25 14:21:30'),
(28, 'testuser26', 'testuser26@mail.com', '$2y$10$blMQzYZgh/0LMZcPLx0z9fZQHpfQRPoeXOGVhHRz6JCRQAKYg0e5C', 'Enjoys philosophical themes in anime, always seeking shows with deep existential questions and psychological depth.', 'default_avatar.png', '2025-02-25 14:21:40'),
(29, 'testuser27', 'testuser27@mail.com', '$2y$10$cmjVEZcm2cFYfbGo6pmmOSLJfTLE8e8X19jbAkTmHnYsD5m0pG9tG', 'A long-time anime fan who’s watched everything from the most popular series to niche, obscure titles.', 'default_avatar.png', '2025-02-25 14:21:50'),
(30, 'testuser28', 'testuser28@mail.com', '$2y$10$kpDRk0DzmiHRQhFQC30b2Jl9a1w8g1qyywEUEXg1NqPyZaHPhVTeq', 'Loves exploring post-apocalyptic worlds in anime, with a focus on survival stories and dystopian societies.', 'default_avatar.png', '2025-02-25 14:22:00');

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
-- Dumping data for table `user_anime_progress`
--

INSERT INTO `user_anime_progress` (`id`, `user_id`, `anime_id`, `status`, `episodes_watched`, `score`, `updated_at`) VALUES
(1, 1, 1, 'Completed', 75, 8, '2025-02-18 14:09:40'),
(2, 1, 5, 'Watching', 324, NULL, '2025-02-25 15:09:12'),
(3, 1, 14, 'Dropped', 13, 6, '2025-02-19 17:55:58'),
(4, 1, 24, 'Completed', 25, 9, '2025-02-18 14:17:57'),
(5, 1, 11, 'On-hold', 139, NULL, '2025-02-25 15:09:12'),
(6, 1, 3, 'Plan to watch', 0, NULL, '2025-02-19 17:47:38'),
(7, 1, 23, 'Plan to watch', NULL, NULL, '2025-02-18 14:19:33'),
(8, 2, 5, 'On-hold', 992, 3, '2025-02-25 15:09:12'),
(9, 2, 71, 'Completed', 12, 10, '2025-02-21 19:53:02'),
(10, 2, 74, 'Watching', 1, 10, '2025-02-25 15:09:12'),
(11, 2, 4, 'On-hold', 55, 9, '2025-02-25 15:09:12'),
(12, 2, 2, 'Plan to watch', 12, 2, '2025-02-24 16:59:49'),
(13, 1, 70, 'Plan to watch', 0, NULL, '2025-02-25 00:55:20'),
(14, 2, 72, 'Completed', 12, 10, '2025-02-25 14:03:15'),
(105, 3, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(106, 3, 2, 'Watching', 51, NULL, '2025-02-25 15:09:12'),
(107, 3, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(108, 3, 4, 'On-hold', 36, NULL, '2025-02-25 15:09:12'),
(109, 3, 5, 'Completed', 1070, 9, '2025-02-25 15:07:06'),
(110, 3, 6, 'Dropped', 0, 4, '2025-02-25 14:51:30'),
(111, 3, 7, 'Watching', 0, NULL, '2025-02-25 14:51:30'),
(112, 3, 8, 'Completed', 26, 7, '2025-02-25 15:07:06'),
(113, 3, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(114, 3, 10, 'On-hold', 15, NULL, '2025-02-25 15:09:12'),
(115, 3, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(116, 3, 12, 'Dropped', 0, 5, '2025-02-25 14:51:30'),
(117, 3, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(118, 3, 14, 'Watching', 10, NULL, '2025-02-25 15:09:12'),
(119, 3, 15, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(120, 3, 16, 'Dropped', 0, 3, '2025-02-25 14:51:30'),
(121, 3, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(122, 3, 18, 'On-hold', 7, NULL, '2025-02-25 15:09:12'),
(123, 3, 19, 'Completed', 51, 10, '2025-02-25 15:07:06'),
(124, 3, 20, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(125, 3, 51, 'Completed', 13, 7, '2025-02-25 15:07:06'),
(126, 3, 52, 'On-hold', 8, NULL, '2025-02-25 15:09:12'),
(127, 3, 53, 'Completed', 24, 8, '2025-02-25 15:07:06'),
(128, 3, 54, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(129, 3, 55, 'Completed', 366, 9, '2025-02-25 15:07:06'),
(130, 3, 56, 'Watching', 11, NULL, '2025-02-25 15:09:12'),
(131, 3, 57, 'Dropped', 0, 6, '2025-02-25 14:51:30'),
(132, 3, 58, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(133, 3, 59, 'On-hold', 187, NULL, '2025-02-25 15:09:12'),
(134, 3, 60, 'Completed', 22, 7, '2025-02-25 15:07:06'),
(135, 3, 61, 'Dropped', 0, 4, '2025-02-25 14:51:30'),
(136, 3, 62, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(137, 3, 63, 'Completed', 13, 9, '2025-02-25 15:07:06'),
(138, 3, 64, 'Watching', 70, NULL, '2025-02-25 15:09:12'),
(139, 3, 65, 'Completed', 27, 8, '2025-02-25 15:07:06'),
(140, 3, 66, 'Dropped', 0, 5, '2025-02-25 14:51:30'),
(141, 3, 67, 'On-hold', 9, NULL, '2025-02-25 15:09:12'),
(142, 3, 68, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(143, 3, 69, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(144, 3, 70, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(145, 3, 71, 'Watching', 6, NULL, '2025-02-25 15:09:12'),
(146, 3, 72, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(147, 3, 73, 'Plan to watch', 0, NULL, '2025-02-25 14:51:30'),
(148, 3, 74, 'On-hold', 7, NULL, '2025-02-25 15:09:12'),
(149, 3, 75, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(290, 3, 1, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(291, 3, 2, 'Watching', 62, NULL, '2025-02-25 15:09:12'),
(292, 3, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(293, 3, 4, 'On-hold', 14, NULL, '2025-02-25 15:09:12'),
(294, 3, 5, 'Completed', 1070, 8, '2025-02-25 15:07:06'),
(295, 3, 6, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(296, 3, 7, 'Watching', 0, NULL, '2025-02-25 14:54:10'),
(297, 3, 8, 'Completed', 26, 7, '2025-02-25 15:07:06'),
(298, 3, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(299, 3, 10, 'On-hold', 2, NULL, '2025-02-25 15:09:12'),
(300, 3, 11, 'Completed', 148, 6, '2025-02-25 15:07:06'),
(301, 3, 12, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(302, 3, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(303, 3, 14, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(304, 3, 15, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(305, 3, 16, 'Dropped', 0, 3, '2025-02-25 14:54:10'),
(306, 3, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(307, 3, 18, 'On-hold', 2, NULL, '2025-02-25 15:09:12'),
(308, 3, 19, 'Completed', 51, 10, '2025-02-25 15:07:06'),
(309, 3, 20, 'Watching', 14, NULL, '2025-02-25 15:09:12'),
(310, 4, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(311, 4, 2, 'On-hold', 31, NULL, '2025-02-25 15:09:12'),
(312, 4, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(313, 4, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(314, 4, 5, 'Watching', 780, NULL, '2025-02-25 15:09:12'),
(315, 4, 6, 'Dropped', 0, 6, '2025-02-25 14:54:10'),
(316, 4, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(317, 4, 8, 'Watching', 24, NULL, '2025-02-25 15:09:12'),
(318, 4, 9, 'Completed', 113, 6, '2025-02-25 15:07:06'),
(319, 4, 10, 'On-hold', 16, NULL, '2025-02-25 15:09:12'),
(320, 4, 11, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(321, 4, 12, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(322, 4, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(323, 4, 14, 'Completed', 26, 10, '2025-02-25 15:07:06'),
(324, 4, 15, 'Watching', 8, NULL, '2025-02-25 15:09:12'),
(325, 4, 16, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(326, 4, 17, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(327, 4, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(328, 4, 19, 'Watching', 49, NULL, '2025-02-25 15:09:12'),
(329, 4, 20, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(330, 5, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(331, 5, 2, 'On-hold', 30, NULL, '2025-02-25 15:09:12'),
(332, 5, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(333, 5, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(334, 5, 5, 'Watching', 924, NULL, '2025-02-25 15:09:12'),
(335, 5, 6, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(336, 5, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(337, 5, 8, 'Watching', 8, NULL, '2025-02-25 15:09:12'),
(338, 5, 9, 'Completed', 113, 8, '2025-02-25 15:07:06'),
(339, 5, 10, 'On-hold', 21, NULL, '2025-02-25 15:09:12'),
(340, 5, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(341, 5, 12, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(342, 5, 13, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(343, 5, 14, 'Watching', 3, NULL, '2025-02-25 15:09:12'),
(344, 5, 15, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(345, 5, 16, 'Dropped', 0, 3, '2025-02-25 14:54:10'),
(346, 5, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(347, 5, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(348, 5, 19, 'Watching', 29, NULL, '2025-02-25 15:09:12'),
(349, 5, 20, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(350, 6, 1, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(351, 6, 2, 'Watching', 56, NULL, '2025-02-25 15:09:12'),
(352, 6, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(353, 6, 4, 'Completed', 500, 8, '2025-02-25 15:07:06'),
(354, 6, 5, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(355, 6, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(356, 6, 7, 'Watching', 0, NULL, '2025-02-25 14:54:10'),
(357, 6, 8, 'On-hold', 17, NULL, '2025-02-25 15:09:12'),
(358, 6, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(359, 6, 10, 'Dropped', 0, 6, '2025-02-25 14:54:10'),
(360, 6, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(361, 6, 12, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(362, 6, 13, 'Watching', 10, NULL, '2025-02-25 15:09:12'),
(363, 6, 14, 'On-hold', 10, NULL, '2025-02-25 15:09:12'),
(364, 6, 15, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(365, 6, 16, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(366, 6, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(367, 6, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(368, 6, 19, 'Watching', 49, NULL, '2025-02-25 15:09:12'),
(369, 6, 20, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(370, 7, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(371, 7, 2, 'Watching', 1, NULL, '2025-02-25 15:09:12'),
(372, 7, 3, 'On-hold', 23, NULL, '2025-02-25 15:09:12'),
(373, 7, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(374, 7, 5, 'Watching', 140, NULL, '2025-02-25 15:09:12'),
(375, 7, 6, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(376, 7, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(377, 7, 8, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(378, 7, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(379, 7, 10, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(380, 7, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(381, 7, 12, 'On-hold', 22, NULL, '2025-02-25 15:09:12'),
(382, 7, 13, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(383, 7, 14, 'Watching', 14, NULL, '2025-02-25 15:09:12'),
(384, 7, 15, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(385, 7, 16, 'Dropped', 0, 3, '2025-02-25 14:54:10'),
(386, 7, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(387, 7, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(388, 7, 19, 'Watching', 7, NULL, '2025-02-25 15:09:12'),
(389, 7, 20, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(390, 8, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(391, 8, 2, 'Watching', 27, NULL, '2025-02-25 15:09:12'),
(392, 8, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(393, 8, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(394, 8, 5, 'Watching', 65, NULL, '2025-02-25 15:09:12'),
(395, 8, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(396, 8, 7, 'Completed', 1, 6, '2025-02-25 15:07:06'),
(397, 8, 8, 'On-hold', 12, NULL, '2025-02-25 15:09:12'),
(398, 8, 9, 'Completed', 113, 9, '2025-02-25 15:07:06'),
(399, 8, 10, 'Watching', 6, NULL, '2025-02-25 15:09:12'),
(400, 8, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(401, 8, 12, 'Dropped', 0, 5, '2025-02-25 14:54:10'),
(402, 8, 13, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(403, 8, 14, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(404, 8, 15, 'Watching', 1, NULL, '2025-02-25 15:09:12'),
(405, 8, 16, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(406, 8, 17, 'On-hold', 13, NULL, '2025-02-25 15:09:12'),
(407, 8, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(408, 8, 19, 'Watching', 37, NULL, '2025-02-25 15:09:12'),
(409, 8, 20, 'Completed', 25, 6, '2025-02-25 15:07:06'),
(410, 9, 1, 'Completed', 75, 7, '2025-02-25 15:07:06'),
(411, 9, 2, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(412, 9, 3, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(413, 9, 4, 'On-hold', 463, NULL, '2025-02-25 15:09:12'),
(414, 9, 5, 'Dropped', 0, 6, '2025-02-25 14:54:10'),
(415, 9, 6, 'Completed', 37, 8, '2025-02-25 15:07:06'),
(416, 9, 7, 'Watching', 0, NULL, '2025-02-25 14:54:10'),
(417, 9, 8, 'Completed', 26, 9, '2025-02-25 15:07:06'),
(418, 9, 9, 'Completed', 113, 7, '2025-02-25 15:07:06'),
(419, 9, 10, 'Dropped', 0, 4, '2025-02-25 14:54:10'),
(420, 9, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(421, 9, 12, 'Watching', 14, NULL, '2025-02-25 15:09:12'),
(422, 9, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(423, 9, 14, 'Dropped', 0, 3, '2025-02-25 14:54:10'),
(424, 9, 15, 'Plan to watch', 0, NULL, '2025-02-25 14:54:10'),
(425, 9, 16, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(426, 9, 17, 'Watching', 12, NULL, '2025-02-25 15:09:12'),
(427, 9, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(428, 9, 19, 'Completed', 51, 9, '2025-02-25 15:07:06'),
(429, 9, 20, 'Watching', 15, NULL, '2025-02-25 15:09:12'),
(430, 10, 1, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(431, 10, 2, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(432, 10, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(433, 10, 4, 'On-hold', 276, NULL, '2025-02-25 15:09:12'),
(434, 10, 5, 'Completed', 1070, 8, '2025-02-25 15:07:06'),
(435, 10, 6, 'Dropped', 0, 6, '2025-02-25 14:57:00'),
(436, 10, 7, 'Watching', 0, NULL, '2025-02-25 14:57:00'),
(437, 10, 8, 'Completed', 26, 7, '2025-02-25 15:07:06'),
(438, 10, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(439, 10, 10, 'On-hold', 19, NULL, '2025-02-25 15:09:12'),
(440, 10, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(441, 10, 12, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(442, 10, 13, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(443, 10, 14, 'Watching', 17, NULL, '2025-02-25 15:09:12'),
(444, 10, 15, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(445, 10, 16, 'Dropped', 0, 3, '2025-02-25 14:57:00'),
(446, 10, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(447, 10, 18, 'On-hold', 1, NULL, '2025-02-25 15:09:12'),
(448, 10, 19, 'Completed', 51, 10, '2025-02-25 15:07:06'),
(449, 10, 20, 'Watching', 9, NULL, '2025-02-25 15:09:12'),
(450, 11, 1, 'Completed', 75, 7, '2025-02-25 15:07:06'),
(451, 11, 2, 'Watching', 10, NULL, '2025-02-25 15:09:12'),
(452, 11, 3, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(453, 11, 4, 'On-hold', 487, NULL, '2025-02-25 15:09:12'),
(454, 11, 5, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(455, 11, 6, 'Completed', 37, 8, '2025-02-25 15:07:06'),
(456, 11, 7, 'Watching', 0, NULL, '2025-02-25 14:57:00'),
(457, 11, 8, 'Completed', 26, 9, '2025-02-25 15:07:06'),
(458, 11, 9, 'Completed', 113, 7, '2025-02-25 15:07:06'),
(459, 11, 10, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(460, 11, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(461, 11, 12, 'Watching', 3, NULL, '2025-02-25 15:09:12'),
(462, 11, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(463, 11, 14, 'Dropped', 0, 3, '2025-02-25 14:57:00'),
(464, 11, 15, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(465, 11, 16, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(466, 11, 17, 'Watching', 8, NULL, '2025-02-25 15:09:12'),
(467, 11, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(468, 11, 19, 'Completed', 51, 9, '2025-02-25 15:07:06'),
(469, 11, 20, 'Watching', 21, NULL, '2025-02-25 15:09:12'),
(470, 12, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(471, 12, 2, 'Watching', 37, NULL, '2025-02-25 15:09:12'),
(472, 12, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(473, 12, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(474, 12, 5, 'Watching', 975, NULL, '2025-02-25 15:09:12'),
(475, 12, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(476, 12, 7, 'Completed', 1, 6, '2025-02-25 15:07:06'),
(477, 12, 8, 'On-hold', 7, NULL, '2025-02-25 15:09:12'),
(478, 12, 9, 'Completed', 113, 9, '2025-02-25 15:07:06'),
(479, 12, 10, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(480, 12, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(481, 12, 12, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(482, 12, 13, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(483, 12, 14, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(484, 12, 15, 'Watching', 1, NULL, '2025-02-25 15:09:12'),
(485, 12, 16, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(486, 12, 17, 'On-hold', 1, NULL, '2025-02-25 15:09:12'),
(487, 12, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(488, 12, 19, 'Watching', 13, NULL, '2025-02-25 15:09:12'),
(489, 12, 20, 'Completed', 25, 6, '2025-02-25 15:07:06'),
(490, 13, 1, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(491, 13, 2, 'Watching', 26, NULL, '2025-02-25 15:09:12'),
(492, 13, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(493, 13, 4, 'Completed', 500, 8, '2025-02-25 15:07:06'),
(494, 13, 5, 'Dropped', 0, 6, '2025-02-25 14:57:00'),
(495, 13, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(496, 13, 7, 'Watching', 0, NULL, '2025-02-25 14:57:00'),
(497, 13, 8, 'On-hold', 22, NULL, '2025-02-25 15:09:12'),
(498, 13, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(499, 13, 10, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(500, 13, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(501, 13, 12, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(502, 13, 13, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(503, 13, 14, 'On-hold', 18, NULL, '2025-02-25 15:09:12'),
(504, 13, 15, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(505, 13, 16, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(506, 13, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(507, 13, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(508, 13, 19, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(509, 13, 20, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(510, 14, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(511, 14, 2, 'Watching', 18, NULL, '2025-02-25 15:09:12'),
(512, 14, 3, 'On-hold', 22, NULL, '2025-02-25 15:09:12'),
(513, 14, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(514, 14, 5, 'Watching', 403, NULL, '2025-02-25 15:09:12'),
(515, 14, 6, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(516, 14, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(517, 14, 8, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(518, 14, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(519, 14, 10, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(520, 14, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(521, 14, 12, 'On-hold', 22, NULL, '2025-02-25 15:09:12'),
(522, 14, 13, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(523, 14, 14, 'Watching', 13, NULL, '2025-02-25 15:09:12'),
(524, 14, 15, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(525, 14, 16, 'Dropped', 0, 3, '2025-02-25 14:57:00'),
(526, 14, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(527, 14, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(528, 14, 19, 'Watching', 34, NULL, '2025-02-25 15:09:12'),
(529, 14, 20, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(530, 15, 1, 'Completed', 75, 7, '2025-02-25 15:07:06'),
(531, 15, 2, 'Watching', 13, NULL, '2025-02-25 15:09:12'),
(532, 15, 3, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(533, 15, 4, 'On-hold', 113, NULL, '2025-02-25 15:09:12'),
(534, 15, 5, 'Dropped', 0, 6, '2025-02-25 14:57:00'),
(535, 15, 6, 'Completed', 37, 8, '2025-02-25 15:07:06'),
(536, 15, 7, 'Watching', 0, NULL, '2025-02-25 14:57:00'),
(537, 15, 8, 'Completed', 26, 9, '2025-02-25 15:07:06'),
(538, 15, 9, 'Completed', 113, 7, '2025-02-25 15:07:06'),
(539, 15, 10, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(540, 15, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(541, 15, 12, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(542, 15, 13, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(543, 15, 14, 'Dropped', 0, 3, '2025-02-25 14:57:00'),
(544, 15, 15, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(545, 15, 16, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(546, 15, 17, 'Watching', 13, NULL, '2025-02-25 15:09:12'),
(547, 15, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(548, 15, 19, 'Completed', 51, 9, '2025-02-25 15:07:06'),
(549, 15, 20, 'Watching', 9, NULL, '2025-02-25 15:09:12'),
(550, 16, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(551, 16, 2, 'Watching', 8, NULL, '2025-02-25 15:09:12'),
(552, 16, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(553, 16, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(554, 16, 5, 'Watching', 158, NULL, '2025-02-25 15:09:12'),
(555, 16, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(556, 16, 7, 'Completed', 1, 6, '2025-02-25 15:07:06'),
(557, 16, 8, 'On-hold', 14, NULL, '2025-02-25 15:09:12'),
(558, 16, 9, 'Completed', 113, 9, '2025-02-25 15:07:06'),
(559, 16, 10, 'Watching', 25, NULL, '2025-02-25 15:09:12'),
(560, 16, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(561, 16, 12, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(562, 16, 13, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(563, 16, 14, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(564, 16, 15, 'Watching', 4, NULL, '2025-02-25 15:09:12'),
(565, 16, 16, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(566, 16, 17, 'On-hold', 2, NULL, '2025-02-25 15:09:12'),
(567, 16, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(568, 16, 19, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(569, 16, 20, 'Completed', 25, 6, '2025-02-25 15:07:06'),
(570, 17, 1, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(571, 17, 2, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(572, 17, 3, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(573, 17, 4, 'Completed', 500, 8, '2025-02-25 15:07:06'),
(574, 17, 5, 'Dropped', 0, 6, '2025-02-25 14:57:00'),
(575, 17, 6, 'Completed', 37, 7, '2025-02-25 15:07:06'),
(576, 17, 7, 'Watching', 0, NULL, '2025-02-25 14:57:00'),
(577, 17, 8, 'On-hold', 4, NULL, '2025-02-25 15:09:12'),
(578, 17, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(579, 17, 10, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(580, 17, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(581, 17, 12, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(582, 17, 13, 'Watching', 1, NULL, '2025-02-25 15:09:12'),
(583, 17, 14, 'On-hold', 12, NULL, '2025-02-25 15:09:12'),
(584, 17, 15, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(585, 17, 16, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(586, 17, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(587, 17, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(588, 17, 19, 'Watching', 23, NULL, '2025-02-25 15:09:12'),
(589, 17, 20, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(590, 18, 1, 'Completed', 75, 8, '2025-02-25 15:07:06'),
(591, 18, 2, 'Watching', 49, NULL, '2025-02-25 15:09:12'),
(592, 18, 3, 'On-hold', 18, NULL, '2025-02-25 15:09:12'),
(593, 18, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(594, 18, 5, 'Watching', 649, NULL, '2025-02-25 15:09:12'),
(595, 18, 6, 'Dropped', 0, 5, '2025-02-25 14:57:00'),
(596, 18, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(597, 18, 8, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(598, 18, 9, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(599, 18, 10, 'Dropped', 0, 4, '2025-02-25 14:57:00'),
(600, 18, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(601, 18, 12, 'On-hold', 16, NULL, '2025-02-25 15:09:12'),
(602, 18, 13, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(603, 18, 14, 'Watching', 18, NULL, '2025-02-25 15:09:12'),
(604, 18, 15, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(605, 18, 16, 'Dropped', 0, 3, '2025-02-25 14:57:00'),
(606, 18, 17, 'Plan to watch', 0, NULL, '2025-02-25 14:57:00'),
(607, 18, 18, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(608, 18, 19, 'Watching', 50, NULL, '2025-02-25 15:09:12'),
(609, 18, 20, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(610, 19, 1, 'Completed', 75, 7, '2025-02-25 15:07:06'),
(611, 19, 2, 'Watching', 51, NULL, '2025-02-25 15:09:12'),
(612, 19, 3, 'On-hold', 23, NULL, '2025-02-25 15:09:12'),
(613, 19, 4, 'Completed', 500, 8, '2025-02-25 15:07:06'),
(614, 19, 5, 'Watching', 635, NULL, '2025-02-25 15:09:12'),
(615, 19, 6, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(616, 19, 7, 'Completed', 1, 9, '2025-02-25 15:07:06'),
(617, 19, 8, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(618, 19, 9, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(619, 19, 10, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(620, 19, 11, 'Completed', 148, 9, '2025-02-25 15:07:06'),
(621, 19, 12, 'Watching', 4, NULL, '2025-02-25 15:09:12'),
(622, 19, 13, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(623, 19, 14, 'Completed', 26, 10, '2025-02-25 15:07:06'),
(624, 19, 15, 'On-hold', 3, NULL, '2025-02-25 15:09:12'),
(625, 19, 16, 'Watching', 7, NULL, '2025-02-25 15:09:12'),
(626, 19, 17, 'Completed', 16, 8, '2025-02-25 15:07:06'),
(627, 19, 18, 'Watching', 6, NULL, '2025-02-25 15:09:12'),
(628, 19, 19, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(629, 19, 20, 'Completed', 25, 6, '2025-02-25 15:07:06'),
(630, 20, 21, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(631, 20, 22, 'Completed', 170, 8, '2025-02-25 15:07:06'),
(632, 20, 23, 'Watching', 144, NULL, '2025-02-25 15:09:12'),
(633, 20, 24, 'On-hold', 3, NULL, '2025-02-25 15:09:12'),
(634, 20, 25, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(635, 20, 51, 'Completed', 13, 7, '2025-02-25 15:07:06'),
(636, 20, 52, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(637, 20, 53, 'Completed', 24, 6, '2025-02-25 15:07:06'),
(638, 20, 54, 'Completed', 0, 10, '2025-02-25 15:00:10'),
(639, 20, 55, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(640, 20, 56, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(641, 20, 57, 'On-hold', 8, NULL, '2025-02-25 15:09:12'),
(642, 20, 58, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(643, 20, 59, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(644, 20, 60, 'Completed', 22, 9, '2025-02-25 15:07:06'),
(645, 20, 61, 'Watching', 25, NULL, '2025-02-25 15:09:12'),
(646, 20, 62, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(647, 20, 63, 'Completed', 13, 8, '2025-02-25 15:07:06'),
(648, 20, 64, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(649, 20, 65, 'Completed', 27, 9, '2025-02-25 15:07:06'),
(650, 21, 11, 'Completed', 148, 7, '2025-02-25 15:07:06'),
(651, 21, 12, 'Watching', 17, NULL, '2025-02-25 15:09:12'),
(652, 21, 13, 'On-hold', 8, NULL, '2025-02-25 15:09:12'),
(653, 21, 14, 'Completed', 26, 9, '2025-02-25 15:07:06'),
(654, 21, 15, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(655, 21, 16, 'Completed', 25, 6, '2025-02-25 15:07:06'),
(656, 21, 17, 'Completed', 16, 8, '2025-02-25 15:07:06'),
(657, 21, 18, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(658, 21, 19, 'Completed', 51, 7, '2025-02-25 15:07:06'),
(659, 21, 20, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(660, 21, 21, 'On-hold', 12, NULL, '2025-02-25 15:09:12'),
(661, 21, 22, 'Completed', 170, 9, '2025-02-25 15:07:06'),
(662, 21, 23, 'Watching', 150, NULL, '2025-02-25 15:09:12'),
(663, 21, 24, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(664, 21, 25, 'Completed', 24, 10, '2025-02-25 15:07:06'),
(665, 21, 51, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(666, 21, 52, 'Completed', 13, 8, '2025-02-25 15:07:06'),
(667, 21, 53, 'Watching', 20, NULL, '2025-02-25 15:09:12'),
(668, 21, 54, 'Completed', 0, 7, '2025-02-25 15:00:10'),
(669, 21, 55, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(670, 22, 61, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(671, 22, 62, 'Watching', 123, NULL, '2025-02-25 15:09:12'),
(672, 22, 63, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(673, 22, 64, 'On-hold', 15, NULL, '2025-02-25 15:09:12'),
(674, 22, 65, 'Completed', 27, 7, '2025-02-25 15:07:06'),
(675, 22, 66, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(676, 22, 67, 'Watching', 10, NULL, '2025-02-25 15:09:12'),
(677, 22, 68, 'Completed', 24, 8, '2025-02-25 15:07:06'),
(678, 22, 69, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(679, 22, 70, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(680, 22, 71, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(681, 22, 72, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(682, 22, 73, 'On-hold', 6, NULL, '2025-02-25 15:09:12'),
(683, 22, 74, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(684, 22, 75, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(685, 22, 1, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(686, 22, 2, 'Completed', 64, 8, '2025-02-25 15:07:06'),
(687, 22, 3, 'Watching', 12, NULL, '2025-02-25 15:09:12'),
(688, 22, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(689, 22, 5, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(690, 23, 10, 'Completed', 26, 7, '2025-02-25 15:07:06'),
(691, 23, 11, 'Watching', 54, NULL, '2025-02-25 15:09:12'),
(692, 23, 12, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(693, 23, 13, 'On-hold', 3, NULL, '2025-02-25 15:09:12'),
(694, 23, 14, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(695, 23, 15, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(696, 23, 16, 'Watching', 11, NULL, '2025-02-25 15:09:12'),
(697, 23, 17, 'Completed', 16, 6, '2025-02-25 15:07:06'),
(698, 23, 18, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(699, 23, 19, 'Completed', 51, 7, '2025-02-25 15:07:06'),
(700, 23, 20, 'On-hold', 2, NULL, '2025-02-25 15:09:12'),
(701, 23, 21, 'Completed', 25, 10, '2025-02-25 15:07:06'),
(702, 23, 22, 'Watching', 71, NULL, '2025-02-25 15:09:12'),
(703, 23, 23, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(704, 23, 24, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(705, 23, 25, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(706, 23, 51, 'Completed', 13, 8, '2025-02-25 15:07:06'),
(707, 23, 52, 'Completed', 13, 9, '2025-02-25 15:07:06'),
(708, 23, 53, 'Watching', 21, NULL, '2025-02-25 15:09:12'),
(709, 23, 54, 'Completed', 0, 7, '2025-02-25 15:00:10'),
(710, 24, 4, 'Completed', 500, 8, '2025-02-25 15:07:06'),
(711, 24, 5, 'Watching', 156, NULL, '2025-02-25 15:09:12'),
(712, 24, 6, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(713, 24, 7, 'Completed', 1, 9, '2025-02-25 15:07:06'),
(714, 24, 8, 'On-hold', 3, NULL, '2025-02-25 15:09:12'),
(715, 24, 9, 'Completed', 113, 6, '2025-02-25 15:07:06'),
(716, 24, 10, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(717, 24, 11, 'Completed', 148, 7, '2025-02-25 15:07:06'),
(718, 24, 12, 'Watching', 24, NULL, '2025-02-25 15:09:12'),
(719, 24, 13, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(720, 24, 14, 'Completed', 26, 8, '2025-02-25 15:07:06'),
(721, 24, 15, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(722, 24, 16, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(723, 24, 17, 'Watching', 15, NULL, '2025-02-25 15:09:12'),
(724, 24, 18, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(725, 24, 19, 'On-hold', 31, NULL, '2025-02-25 15:09:12'),
(726, 24, 20, 'Completed', 25, 8, '2025-02-25 15:07:06'),
(727, 24, 21, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(728, 24, 22, 'Completed', 170, 9, '2025-02-25 15:07:06'),
(729, 25, 51, 'Completed', 13, 7, '2025-02-25 15:07:06'),
(730, 25, 52, 'Watching', 7, NULL, '2025-02-25 15:09:12'),
(731, 25, 53, 'Completed', 24, 8, '2025-02-25 15:07:06'),
(732, 25, 54, 'On-hold', 0, NULL, '2025-02-25 15:00:10'),
(733, 25, 55, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(734, 25, 56, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(735, 25, 57, 'Completed', 13, 7, '2025-02-25 15:07:06'),
(736, 25, 58, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(737, 25, 59, 'Completed', 328, 6, '2025-02-25 15:07:06'),
(738, 25, 60, 'Completed', 22, 10, '2025-02-25 15:07:06'),
(739, 25, 61, 'Watching', 47, NULL, '2025-02-25 15:09:12'),
(740, 25, 62, 'Completed', 152, 8, '2025-02-25 15:07:06'),
(741, 25, 63, 'On-hold', 8, NULL, '2025-02-25 15:09:12'),
(742, 25, 64, 'Completed', 85, 9, '2025-02-25 15:07:06'),
(743, 25, 65, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(744, 25, 66, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(745, 25, 67, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(746, 25, 68, 'Completed', 24, 6, '2025-02-25 15:07:06'),
(747, 25, 69, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(748, 25, 70, 'Watching', 11, NULL, '2025-02-25 15:09:12'),
(749, 26, 2, 'Completed', 64, 9, '2025-02-25 15:07:06'),
(750, 26, 3, 'Watching', 16, NULL, '2025-02-25 15:09:12'),
(751, 26, 4, 'On-hold', 98, NULL, '2025-02-25 15:09:12'),
(752, 26, 5, 'Completed', 1070, 8, '2025-02-25 15:07:06'),
(753, 26, 6, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(754, 26, 7, 'Completed', 1, 7, '2025-02-25 15:07:06'),
(755, 26, 8, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(756, 26, 9, 'Watching', 106, NULL, '2025-02-25 15:09:12'),
(757, 26, 10, 'Completed', 26, 9, '2025-02-25 15:07:06'),
(758, 26, 11, 'On-hold', 1, NULL, '2025-02-25 15:09:12'),
(759, 26, 12, 'Completed', 25, 8, '2025-02-25 15:07:06'),
(760, 26, 13, 'Completed', 12, 10, '2025-02-25 15:07:06'),
(761, 26, 14, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(762, 26, 15, 'Completed', 12, 7, '2025-02-25 15:07:06'),
(763, 26, 16, 'Watching', 11, NULL, '2025-02-25 15:09:12'),
(764, 26, 17, 'Completed', 16, 8, '2025-02-25 15:07:06'),
(765, 26, 18, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(766, 26, 19, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(767, 26, 20, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(768, 27, 22, 'Completed', 170, 8, '2025-02-25 15:07:06'),
(769, 27, 23, 'Watching', 318, NULL, '2025-02-25 15:09:12'),
(770, 27, 24, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(771, 27, 25, 'On-hold', 23, NULL, '2025-02-25 15:09:12'),
(772, 27, 26, 'Completed', 0, 7, '2025-02-25 15:00:10'),
(773, 27, 27, 'Dropped', 0, 6, '2025-02-25 15:00:10'),
(774, 27, 28, 'Completed', 0, 8, '2025-02-25 15:00:10'),
(775, 27, 51, 'Completed', 13, 10, '2025-02-25 15:07:06'),
(776, 27, 52, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(777, 27, 53, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(778, 27, 54, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(779, 27, 55, 'Completed', 366, 8, '2025-02-25 15:07:06'),
(780, 27, 56, 'On-hold', 4, NULL, '2025-02-25 15:09:12'),
(781, 27, 57, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(782, 27, 58, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(783, 27, 59, 'Completed', 328, 7, '2025-02-25 15:07:06'),
(784, 27, 60, 'Watching', 1, NULL, '2025-02-25 15:09:12'),
(785, 27, 61, 'Completed', 75, 9, '2025-02-25 15:07:06'),
(786, 27, 62, 'Completed', 152, 6, '2025-02-25 15:07:06'),
(787, 28, 9, 'Completed', 113, 7, '2025-02-25 15:07:06'),
(788, 28, 10, 'Watching', 20, NULL, '2025-02-25 15:09:12'),
(789, 28, 11, 'Completed', 148, 8, '2025-02-25 15:07:06'),
(790, 28, 12, 'On-hold', 23, NULL, '2025-02-25 15:09:12'),
(791, 28, 13, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(792, 28, 14, 'Completed', 26, 6, '2025-02-25 15:07:06'),
(793, 28, 15, 'Watching', 4, NULL, '2025-02-25 15:09:12'),
(794, 28, 16, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(795, 28, 17, 'Completed', 16, 10, '2025-02-25 15:07:06'),
(796, 28, 18, 'Dropped', 0, 5, '2025-02-25 15:00:10'),
(797, 28, 19, 'Completed', 51, 7, '2025-02-25 15:07:06'),
(798, 28, 20, 'Completed', 25, 8, '2025-02-25 15:07:06'),
(799, 28, 21, 'Completed', 25, 9, '2025-02-25 15:07:06'),
(800, 28, 22, 'On-hold', 105, NULL, '2025-02-25 15:09:12'),
(801, 28, 23, 'Completed', 367, 8, '2025-02-25 15:07:06'),
(802, 28, 24, 'Plan to watch', 0, NULL, '2025-02-25 15:00:10'),
(803, 28, 25, 'Completed', 24, 10, '2025-02-25 15:07:06'),
(804, 28, 51, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(805, 28, 52, 'Dropped', 0, 4, '2025-02-25 15:00:10'),
(806, 28, 53, 'Completed', 24, 9, '2025-02-25 15:07:06'),
(807, 29, 1, 'Completed', 75, 7, '2025-02-25 15:07:06'),
(808, 29, 2, 'Watching', 43, NULL, '2025-02-25 15:09:12'),
(809, 29, 3, 'On-hold', 19, NULL, '2025-02-25 15:09:12'),
(810, 29, 4, 'Completed', 500, 9, '2025-02-25 15:07:06'),
(811, 29, 5, 'Completed', 1070, 8, '2025-02-25 15:07:06'),
(812, 29, 6, 'Dropped', 0, 5, '2025-02-25 15:00:37'),
(813, 29, 7, 'Completed', 1, 6, '2025-02-25 15:07:06'),
(814, 29, 8, 'Watching', 2, NULL, '2025-02-25 15:09:12'),
(815, 29, 9, 'Completed', 113, 10, '2025-02-25 15:07:06'),
(816, 29, 10, 'Plan to watch', 0, NULL, '2025-02-25 15:00:37'),
(817, 29, 11, 'Completed', 148, 7, '2025-02-25 15:07:06'),
(818, 29, 12, 'Watching', 18, NULL, '2025-02-25 15:09:12'),
(819, 29, 13, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(820, 29, 14, 'On-hold', 5, NULL, '2025-02-25 15:09:12'),
(821, 29, 15, 'Completed', 12, 9, '2025-02-25 15:07:06'),
(822, 29, 16, 'Plan to watch', 0, NULL, '2025-02-25 15:00:37'),
(823, 29, 17, 'Completed', 16, 6, '2025-02-25 15:07:06'),
(824, 29, 18, 'Completed', 12, 8, '2025-02-25 15:07:06'),
(825, 29, 19, 'Dropped', 0, 4, '2025-02-25 15:00:37'),
(826, 29, 20, 'Watching', 9, NULL, '2025-02-25 15:09:12'),
(827, 30, 21, 'Completed', 25, 8, '2025-02-25 15:07:06'),
(828, 30, 22, 'Watching', 144, NULL, '2025-02-25 15:09:12'),
(829, 30, 23, 'Completed', 367, 9, '2025-02-25 15:07:06'),
(830, 30, 24, 'Completed', 25, 7, '2025-02-25 15:07:06'),
(831, 30, 25, 'On-hold', 11, NULL, '2025-02-25 15:09:12'),
(832, 30, 26, 'Completed', 0, 6, '2025-02-25 15:00:37'),
(833, 30, 27, 'Completed', 0, 9, '2025-02-25 15:00:37'),
(834, 30, 28, 'Plan to watch', 0, NULL, '2025-02-25 15:00:37'),
(835, 30, 51, 'Completed', 13, 10, '2025-02-25 15:07:06'),
(836, 30, 52, 'Watching', 5, NULL, '2025-02-25 15:09:12'),
(837, 30, 53, 'Completed', 24, 8, '2025-02-25 15:07:06'),
(838, 30, 54, 'Dropped', 0, 5, '2025-02-25 15:00:37'),
(839, 30, 55, 'Completed', 366, 7, '2025-02-25 15:07:06'),
(840, 30, 56, 'On-hold', 6, NULL, '2025-02-25 15:09:12'),
(841, 30, 57, 'Completed', 13, 9, '2025-02-25 15:07:06'),
(842, 30, 58, 'Completed', 12, 6, '2025-02-25 15:07:06'),
(843, 30, 59, 'Plan to watch', 0, NULL, '2025-02-25 15:00:37'),
(844, 30, 60, 'Completed', 22, 10, '2025-02-25 15:07:06'),
(845, 30, 61, 'Watching', 11, NULL, '2025-02-25 15:09:12'),
(846, 30, 62, 'Completed', 152, 8, '2025-02-25 15:07:06');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_anime_progress`
--
ALTER TABLE `user_anime_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=847;

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
