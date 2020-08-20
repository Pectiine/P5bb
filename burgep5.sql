-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 19 août 2020 à 10:23
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `burgep5`
--

-- --------------------------------------------------------

--
-- Structure de la table `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `app_users`
--

INSERT INTO `app_users` (`id`, `username`, `password`, `email`) VALUES
(1, 'Sandra', '$2y$12$5UVdJgPYGSbnWwQ08fjNJ.tulhOTiniJ3WoNyhFkq/g0zGgfSAOhu', '');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `name`) VALUES
(1, 'local');

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `property_id`, `filename`) VALUES
(7, 1, '5f359e01be997735987913.jpg'),
(10, 3, '5f35b56439e3c577557126.jpg'),
(11, 3, '5f35b56fcbd09529721259.jpg'),
(14, 3, '5f35b8cfc637d210560611.jpg'),
(16, 4, '5f3bfd7b0f5fa152250415.jpg'),
(17, 4, '5f3bfd9303ec7794856379.jpg'),
(18, 5, '5f3c0137bac9c474174891.jpg'),
(19, 5, '5f3c014c4cae6973779588.jpg'),
(20, 5, '5f3c01645bd86320363802.jpg'),
(21, 6, '5f3c04364bd43965438036.jpg'),
(22, 6, '5f3c0c9b36c40976576837.jpg'),
(28, 7, '5f3c10e6c6f77477265843.jpg'),
(30, 7, '5f3c11388bcfd038667145.jpg'),
(32, 7, '5f3c116e97427011639179.jpg'),
(33, 8, '5f3c13b2ad006294221120.jpg'),
(35, 8, '5f3c140875f21466081753.jpg'),
(36, 9, '5f3c18aabebb3008283460.jpg'),
(37, 9, '5f3c18be86c60673370650.jpg'),
(38, 9, '5f3c18d325b9c489542586.jpg'),
(39, 1, '5f3cd28c63ab9175456002.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `type` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `slug`, `title`, `description`, `price`, `city`, `address`, `postal_code`, `created_at`, `updated_at`, `lat`, `lng`, `type`) VALUES
(1, 'burger-de-papa', 'Burger de papa', 'Les Burgers de Papa est une enseigne de restauration rapide spécialisée dans le burger gourmet. Créé en 2013 à Lyon par Yves HECKER, ce réseau compte à ce jour 30 établissements à travers la France. Produits de qualité, qualité de service et rigueur font des Burgers de Papa un acteur majeur du segment du burger', 16, 'Thoiry', 'Centre Commercial Val Thoiry, Thoiry, Auvergne-Rhône-Alpes, France', '01710', '2020-08-08 16:58:19', NULL, 46.2287, 5.99427, '0'),
(3, 'five-guys', 'Five guys', 'Devenu un incontournable, Five Guys propose de personnaliser vos hamburgers ainsi que vos hots dogs. Obligation de terminer par un de leur excellent et gigantesque Milk shake ( notamment cacahuète). En plus d\'avoir une machine de boisson à volonté avec des saveurs dignes de grands vins comme coca cerise-vanille ils y font d\'excellentes frites.\r\n\r\nLe petit + \r\nFive Guys du centre commercial la Toison d\'or dispose d\'une grande terrasse.\r\n\r\nLe petit - \r\nCela reste une grand chaîne', 20, 'Dijon', 'Route de Langres, Dijon, Bourgogne-Franche-Comté, France', '21000', '2020-08-13 21:48:58', NULL, 47.3688, 5.04788, '0'),
(4, 'a-la-friterie-des-chtis', 'À la friterie des Ch’tis', 'À la friterie des Ch’tis l\'endroit parfait pour retrouver des vrais frites comme dans le nord!\r\nChaleureux et familiale ainsi que des prix tout à fait abordable. Les burgers sont très corrects même si on y\'va plutôt pour la  les frites. \r\nIl est également possible de s\'y rendre directement avec son saladier si si! \r\n\r\n\r\nLes petits + \r\n\r\nTrès bonnes frites!\r\nFacile de s\'y rendre et bonne humeur \r\n\r\nLes petits moins -\r\n\r\nBurger pas 100% maison \r\nUn peu d\'attente et horaire changeant', 13, 'Ferney-Voltaire', '67 Rue de Versoix, Ferney-Voltaire, Auvergne-Rhône-Alpes, France', '01210', '2020-08-18 16:10:34', NULL, 46.2579, 6.11431, '1'),
(5, 'le-rituel-burger', 'Le Rituel Burger', 'Le Rituel Burger est vraiment l\'endroit parfait sur Annecy pour manger un vrai hamburger avec de vrais frites maisons. \r\nA 2 pas du lac, c\'est un lieu décalé ou il est agréable d\'y manger ou juste prendre un verre.  On vous demande la cuisson du steak ( signe que c\'est de la bonne qualité de viande), les frites ressemblent à celles de nos mères et le dessert est également maison ( un tiramisu glacé ce jour là).\r\nBref il est rare de voir un restaurant proposé le hamburger 100% maison ainsi que les frites très souvent c\'est soit l\'un soit l\'autre. \r\nNoté 4,6 sur google aucune hésitation à s\'y rendre.  \r\n\r\n\r\nLe petit +\r\n\r\nChoix de la cuisson du steak\r\nLe lac et sa piste cyclable \r\n\r\nLe petit moins - \r\n\r\nÉloigné du centre ville d\'Annecy', 15, 'Sevrier', '524 Route d\'Albertville, Sevrier, Auvergne-Rhône-Alpes, France', '74320', '2020-08-18 16:26:31', NULL, 45.8663, 6.14006, '1'),
(6, 'o-chalet-burgers-et-crepes', 'Ô Chalet Burgers et Crêpes', 'Morzine est une station de ski dynamique située en Haute Savoie pas loin du superbe Lac De Montriond . \r\nÔ Chalet Burgers et Crêpes propose une carte peut être trop diversifiée pour que tout soit frais.  \r\nLe hamburger est bon les frites sont bonnes mais surgelées. Pas de formule menu . \r\n\r\n\r\nle petit +\r\n\r\nCadre jeune', 15, 'Morzine', '77 a Route de la Combe à Zore, Morzine, Auvergne-Rhône-Alpes, France', '74110', '2020-08-18 16:39:18', NULL, 46.1826, 6.69872, '1'),
(7, 'bordas-crepes-burger', 'Bordas Crêpes & Burger', 'Situé dans le jura ce petit chalet est l\'endroit parfait pour déguster un bon hamburger et de bonnes crêpes!\r\nLes propriétaires sont très sympas et l\'ambiance est cosie. Les hamburgers sont excellents mais les frites restent classiques.\r\n\r\n\r\nLe petit + \r\n\r\nLa vue\r\n\r\nLe petit moins - \r\n\r\nIl faut faire un peu de route', 16, 'Chézery-Forens', 'Chézery-Forens, Auvergne-Rhône-Alpes, France', '01410', '2020-08-18 17:29:00', NULL, 46.2216, 5.86637, '1'),
(8, 'big-fernand', 'Big fernand', 'Big fernand  est une franchise d\'hamburger français. Celui ou nous sommes allé est à Lyon à 2 pas du centre commercial Lyon part dieu. \r\nIl faut s\'y rendre à l\'avance car la queue est longue à l\'heure de midi. Normal, leur burger sont vraiment bon avec des saveurs délicates et moins classiques.\r\n\r\n\r\nLe petit +\r\n\r\nBurgers moins classiques \r\n\r\nLe petit - \r\n\r\nS\'y rendre tôt', 17, 'Lyon 3e Arrondissement', '172 Cours Lafayette, Lyon 3e Arrondissement, Auvergne-Rhône-Alpes, France', '69003', '2020-08-18 17:45:22', NULL, 45.7636, 4.85606, '0'),
(9, 'le-cosy-cook', 'Le Cosy Cook', 'Le Cosy cook est un incontournable à Bourg en Bresse. Hamburger incroyables et frite à volonté . \r\nAmbiance étudiante et cosy !\r\n\r\n\r\nLe petit +\r\n\r\nFrite à volonté\r\n\r\nLe petit -\r\n\r\nIl faut avoir faim', 18, 'Bourg-en-Bresse', '27 Boulevard Paul Bert, Bourg-en-Bresse, Auvergne-Rhône-Alpes, France', '01000', '2020-08-18 18:06:34', NULL, 46.2012, 5.2225, '1');

-- --------------------------------------------------------

--
-- Structure de la table `property_option`
--

CREATE TABLE `property_option` (
  `property_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2502824F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_C2502824E7927C74` (`email`);

--
-- Index pour la table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_16DB4F89549213EC` (`property_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDE989D9B62` (`slug`);

--
-- Index pour la table `property_option`
--
ALTER TABLE `property_option`
  ADD PRIMARY KEY (`property_id`,`option_id`),
  ADD KEY `IDX_24F16FCC549213EC` (`property_id`),
  ADD KEY `IDX_24F16FCCA7C41D6F` (`option_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `option`
--
ALTER TABLE `option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `FK_16DB4F89549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`);

--
-- Contraintes pour la table `property_option`
--
ALTER TABLE `property_option`
  ADD CONSTRAINT `FK_24F16FCC549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_24F16FCCA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
