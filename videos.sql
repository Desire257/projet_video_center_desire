-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 27 août 2023 à 20:43
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `video_center_desire_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int NOT NULL,
  `premium_video` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29AA6432A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `title`, `video_link`, `description`, `created_at`, `updated_at`, `user_id`, `premium_video`) VALUES
(1, 'Video sur youtube', 'https://www.youtube.com/embed?v=nnIBXYGdXHk&list=PLl3CtU4THqPawV0hRF8Qqn0RVEHSjYgfy', 'Symfony 6', '2023-03-30 00:00:00', '2023-08-27 17:11:15', 1, 1),
(2, 'Ikiganiro', 'https://www.youtube.com/embed?v=_8C5d9gdFN0', 'Umukubito nikintu kiryoshe', '2023-03-01 00:00:00', '2023-01-01 04:15:11', 1, 1),
(3, 'Une video de mise en place', 'https://www.youtube.com/embed?v=1BbmGc6J7qA', 'Mijn video', '2023-07-14 14:30:05', '2023-08-20 13:56:11', 2, 1),
(4, 'Kigingi summer commedy', 'https://www.youtube.com/embed?v=4KhQwAm97pk', 'umunezero udasanzwee', '2023-08-23 13:48:24', '2023-08-23 13:48:24', 2, 1),
(5, 'Kigingi summer commedy', 'https://www.youtube.com/embed?v=4KhQwAm97pk', 'umunezero udasanzwee', '2023-08-23 13:48:25', '2023-08-23 13:48:25', 1, 1),
(6, 'Andy Bumuntu', 'https://www.youtube.com/embed?v=vDlCyfW0PqU', 'This love is on fire', '2023-08-24 12:44:41', '2023-08-24 12:45:45', 1, 1),
(7, 'Tujane muri Edeni', 'https://www.youtube.com/embed?v=7-6Wav4kucI', 'By Chris Easy', '2023-08-25 09:52:52', '2023-08-25 09:52:52', 1, 1),
(8, 'Inkingi negamiye', 'https://www.youtube.com/embed?v=dmUXtt9Kg3w', 'By Joshua', '2023-08-25 11:03:49', '2023-08-25 11:03:49', 1, 1),
(9, 'Une video de mise en place', 'https://www.youtube.com/embed?v=FYCKzCht3iM', 'Israél MBONYI', '2023-08-25 13:18:14', '2023-08-25 13:18:14', 2, 1),
(10, 'The Ben - Habibi (Official Music Video)', 'https://www.youtube.com/embed?v=Fslmc3EVt-4', 'EastAfrican Music hippop', '2023-08-27 18:25:12', '2023-08-27 18:25:12', 2, 1),
(11, 'React Native in 100 Seconds', 'https://www.youtube.com/embed?v=gvkqT_Uoahw', 'Apprendre react en une seconde', '2023-08-27 18:27:18', '2023-08-27 18:27:18', 3, 1),
(12, 'BEST AFROBEATS 2023|', 'https://www.youtube.com/embed?v=IkPsae61y5Y', 'HOT NAIJA MIX|DJ CISCO BEST OF THE BEST', '2023-08-27 20:55:13', '2023-08-27 20:56:05', 2, 1),
(13, 'AHORA AMBWIR', 'https://www.youtube.com/embed?v=fbNRkNb9mf4', 'Redemption Voice Canada', '2023-08-27 21:04:30', '2023-08-27 21:04:30', 2, 0),
(14, 'Fou de toi', 'https://www.youtube.com/embed?v=jafyUKxvNe8', 'FOU DE TOi Feat Ross Kana& Bruce Melodie (Official Video)', '2023-08-27 21:50:58', '2023-08-27 21:50:58', 2, 0),
(15, 'Nubu Nihondi', 'https://www.youtube.com/embed?v=cbQwhKxGpFA', 'James & Daniella', '2023-08-27 21:56:29', '2023-08-27 21:56:29', 3, 0),
(16, 'Josh Ishimwe (Gakondo Style)', 'https://www.youtube.com/embed?v=bTLb9_wFsUg', 'Reka ndate Imana Data', '2023-08-27 21:57:47', '2023-08-27 21:57:47', 3, 0),
(17, 'Il faudra leur dire francis cabrel', 'https://www.youtube.com/embed?v=KK0ZibmGvNM', 'Chanson classique', '2023-08-27 22:02:22', '2023-08-27 22:02:22', 3, 0),
(18, 'Siffler sur la colline', 'https://www.youtube.com/embed?v=3b63_o9Jzxo', 'Joe Dassin', '2023-08-27 22:05:04', '2023-08-27 22:05:04', 3, 0),
(19, 'Je t\'aimais, je t\'aime, je t\'aimerai (Clip officiel)', 'https://www.youtube.com/embed?v=EVeZzR677DU', 'Francis Cabrel', '2023-08-27 22:05:58', '2023-08-27 22:06:20', 3, 0),
(20, 'We Love Muzik Like', 'https://www.youtube.com/embed?v=ra4VDTrdk68', 'We Love Muzik Like You feat Vichou LOve (Official music video)', '2023-08-27 22:12:54', '2023-08-27 22:12:54', 3, 0),
(21, 'My Energy', 'https://www.youtube.com/embed?v=7BnyD0bbRRI', 'ENERGY - Don Brighter feat Social Mula, Vania Ice & D-one (Official Music Video)', '2023-08-27 22:17:40', '2023-08-27 22:17:40', 1, 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `FK_29AA6432A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
