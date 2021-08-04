-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2021 at 10:00 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogphp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `anketa`
--

CREATE TABLE `anketa` (
  `idAnkete` int(255) NOT NULL,
  `pitanje` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktivna` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anketa`
--

INSERT INTO `anketa` (`idAnkete`, `pitanje`, `aktivna`) VALUES
(19, 'Which is your favourite season for travel?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `idKategorije` int(255) NOT NULL,
  `naziv` varchar(450) COLLATE utf8_unicode_ci NOT NULL,
  `slikasrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`idKategorije`, `naziv`, `slikasrc`) VALUES
(34, 'Travel', 'travel.jpeg'),
(35, 'Relax', 'relax.jpeg'),
(36, 'Food', 'food.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

CREATE TABLE `komentari` (
  `idKomentar` int(255) NOT NULL,
  `tekst` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `datumKomentara` timestamp NOT NULL DEFAULT current_timestamp(),
  `idKorisnika` int(255) NOT NULL,
  `idPosta` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`idKomentar`, `tekst`, `datumKomentara`, `idKorisnika`, `idPosta`) VALUES
(34, 'Very nice!', '2021-04-08 14:15:36', 15, 1),
(36, 'I like this', '2021-04-08 14:17:26', 15, 43),
(37, 'Thank you for this tips', '2021-04-08 14:18:08', 15, 2),
(38, 'Nice post', '2021-04-08 14:19:08', 16, 43),
(41, 'I like Filipines and your posts', '2021-04-08 16:39:30', 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `idKorisnika` int(255) NOT NULL,
  `ime` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aktivan` tinyint(1) NOT NULL,
  `aktivacioniKod` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `idUloge` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`idKorisnika`, `ime`, `prezime`, `email`, `pass`, `aktivan`, `aktivacioniKod`, `datum`, `idUloge`) VALUES
(14, 'Jelena', 'Korugic', 'jelena@gmail.com', 'b6b01a55ee12068b86530bb5739d5b02', 1, '//', '2021-04-01 14:31:42', 1),
(15, 'Jovana', 'Korugic', 'jovana@gmail.com', '7e3c301e35104f5337bea611b738590a', 1, '//', '2021-04-08 15:48:15', 2),
(16, 'Jelenaa', 'Korugicc', 'jelenaa@gmail.com', 'c62439ea56c71bf8b4760d507e0e646a', 1, 'f5b30815c0348354309be215af631fc7', '2021-04-08 18:18:21', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lajkovi`
--

CREATE TABLE `lajkovi` (
  `idlajk` int(255) NOT NULL,
  `idPosta` int(255) NOT NULL,
  `idKorisnika` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lajkovi`
--

INSERT INTO `lajkovi` (`idlajk`, `idPosta`, `idKorisnika`) VALUES
(15, 2, 15),
(16, 1, 15),
(19, 1, 14),
(25, 2, 14),
(31, 43, 14),
(32, 4, 14),
(33, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

CREATE TABLE `meni` (
  `idMeni` int(255) NOT NULL,
  `naziv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `putanja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prikaz` int(1) NOT NULL,
  `prioritet` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meni`
--

INSERT INTO `meni` (`idMeni`, `naziv`, `putanja`, `prikaz`, `prioritet`) VALUES
(1, 'Home', 'index.php', 1, 1),
(2, 'Blog', 'blog.php', 1, 5),
(3, 'Log in', 'login.php', 0, 15),
(4, 'Register', 'register.php', 0, 15),
(5, 'Admin panel', 'admintemplate/index.php', 3, 20),
(6, 'Log out', 'logout.php', 2, 25),
(7, 'Contact', 'contact.php', 1, 10),
(9, 'Author', 'author.php', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `odgovori`
--

CREATE TABLE `odgovori` (
  `idOdgovora` int(255) NOT NULL,
  `tekstOdgovora` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idAnkete` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `odgovori`
--

INSERT INTO `odgovori` (`idOdgovora`, `tekstOdgovora`, `idAnkete`) VALUES
(44, 'All seasons', 19),
(45, 'Summer', 19),
(46, 'Autumn', 19),
(47, 'Spring', 19),
(48, 'Winter', 19);

-- --------------------------------------------------------

--
-- Table structure for table `odgovorianketa`
--

CREATE TABLE `odgovorianketa` (
  `idOdgovorAnketa` int(255) NOT NULL,
  `idOdgovora` int(255) NOT NULL,
  `idKorisnika` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `odgovorianketa`
--

INSERT INTO `odgovorianketa` (`idOdgovorAnketa`, `idOdgovora`, `idKorisnika`) VALUES
(24, 46, 16),
(26, 45, 15);

-- --------------------------------------------------------

--
-- Table structure for table `poruke`
--

CREATE TABLE `poruke` (
  `idPoruke` int(255) NOT NULL,
  `naslov` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekst` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postovi`
--

CREATE TABLE `postovi` (
  `idPosta` int(255) NOT NULL,
  `naslov` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` text COLLATE utf8_unicode_ci NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `idKategorije` int(255) NOT NULL,
  `slikasrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `postovi`
--

INSERT INTO `postovi` (`idPosta`, `naslov`, `tekst`, `datum`, `idKategorije`, `slikasrc`) VALUES
(1, 'Top 10 reasonst to visit Kuwait in 2020 ', '1.Arabian Desert - The Arabian Desert is probably one of the best experiences you will ever have when you visit Kuwait, and it is best enjoyed between October and March.\n2.Population Diversity - Maybe something you do not know is that Kuwait, just like many other Persian Gulf regions, has a diverse population so you’ll surely see a mix of vibrant cultures!\n3. Pristine Beaches - The country has some of the best beaches on the Persian Gulf’s waters, making it one of the best reasons why anyone should visit Kuwait!\n4.The Mirror House - The Khalifa & Lidia Qattan Art Museum, which also goes by the name “house of mirrors”, is one of a kind and a significant attraction to anyone traveling to Kuwait.\n5.Less Touristy - Kuwait isn’t one of the world’s leading tourist destinations and because of that, only a few tourists flock over to the country — which is not a bad thing in itself!\n6.Architectural Diversity - The city enjoys a wide diversity of architectural designs with some buildings dating far back to the 18th century.\n7.Failaka Island - This is an amazing day trip to do when you visit Kuwait as it is just an hour’s ferry ride away from the city!\n8.Souq Al-Mubarakiya - Kuwait is a haven for shoppers because they can get almost anything they need at affordable prices, thanks to no value-added tax!\n9.Great Local Kuwaiti Cuisine - If you like good food, you will love almost everything you eat when you visit Kuwait!\n10.Hospitality - The hospitality of the Kuwaiti people is another reason to visit Kuwait. ', '2021-04-12 15:55:42', 34, '1618242942kuwait.jpeg'),
(2, 'Tips to Make Your Kauai Trip Unforgettable', '1. Prepare for Water Photography\nIf you go to Kauai, you’re going to spend a good amount of time in or near the water. Whether it’s at the beach catching some rays, going for a swim or a snorkel or perhaps visiting one of the beautiful waterfalls, you’re going to get wet. But, in order to make sure you capture perfect photos of these experiences, you’ll want to be prepared.\n2. Know Which Place To Stay In Kauai\nThere are two sides of the island where visitors generally stay – the south shore (Poipu) and the north shore (Hanalei and Princeville). The first thing you should do is see which side matches your travel style the best so that you can determine where to stay in Kauai. Knowing where to stay on the island is important as you want to be close to the activities you’re interested in and in an environment that matches your needs and interests. \n3. Don’t Miss Out On Island Helicopters\nTaking a helicopter flight over Kauai is popular for a reason. Often said to have the most impressive landscapes on the planet, helicopters give you a chance to see this natural beauty from an incredible angle.\nSome companies, such as Island Helicopters, also allow tourists to land by the Manawaiopuna Falls in order to really have a unique experience. It’s a 400-foot waterfall on private land, which is simply magical, along with the views all around you. Combine this with canyons, coastline, mountains, jungle and more and a helicopter trip is hard to beat.\n4. Fly Across The Sky With Ziplines\nWith an exhilarating zipline experience, you’ll soar high over the treetops on one of the most beautiful islands in the world. One of the most popular ziplines in Kauai takes you to Kipu Ranch where seven different ziplines allow you to fly over the ranch’s lush valleys. ', '2021-04-12 16:00:01', 34, '1618243201filipini.jpg'),
(3, 'Season by Season Guide to the Philippines', 'Winter in the Philippines: December to February\nThe first 2 months of the year are generally considered the best for visiting the Philippines. With cooler temperatures, conditions are perfect for exploring the capital city Manila and taking part in outdoor activities such as hiking and exploring the mountains.\n\nWith temperatures rarely dropping below 60 ºF, it’s the ideal choice if you’re seeking warmer climes in wintertime. Levels of rainfall are low so you can expect plenty of sunshine.\n\nSpring in the Philippines: March to May\nOnce Spring arrives temperatures start to rise. If you’d like to visit the Philippines in Spring then March is a great time before it gets too hot.\n\nDuring April and May, daytime temperatures can reach 95 ºF so you might want to stay cool in the water and take advantage of the excellent diving opportunities in the Philippines. Take the plunge and you’ll be treated to a vast array of marine life including colorful coral, tropical fish, and pygmy seahorses.\n\nSummer in the Philippines: June to August  \nSummer is the rainy season in the Philippines and many tourists stay away. That’s not to say, however, that you can’t have an enjoyable vacation. You can expect around 20 days of rainfall each month during the wet season so you’ll need to be well prepared. \n\nThe average high drops to around 90 ºF but the humidity keeps nighttime temperatures close to 80 ºF. Thunderstorms are commonplace throughout the summer.\n\nAutumn in the Philippines: September to November\nThere’s little change in the weather during September and into October. Typhoons are not uncommon in September, and if you are thinking about visiting then be sure to check out the weather warnings before making any plans.\n\nThe rain starts to die down towards the end of October. There are several public holidays offering a fascinating insight into Filipino culture and traditions, just be aware that most shops and services will remain closed on these days. The Lanzones and MassKara festivals are not to be missed if visiting the islands in the Autumn.', '2021-04-12 16:01:42', 34, '1618243302fp.jpg'),
(4, 'Why I Travel So Much', 'It was while I was eating a bowl of pasta last night that I suddenly thought of a more suitable response. And it all has to do with a recent experience, a very simple experience, that essentially defines my desire to travel so much.\n\nTwo weeks ago, as I wrote about already, I went on a four-day trip to Bratislava, Slovakia. The purpose of this trip was to spend some time with three of my friends.\n\nSo, after flying from Bucharest to Vienna (the Vienna airport is only 40 minutes from Bratislava) there we were, the four of us – two Romanians, one Kazakh and one American – spending time together in Slovakia. We ate at local Slovakian restaurants, we drank Moldovan wines and Czech beers, we spent an evening searching for nebulas, star clusters and distant galaxies in an empty field just across the Hungarian border, we went to the cinema one afternoon and watched a film about India. We spoke about my friend’s desire to live in France, about all of our travels to Istanbul, about my time working on board cruise ships and about whether or not we should all participate in the Mongol Rally (a car ‘race’ from Prague to Mongolia) next year.\n\nAnd during that same trip, I also had a Skype call with a friend of mine from Australia, I made plans with another friend from the US to meet up in Montenegro in July and I received an email from an Italian friend of mine whom I hadn’t heard from in over a year and who just moved to Brazil, as one does.', '2021-04-12 16:06:38', 35, '1618243598post1.jpeg'),
(43, 'Mexico a love story', 'Some things just aren’t meant to be. Sometimes, no matter how much you want something, the universe seems to conspire against you.\n\nWhile I believe you make your own fate, I do think the universe has a way of saying, “Hey, the timing isn’t right. You should rethink your plans.”\n\nSo it was with my move to Mexico.\n\nLast year, I wrote how I had planned to move there for the winter.\n\nI needed a mental break, wanted to save money by renting out my apartment, and had a number of friends living there. My goal was to work, eat tacos, have a little social bubble, and spend a lot of time socially distanced at the beach.\n\nBut, thanks to a new management company that refused to allow me to sublease my apartment, those plans withered away. And while I’m not above having someone live there “under the radar,” most people in Texas need a car — and a parking pass for my building would definitely require my property management company’s approval.\n\nThus there would be no winter in Mexico for me.\n\nBut I discovered something during this process: Mexico is awesome.\n\nYes, I know I’m late to this party. So late that the hosts are cleaning the dishes and asking me where the heck I was all night.\n\nMexico is not some undiscovered land. Nowhere I went could be considered “off the beaten path.”\n\nBut while it was not my first time in the country — I’d briefly touched its shores as part of a cruise and once spent three days in a resort on a press trip way back in 2011 — it was my first time really seeing it.\nBefore this trip, I never gave Mexico much thought. It’s just a few hours away from Austin, so I had always figured I could go there anytime. Why visit Mexico when I could see French Polynesia instead?\n\nPeople rarely explore their own backyard. To many, travel is about long flights and faraway destinations.\n\nSo it was for me for a long time. Though in recent years Mexico rose higher on my list of places to visit as more friends raved about it, it just never seemed to make it to the top. I’d make plans to go, only to be distracted by a shiny object (i.e., some other country).\n\nOh, how I regret that after seeing what I’d been missing!\n\nMexico is magical.\n\nIn the six weeks I was there, I spent close to three in Tulum (which was terrible), one in Playa del Carmen, five days in the Yucatán, and two weeks in Oaxaca.', '2021-04-12 16:05:52', 34, '1618243552m.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `sponzori`
--

CREATE TABLE `sponzori` (
  `idSponzor` int(255) NOT NULL,
  `naziv` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponzori`
--

INSERT INTO `sponzori` (`idSponzor`, `naziv`) VALUES
(2, 'Plane tour'),
(4, 'SkyCloud'),
(1, 'Travel blog'),
(3, 'Word travel\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `idUloge` int(255) NOT NULL,
  `naziv` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uloga`
--

INSERT INTO `uloga` (`idUloge`, `naziv`) VALUES
(1, 'admin'),
(2, 'korisnik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anketa`
--
ALTER TABLE `anketa`
  ADD PRIMARY KEY (`idAnkete`);

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`idKategorije`),
  ADD UNIQUE KEY `naziv` (`naziv`);

--
-- Indexes for table `komentari`
--
ALTER TABLE `komentari`
  ADD PRIMARY KEY (`idKomentar`),
  ADD KEY `idKorisnika` (`idKorisnika`),
  ADD KEY `idPosta` (`idPosta`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`idKorisnika`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idUloge` (`idUloge`);

--
-- Indexes for table `lajkovi`
--
ALTER TABLE `lajkovi`
  ADD PRIMARY KEY (`idlajk`),
  ADD KEY `idPosta` (`idPosta`),
  ADD KEY `idKorisnika` (`idKorisnika`);

--
-- Indexes for table `meni`
--
ALTER TABLE `meni`
  ADD PRIMARY KEY (`idMeni`);

--
-- Indexes for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD PRIMARY KEY (`idOdgovora`),
  ADD KEY `idAnkete` (`idAnkete`);

--
-- Indexes for table `odgovorianketa`
--
ALTER TABLE `odgovorianketa`
  ADD PRIMARY KEY (`idOdgovorAnketa`),
  ADD KEY `idOdgovora` (`idOdgovora`),
  ADD KEY `idKorisnika` (`idKorisnika`);

--
-- Indexes for table `poruke`
--
ALTER TABLE `poruke`
  ADD PRIMARY KEY (`idPoruke`);

--
-- Indexes for table `postovi`
--
ALTER TABLE `postovi`
  ADD PRIMARY KEY (`idPosta`),
  ADD KEY `idKategorije` (`idKategorije`);

--
-- Indexes for table `sponzori`
--
ALTER TABLE `sponzori`
  ADD PRIMARY KEY (`idSponzor`),
  ADD UNIQUE KEY `naziv` (`naziv`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`idUloge`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anketa`
--
ALTER TABLE `anketa`
  MODIFY `idAnkete` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `idKategorije` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `komentari`
--
ALTER TABLE `komentari`
  MODIFY `idKomentar` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `korisnici`
--
ALTER TABLE `korisnici`
  MODIFY `idKorisnika` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lajkovi`
--
ALTER TABLE `lajkovi`
  MODIFY `idlajk` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `meni`
--
ALTER TABLE `meni`
  MODIFY `idMeni` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `odgovori`
--
ALTER TABLE `odgovori`
  MODIFY `idOdgovora` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `odgovorianketa`
--
ALTER TABLE `odgovorianketa`
  MODIFY `idOdgovorAnketa` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `poruke`
--
ALTER TABLE `poruke`
  MODIFY `idPoruke` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `postovi`
--
ALTER TABLE `postovi`
  MODIFY `idPosta` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `sponzori`
--
ALTER TABLE `sponzori`
  MODIFY `idSponzor` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `idUloge` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentari`
--
ALTER TABLE `komentari`
  ADD CONSTRAINT `komentari_ibfk_1` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnici` (`idKorisnika`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentari_ibfk_2` FOREIGN KEY (`idPosta`) REFERENCES `postovi` (`idPosta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `korisnici_ibfk_1` FOREIGN KEY (`idUloge`) REFERENCES `uloga` (`idUloge`);

--
-- Constraints for table `lajkovi`
--
ALTER TABLE `lajkovi`
  ADD CONSTRAINT `lajkovi_ibfk_1` FOREIGN KEY (`idPosta`) REFERENCES `postovi` (`idPosta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lajkovi_ibfk_2` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnici` (`idKorisnika`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD CONSTRAINT `odgovori_ibfk_1` FOREIGN KEY (`idAnkete`) REFERENCES `anketa` (`idAnkete`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `odgovorianketa`
--
ALTER TABLE `odgovorianketa`
  ADD CONSTRAINT `odgovorianketa_ibfk_2` FOREIGN KEY (`idOdgovora`) REFERENCES `odgovori` (`idOdgovora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `odgovorianketa_ibfk_3` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnici` (`idKorisnika`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `postovi`
--
ALTER TABLE `postovi`
  ADD CONSTRAINT `postovi_ibfk_1` FOREIGN KEY (`idKategorije`) REFERENCES `kategorije` (`idKategorije`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
