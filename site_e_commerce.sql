-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 29 Juin 2018 à 14:30
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `site_e_commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'shoes'),
(5, 'tees'),
(6, 'pants'),
(7, 'sweats'),
(8, 'accessory'),
(9, 'robe'),
(10, 'board'),
(11, 'Surf');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `date_creation` datetime NOT NULL,
  `category` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `shipping` double NOT NULL,
  `tva` double NOT NULL,
  `final_price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `size` varchar(25) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `brand` varchar(255) NOT NULL
) ;

--
-- Contenu de la table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `date_creation`, `category`, `weight`, `shipping`, `tva`, `final_price`, `stock`, `size`, `gender`, `brand`) VALUES
(59, 'Jean Dickies', ' Pantalon Dickies: Slim Fit Jeans BL ', 29.5, '2017-02-06 13:51:11', 'PANTS', '5', 6.99, 20, 42.39, 12, 'XS, L, XXL', 'H', 'dickies'),
(60, 'T-shirt Palace', ' Palace Drury Brit T-shirt black ', 21.99, '2017-02-06 13:51:25', 'TEES', '1', 2.99, 20, 29.378, 19, 'S, L, XL', 'H', 'palace'),
(61, 'BOB Helas', 'Bob Hélas Lebob Bucket Hat Brown Twill', 24, '2017-02-02 21:53:43', 'ACCESSORY', '1', 2.99, 20, 31.79, 13, 'S, M, L', 'HF', 'helas'),
(62, 'Nike SB', 'Nike Skateboarding Stephen Janoski', 64.99, '2017-02-02 21:54:52', 'SHOES', '5', 6.99, 20, 84.978, 45, '38, 42, 42.5, 44, 46', 'HF', 'nike'),
(63, 'Sweat Supreme', ' SUPREME Sweatshirt/pull-over à capuche Oversize hip-hop de automne/hiver homme/femme hoodies/hooded manches longues à imprimé ', 36.99, '2017-02-06 13:50:49', 'SWEATS', '5', 6.99, 20, 51.378, 15, 'L', 'HF', 'supreme'),
(66, 'Body 6th June', ' Body de la marque Sixth June de couleur noire. Sa coupe est échancrée et il est équipé de fermeture boutons pressions à l’entrejambe.\r\nComposition: 95% coton, 5% elasthanne ', 35, '2017-02-03 18:21:17', 'ROBE', '1', 2.99, 20, 44.99, 3, 'S, M', 'F', 'sixth june'),
(67, 'Robe 6th June', ' Robe de la marque Sixth June de couleur marron (camel) en molleton avec poche laterale ', 27.64, '2017-02-03 18:21:31', 'ROBE', '1', 2.99, 20, 36.158, 7, 'L', 'F', 'sixth june'),
(68, 'Robe Kaki', 'Robe cintrée kaki Sixth June Femme. Col rond décolleté. Fermeture zip devant. Manches longues.\r\n75% polyester, 25% coton.', 35.79, '2017-02-03 18:25:34', 'ROBE', '1', 2.99, 20, 45.938, 5, 'S, M, L', 'F', 'sixth june'),
(69, 'Doble Taspe', 'La crête Concave Skateboard Decks dotées de : • un érable 7 plis 31.5 "x 7,75 » pont avec un double coup de pied, forme concave • disponible en naturel ou noir The Ridge Concave Skate Deck est une planche de truc standard avec double coup queue et de forme concave. Il est construit d’érable canadien de haute qualité 7 couches avec une rayure de marque pourpre à travers les plis.', 45, '2017-02-04 01:33:06', 'BOARD', '5', 6.99, 20, 60.99, 10, '8.0, 8.2', 'HF', 'doble'),
(70, 'Doble Hotdog', 'La crête Concave Skateboard Decks dotées de : • un érable 7 plis 31.5 "x 7,75 » pont avec un double coup de pied, forme concave • disponible en naturel ou noir The Ridge Concave Skate Deck est une planche de truc standard avec double coup queue et de forme concave. Il est construit d’érable canadien de haute qualité 7 couches avec une rayure de marque pourpre à travers les plis.', 38.5, '2017-02-04 01:35:53', 'BOARD', '5', 6.99, 20, 53.19, 22, '7.5, 7.8, 8.1', 'HF', 'doble'),
(71, 'Doble Chicken', 'La crête Concave Skateboard Decks dotées de : • un érable 7 plis 31.5 "x 7,75 » pont avec un double coup de pied, forme concave • disponible en naturel ou noir The Ridge Concave Skate Deck est une planche de truc standard avec double coup queue et de forme concave. Il est construit d’érable canadien de haute qualité 7 couches avec une rayure de marque pourpre à travers les plis.', 37.65, '2017-02-04 01:36:47', 'BOARD', '5', 6.99, 20, 52.17, 17, '8.0, 8.2', 'HF', 'doble'),
(72, 'Doble Skull', 'La crête Concave Skateboard Decks dotées de : • un érable 7 plis 31.5 "x 7,75 » pont avec un double coup de pied, forme concave • disponible en naturel ou noir The Ridge Concave Skate Deck est une planche de truc standard avec double coup queue et de forme concave. Il est construit d’érable canadien de haute qualité 7 couches avec une rayure de marque pourpre à travers les plis.', 39.75, '2017-02-04 01:37:51', 'BOARD', '5', 6.99, 20, 54.69, 13, '7.75, 8.2, 8.5', 'HF', 'doble'),
(73, 'T-shirt Trasher', ' Tee shirt TRASHER 100% coton ', 17, '2017-02-06 13:48:53', 'TEES', '1', 2.99, 20, 23.39, 2, 'S, XL', 'H', 'trasher'),
(74, 'Jean Vintage', 'Denim stretch résistant\r\nTaille basse', 44, '2017-02-05 18:40:39', 'PANTS', '1', 2.99, 20, 55.79, 8, '32, 36, 38', 'F', 'levis'),
(75, 'T-shirt AntiHero', ' Tee shirt ANTI HERO 100% coton. ', 17.66, '2017-02-06 13:49:09', 'TEES', '1', 2.99, 20, 24.182, 1, 'M', 'H', 'anti hero'),
(76, 'Adidas Puig', 'Cette année la marque de skate française Cliché souffle ses quinze bougies. adidas Skateboarding a profité de l’occasion pour leur dédier un coloris du pro-model de Lucas Puig, skateur-pro chez Cliché. Découvrez cette adidas Skateboarding Lucas Puig Cliché ci-dessous. adidas skate Cliché Skate', 65.22, '2017-02-06 13:39:02', 'SHOES', '5', 6.99, 20, 85.254, 33, '41, 42, 43, 44, 46', 'H', 'adidas'),
(77, 'Adidas 3 Bands', 'Sweat à capuche Adidas 3 bands Full Zip Hood pour Homme.Caractéristiques:- 3 bandes,- Couture triple,- Zip sur toute la longueur : ventilation réglable et meilleur confort,- Capuche avec cordon de serrage,- 2 poches passepoilées,- Logo brodé,- Doublure molleton très douce.Composition: 80% Coton / 20% Polyester', 45, '2017-02-06 13:41:50', 'SWEATS', '1', 2.99, 20, 56.99, 13, 'S, M, L, XL', 'H', 'adidas'),
(78, 'Hélas Polo Cap', 'Casquette Hélas POLO CAP\r\nHélas Connection Collection winter 16 .\r\n\r\n-Casquette homme 3 panneaux .\r\n\r\n-Composition: 100% Nylon .\r\n\r\n-Couleur: blue .', 23, '2017-02-06 13:44:15', 'ACCESSORY', '1', 2.99, 20, 30.59, 7, 'XS, S, M, L', 'H', 'helas'),
(79, 'BOB Hélas Polo', 'Hélas Connection Collection winter 16 .\r\n\r\n-Casquette homme 3 panneaux .\r\n\r\n-Composition: 100% Nylon .\r\n\r\n-Couleur: blue .', 17, '2017-02-06 13:45:11', 'ACCESSORY', '1', 2.99, 20, 23.39, 2, 'S, M', 'H', 'helas'),
(80, 'Helas Cap Basic', 'Hélas Connection Collection winter 16 .\r\n\r\n-Casquette homme 3 panneaux .\r\n\r\n-Composition: 100% Nylon .\r\n\r\n-Couleur: blue .', 16.33, '2017-02-06 13:46:06', 'ACCESSORY', '1', 2.99, 20, 22.586, 1, 'S', 'H', 'helas'),
(81, 'Sweat NikeSB', 'Sweat Nike Skateboarding Team:\r\n\r\n-100% coton\r\n\r\n-Gris', 12.99, '2017-02-06 13:55:43', 'SWEATS', '5', 6.99, 20, 22.578, 1, 'XXL', 'H', 'nike'),
(82, 'Sweat Palace', 'Sweat Palace 100% coton coloris noir logo blanc', 80, '2017-02-06 13:56:59', 'SWEATS', '5', 6.99, 20, 102.99, 7, 'S, M, L', 'H', 'palace'),
(83, 'Sweat Trasher', 'Sweat thrasher gris 100% coton coloris gris', 64.99, '2017-02-06 13:58:18', 'SWEATS', '1', 2.99, 20, 80.978, 13, 'S, M, L', 'H', 'trasher'),
(84, 'Helas Sunshine', 'T-shirt Helas Sunshine coloris blanc 100 % coton', 35, '2017-02-06 13:59:30', 'TEES', '1', 2.99, 20, 44.99, 8, 'S, M, L', 'H', 'helas'),
(85, 'Helas Polo', 'T-shirt Helas polo club coloris blanc 100% coton', 35, '2017-02-06 14:00:28', 'TEES', '1', 2.99, 20, 44.99, 15, 'S, M, L, XL', 'H', 'helas'),
(86, 'Helas Umbrella', 'T-shirt Helas umbrella coloris gris 100% coton', 35, '2017-02-06 14:01:24', 'TEES', '1', 2.99, 20, 44.99, 4, 'M, L', 'H', 'helas'),
(87, 'Trasher Long', 'T-shirt manches longues trasher coloris noir 100% coton', 22, '2017-02-06 14:02:17', 'TEES', '1', 2.99, 20, 29.39, 7, 'S', 'H', 'trasher'),
(88, 'Nike SB Koston', ' Nike SB model pro Eric Koston  ', 46.22, '2017-02-06 17:01:07', 'SHOES', '5', 6.99, 20, 62.454, 9, '41, 43, 44, 46', 'H', 'nike'),
(90, 'NB Numeric', 'New Balance Numeric Brighton 344  Skate Shoes', 77, '2017-02-07 16:18:14', 'SHOES', '5', 6.99, 20, 99.39, 8, '40, 42, 43, 45', 'H', 'new balance'),
(91, 'Sweat Dime', 'Classic Dime coloris gris', 44.98, '2017-02-07 16:20:41', 'SWEATS', '5', 6.99, 20, 60.966, 20, 'S, M, L, XL', 'H', 'dime');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'jazz', 'jaz@yahoo.fr', 'jazzyjazz'),
(5, 'a', 'a@a.a', 'a'),
(6, 'J', 'JJJ@JJJ.JJ', 'JJJ'),
(7, 'J', 'JJJ@JJJ.JJ', 'JJJ'),
(8, 'igo', 'i@gm.fr', 'mdr');

-- --------------------------------------------------------

--
-- Structure de la table `weights`
--

CREATE TABLE `weights` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `price` double NOT NULL
) ;

--
-- Contenu de la table `weights`
--

INSERT INTO `weights` (`id`, `value`, `price`) VALUES
(1, '1', 2.99),
(2, '5', 6.99),
(3, '10', 12.99),
(4, '15', 22.99),
(5, '30', 30.75);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
