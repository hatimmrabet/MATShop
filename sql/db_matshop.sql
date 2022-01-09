-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 09 jan. 2022 à 18:13
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_matshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_categorie_cat`
--

DROP TABLE IF EXISTS `t_categorie_cat`;
CREATE TABLE IF NOT EXISTS `t_categorie_cat` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_intitule` varchar(100) NOT NULL,
  `cat_date` date DEFAULT NULL,
  `cat_autorisation` char(1) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_categorie_cat`
--

INSERT INTO `t_categorie_cat` (`cat_id`, `cat_intitule`, `cat_date`, `cat_autorisation`) VALUES
(1, 'NOUVEAUTÉS', '2019-10-26', 'G'),
(2, 'PROMOTIONS', '2019-10-26', 'G'),
(3, 'Vêtements', '2019-10-26', 'R'),
(4, 'ULTRAS LOS MATADORES', '2019-10-26', 'R'),
(5, 'ULTRAS SIEMPRE PALOMA', '2019-10-26', 'R'),
(6, 'GOODIES', '2019-10-26', 'R'),
(7, 'Couverture', '2019-10-26', 'G');

-- --------------------------------------------------------

--
-- Structure de la table `t_compte_cpt`
--

DROP TABLE IF EXISTS `t_compte_cpt`;
CREATE TABLE IF NOT EXISTS `t_compte_cpt` (
  `cpt_pseudo` varchar(60) NOT NULL,
  `cpt_psswd` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cpt_pseudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_compte_cpt`
--

INSERT INTO `t_compte_cpt` (`cpt_pseudo`, `cpt_psswd`) VALUES
('achouak', '827ccb0eea8a706c4c34a16891f84e7b'),
('anass_aitabdelkrim', '827ccb0eea8a706c4c34a16891f84e7b'),
('ayoub', '827ccb0eea8a706c4c34a16891f84e7b'),
('gestionnaire1', '21fdb730e736b3577ce0961a604e2b6b'),
('haitam_mrabet', '38bcec648a83b7c63eb515771a41ec2c'),
('hatim', '827ccb0eea8a706c4c34a16891f84e7b'),
('iheb_chemkhi', '1332427397e32f2888799456eb1cee34'),
('khalid_ahannach', '827ccb0eea8a706c4c34a16891f84e7b'),
('loic.catrou', '55587a910882016321201e6ebbc9f595'),
('ouma_ork', '8e7aef75dad24742365609c64928574c'),
('root', 'e10adc3949ba59abbe56e057f20f883e'),
('thomas_larue', '8766814f87d4790bd6c5f52d12b98da6'),
('yassin_lahmidi', '827ccb0eea8a706c4c34a16891f84e7b'),
('youssef', '827ccb0eea8a706c4c34a16891f84e7b'),
('zakaria_chelaoui', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Structure de la table `t_information_inf`
--

DROP TABLE IF EXISTS `t_information_inf`;
CREATE TABLE IF NOT EXISTS `t_information_inf` (
  `inf_id` int(11) NOT NULL AUTO_INCREMENT,
  `inf_texte` varchar(200) DEFAULT NULL,
  `inf_date_ajout` date DEFAULT NULL,
  `inf_etat` char(1) DEFAULT 'C',
  `cpt_pseudo` varchar(60) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inf_id`),
  KEY `cpt_pseudo` (`cpt_pseudo`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_information_inf`
--

INSERT INTO `t_information_inf` (`inf_id`, `inf_texte`, `inf_date_ajout`, `inf_etat`, `cpt_pseudo`, `cat_id`) VALUES
(10, 'Maillot extérieur à 200 dh seulement', '2019-10-28', 'L', 'root', 3),
(11, 'T-shirt domicile à 250dh', '2019-10-28', 'L', 'root', 3),
(12, 'La nouvelle collection de casquette SIEMPRE PALOMA est DISPONIBLE\r\nà 50dh seulement', '2019-10-28', 'L', 'root', 5),
(16, 'Les tenues de la saison 2020/2021 est disponible avec 60% de réduction', '2019-10-28', 'L', 'gestionnaire1', 2),
(17, 'Le nouveau produit de los matadores est disponible	', '2019-10-28', 'L', 'gestionnaire1', 4),
(18, 'La nouvelle musique de los matadores est disponible dur Spotify', '2019-10-28', 'L', 'gestionnaire1', 4),
(22, 'Le stylo de MAT à 20 dh', '2019-10-28', 'L', 'gestionnaire1', 6),
(26, 'Le Nouveau tenu du MAT domicile est à 200 dh', '2019-10-28', 'L', 'root', 1),
(42, 'Le nouveau produit de siempre paloma est disponible', '2019-12-15', 'L', 'youssef', 5),
(43, 'Nouveau MUG du MAT', '2019-12-15', 'L', 'youssef', 6);

-- --------------------------------------------------------

--
-- Structure de la table `t_liste_lis`
--

DROP TABLE IF EXISTS `t_liste_lis`;
CREATE TABLE IF NOT EXISTS `t_liste_lis` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`cat_id`,`url_id`),
  KEY `url_id` (`url_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Déchargement des données de la table `t_liste_lis`
--

INSERT INTO `t_liste_lis` (`cat_id`, `url_id`) VALUES
(6, 1),
(1, 2),
(6, 2),
(6, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `t_news_new`
--

DROP TABLE IF EXISTS `t_news_new`;
CREATE TABLE IF NOT EXISTS `t_news_new` (
  `new_num` int(11) NOT NULL AUTO_INCREMENT,
  `new_titre` varchar(30) NOT NULL,
  `new_texte` varchar(200) NOT NULL,
  `new_date` date DEFAULT NULL,
  `new_etat` char(1) DEFAULT 'C',
  `cpt_pseudo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`new_num`),
  KEY `cpt_pseudo` (`cpt_pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_news_new`
--

INSERT INTO `t_news_new` (`new_num`, `new_titre`, `new_texte`, `new_date`, `new_etat`, `cpt_pseudo`) VALUES
(1, 'Fermeture exceptionnelle :', 'Notre Boutique va fermer aujourd\'hui à midi ', '2019-10-30', 'C', 'root'),
(2, 'Ouverture exceptionnelle :', 'Notre Boutique va ouvrir ses portes le dimanche à partir de 12h ', '2019-11-30', 'L', 'root'),
(3, 'Recherche agents :', 'Notre Boutique recherche des agents de remplacement, Deposez vos CV à l\'accueil ', '2019-12-14', 'L', 'root'),
(10, 'Carte Fidélité :', 'Vous Pouvez obtenir votre carte de fidélité dés maintenant. RDV à l\'accueil.', '2019-12-05', 'L', 'hatim');

-- --------------------------------------------------------

--
-- Structure de la table `t_profil_pfl`
--

DROP TABLE IF EXISTS `t_profil_pfl`;
CREATE TABLE IF NOT EXISTS `t_profil_pfl` (
  `pfl_nom` varchar(60) NOT NULL,
  `pfl_prenom` varchar(60) NOT NULL,
  `pfl_mail` varchar(60) NOT NULL,
  `pfl_statut` char(1) DEFAULT 'R',
  `pfl_validite` char(1) DEFAULT 'D',
  `cpt_pseudo` varchar(60) NOT NULL,
  `pfl_date` date NOT NULL,
  PRIMARY KEY (`cpt_pseudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_profil_pfl`
--

INSERT INTO `t_profil_pfl` (`pfl_nom`, `pfl_prenom`, `pfl_mail`, `pfl_statut`, `pfl_validite`, `cpt_pseudo`, `pfl_date`) VALUES
('Lafhal', 'Achouak', 'achouak@gmail.com', 'R', 'A', 'achouak', '2021-12-22'),
('AIT ABDELKRIM', 'Anass', 'anas@univ-brest.fr', 'R', 'D', 'anass_aitabdelkrim', '2019-12-07'),
('ayoub', 'lakhal', 'ayoub.tet@mat.ma', 'R', 'D', 'ayoub', '2019-12-07'),
('MARC', 'Valérie', 'vmarc@gmail.com', 'G', 'A', 'gestionnaire1', '2019-10-25'),
('M\'RABET', 'Haitam', 'haitam_mrabet@gmail.com', 'R', 'D', 'haitam_mrabet', '2019-10-25'),
('M\'RABET EL KHOMSSI', 'Hatim', 'mrabet.hatim2018@gmail.com', 'G', 'A', 'hatim', '2019-10-25'),
('CHEMKHI', 'Iheb', 'iheb_chemkhi@gmail.com', 'R', 'A', 'iheb_chemkhi', '2019-10-25'),
('AHANNACH', 'Khalid', 'khalid02@gmail.com', 'R', 'D', 'khalid_ahannach', '2019-10-25'),
('Catrou', 'Loic', 'loic@gmail.com', 'R', 'D', 'loic.catrou', '2019-11-20'),
('OURKIA', 'Oumaima', 'ouma_ork@gmail.com', 'R', 'D', 'ouma_ork', '2019-10-25'),
('root', 'admin', 'admin@root.com', 'G', 'A', 'root', '2019-10-25'),
('LARUE', 'Thomas', 'thomas_larue@gmail.com', 'R', 'D', 'thomas_larue', '2019-10-25'),
('Lahmidi', 'Yassine', 'yassin_lahmidi@gmail.com', 'R', 'D', 'yassin_lahmidi', '2019-12-07'),
('m\'rabet', 'youssef', 'yousef@gmail.com', 'R', 'A', 'youssef', '2019-11-22'),
('CHELLAOUI', 'Zakaria', 'zakaria@enib-brest.fr', 'R', 'D', 'zakaria_chelaoui', '2019-12-07');

-- --------------------------------------------------------

--
-- Structure de la table `t_url_url`
--

DROP TABLE IF EXISTS `t_url_url`;
CREATE TABLE IF NOT EXISTS `t_url_url` (
  `url_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_nom` varchar(90) NOT NULL,
  `url_chaine` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_url_url`
--

INSERT INTO `t_url_url` (`url_id`, `url_nom`, `url_chaine`) VALUES
(1, 'Samsung S10', 'https://www.samsung.com/fr/smartphones/galaxy-s10/'),
(2, 'Galaxy S10+', 'https://www.samsung.com/fr/smartphones/galaxy-s10+/'),
(3, 'Galaxy S8+', 'https://www.samsung.com/fr/smartphones/galaxy-s8/'),
(4, 'Réfrigérateur multi-portes', 'https://www.samsung.com/fr/refrigerators/multi-door-rfg23uebp1/');

-- --------------------------------------------------------

--
-- Structure de la table `t_visuel_vis`
--

DROP TABLE IF EXISTS `t_visuel_vis`;
CREATE TABLE IF NOT EXISTS `t_visuel_vis` (
  `vis_id` int(11) NOT NULL AUTO_INCREMENT,
  `vis_descriptif` varchar(100) DEFAULT NULL,
  `vis_nom_fichier` varchar(256) NOT NULL,
  `vis_date_ajout` date DEFAULT NULL,
  `vis_visibilite` char(1) NOT NULL,
  `cpt_pseudo` varchar(60) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`vis_id`),
  KEY `cpt_pseudo` (`cpt_pseudo`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_visuel_vis`
--

INSERT INTO `t_visuel_vis` (`vis_id`, `vis_descriptif`, `vis_nom_fichier`, `vis_date_ajout`, `vis_visibilite`, `cpt_pseudo`, `cat_id`) VALUES
(1, 'ANIMO CAPITANO', 'capitano.png', '2019-10-30', 'L', 'hatim', 7),
(4, 'Couverture MAT', 'cover2.jpg', '2019-10-28', 'L', 'hatim', 7),
(5, 'SIEMPRE PALOMA', 'cover_paloma.jpg', '2019-11-29', 'L', 'hatim', 5),
(7, 'LOS MATADORES', 'cover_matadores.png', '2019-11-29', 'L', 'hatim', 4),
(11, 'CENTENARIO', 'cover_100.jpg', '2019-12-15', 'L', 'youssef', 7),
(12, 'Cover Matadores', 'matadores2.jpg', '2022-01-09', 'L', 'achouak', 4),
(17, 'Maillot Domicile 2021/2022', '266318947_388703669679206_7314837168215198671_n.jpg', '2022-01-09', 'L', 'achouak', 3),
(18, 'Maillot Visiteur 2021/2022', '269979803_398366992046207_1603787523627405745_n.jpg', '2022-01-09', 'L', 'achouak', 3),
(19, 'Maillot d\'entrainement 2021/2022', '267779798_390762856139954_6157402867068614100_n.jpg', '2022-01-09', 'L', 'achouak', 3),
(21, 'Deplacement los matadores', '120442616_3553103184815649_6250132574053534232_n.jpg', '2022-01-09', 'L', 'achouak', 4),
(23, 'Produit Los Matadores 2021', '158272790_3962128667246430_5102223282648868536_n.jpg', '2022-01-09', 'C', 'achouak', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_information_inf`
--
ALTER TABLE `t_information_inf`
  ADD CONSTRAINT `t_information_inf_ibfk_1` FOREIGN KEY (`cpt_pseudo`) REFERENCES `t_compte_cpt` (`cpt_pseudo`),
  ADD CONSTRAINT `t_information_inf_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `t_categorie_cat` (`cat_id`);

--
-- Contraintes pour la table `t_liste_lis`
--
ALTER TABLE `t_liste_lis`
  ADD CONSTRAINT `t_liste_lis_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `t_categorie_cat` (`cat_id`),
  ADD CONSTRAINT `t_liste_lis_ibfk_2` FOREIGN KEY (`url_id`) REFERENCES `t_url_url` (`url_id`);

--
-- Contraintes pour la table `t_news_new`
--
ALTER TABLE `t_news_new`
  ADD CONSTRAINT `t_news_new_ibfk_1` FOREIGN KEY (`cpt_pseudo`) REFERENCES `t_compte_cpt` (`cpt_pseudo`);

--
-- Contraintes pour la table `t_profil_pfl`
--
ALTER TABLE `t_profil_pfl`
  ADD CONSTRAINT `t_profil_pfl_ibfk_1` FOREIGN KEY (`cpt_pseudo`) REFERENCES `t_compte_cpt` (`cpt_pseudo`);

--
-- Contraintes pour la table `t_visuel_vis`
--
ALTER TABLE `t_visuel_vis`
  ADD CONSTRAINT `t_visuel_vis_ibfk_1` FOREIGN KEY (`cpt_pseudo`) REFERENCES `t_compte_cpt` (`cpt_pseudo`),
  ADD CONSTRAINT `t_visuel_vis_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `t_categorie_cat` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
