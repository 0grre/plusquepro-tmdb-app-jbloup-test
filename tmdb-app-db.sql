-- -------------------------------------------------------------
-- TablePlus 6.1.2(568)
--
-- https://tableplus.com/
--
-- Database: tmdb-app-db
-- Generation Time: 2024-07-17 17:28:38.4370
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backdrop_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1280075 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `genre_movie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` bigint unsigned NOT NULL,
  `genre_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_movie_movie_id_foreign` (`movie_id`),
  KEY `genre_movie_genre_id_foreign` (`genre_id`),
  CONSTRAINT `genre_movie_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genre_movie_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movie_production_company` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` bigint unsigned NOT NULL,
  `production_company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_production_company_movie_id_foreign` (`movie_id`),
  KEY `movie_production_company_production_company_id_foreign` (`production_company_id`),
  CONSTRAINT `movie_production_company_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movie_production_company_production_company_id_foreign` FOREIGN KEY (`production_company_id`) REFERENCES `production_companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movie_production_country` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` bigint unsigned NOT NULL,
  `production_country_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_production_country_movie_id_foreign` (`movie_id`),
  KEY `movie_production_country_production_country_id_foreign` (`production_country_id`),
  CONSTRAINT `movie_production_country_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movie_production_country_production_country_id_foreign` FOREIGN KEY (`production_country_id`) REFERENCES `production_countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movie_spoken_language` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` bigint unsigned NOT NULL,
  `spoken_language_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_spoken_language_movie_id_foreign` (`movie_id`),
  KEY `movie_spoken_language_spoken_language_id_foreign` (`spoken_language_id`),
  CONSTRAINT `movie_spoken_language_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movie_spoken_language_spoken_language_id_foreign` FOREIGN KEY (`spoken_language_id`) REFERENCES `spoken_languages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backdrop_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adult` tinyint(1) NOT NULL DEFAULT '0',
  `original_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popularity` double(8,2) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `video` tinyint(1) NOT NULL DEFAULT '0',
  `vote_average` double(8,2) DEFAULT NULL,
  `vote_count` int DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imdb_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revenue` int DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_collection_id_foreign` (`collection_id`),
  CONSTRAINT `movies_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1226579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `production_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `production_countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `iso_3166_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `spoken_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_639_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `collections` (`id`, `name`, `poster_path`, `backdrop_path`, `created_at`, `updated_at`) VALUES
(8945, 'Mad Max Collection', '/9U9QmbCDIBhqDShuIxOiS9gjKYz.jpg', '/fhv3dWOuzeW9eXOSlr8MCHwo24t.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(85861, 'Beverly Hills Cop Collection', '/whjkHIzJ0Kiei6V7z5NaIyvFKQm.jpg', '/k0DEUZqbB9bVcm2NsVaMkdd4Vs8.jpg', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(86066, 'Despicable Me Collection', '/95prV91f4DxkBnLU43YjLbU1m3q.jpg', '/37xamYKRUGCRux532lKcZdVGYuR.jpg', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(173710, 'Planet of the Apes (Reboot) Collection', '/afGkMC4HF0YtXYNkyfCgTDLFe6m.jpg', '/2ZkvqfOJUCINozB00wmYuGJQW81.jpg', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(448150, 'Deadpool Collection', '/30c5jO7YEXuF8KiWXLg9m28GWDA.jpg', '/hBQOWY8qWXJVFAc8yLTh1teIu43.jpg', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(466463, 'Descendants Collection', '/dw02BxDYnmqW4h0t0qA0T3hd5MZ.jpg', '/bPLL28xj5MqCBYiaixG4yMYKkpe.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(535313, 'Godzilla Collection', '/inNN466SKHNjbGmpfhfsaPQNleS.jpg', '/oboBn4VYB79uDxnyIri0Nt3U3N2.jpg', '2024-07-17 14:10:10', '2024-07-17 14:10:10'),
(726871, 'Dune Collection', '/c1AiZTXyyzmPOlTLSubp7CEeYj.jpg', '/ygVSGv86R0BTOKJIb8RQ1sFxs4q.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(950289, 'X Collection', '/1a828eAhYwYw1bcLvjotDCSTnqI.jpg', '/HhDOcUwm8ghreO9s50YJWhBJqc.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(1022790, 'Inside Out Collection', '/Apr19lGxP7gm6y2HQX0kqOXTtqC.jpg', '/7U2m2dMSIfHx2gWXKq78Xj1weuH.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(1062948, 'Twister Collection', '/9dIAsn4N1t9bQJyNo5Cj8xmflyf.jpg', '/bnb3pWSDihCCeZ0wGlFBbTScyZv.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(1126640, 'Horizon: An American Saga Collection', '/qEATR87Ma5sgwE3XGA7bIREgTrw.jpg', '/wwqHma9UrYCTzspanzKwlxKcOwt.jpg', '2024-07-17 14:10:11', '2024-07-17 14:10:11'),
(1178688, 'Justice League (Tomorrowverse) Collection', '/wqU63rtzsgw1wfZ4BJcReEDP54n.jpg', NULL, '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(1280074, 'Kong Collection', '/lhyEUeOihbKf7ll8RCIE5CHTie3.jpg', '/qHY4ZMIDSmElhiykjhh40Q5qMJl.jpg', '2024-07-16 20:42:10', '2024-07-16 20:42:10');

INSERT INTO `genre_movie` (`id`, `movie_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(4, 508883, 16, NULL, NULL),
(5, 508883, 12, NULL, NULL),
(6, 508883, 14, NULL, NULL),
(11, 533535, 878, NULL, NULL),
(12, 533535, 28, NULL, NULL),
(13, 533535, 35, NULL, NULL),
(17, 653346, 878, NULL, NULL),
(18, 653346, 12, NULL, NULL),
(19, 653346, 28, NULL, NULL),
(20, 693134, 878, NULL, NULL),
(21, 693134, 12, NULL, NULL),
(25, 748783, 16, NULL, NULL),
(26, 748783, 35, NULL, NULL),
(27, 748783, 10751, NULL, NULL),
(28, 748783, 12, NULL, NULL),
(32, 786892, 28, NULL, NULL),
(33, 786892, 12, NULL, NULL),
(34, 786892, 878, NULL, NULL),
(35, 823464, 878, NULL, NULL),
(36, 823464, 28, NULL, NULL),
(37, 823464, 12, NULL, NULL),
(41, 956842, 35, NULL, NULL),
(42, 956842, 10749, NULL, NULL),
(43, 974262, 14, NULL, NULL),
(44, 974262, 12, NULL, NULL),
(45, 974262, 10751, NULL, NULL),
(46, 974262, 35, NULL, NULL),
(47, 1008409, 80, NULL, NULL),
(48, 1008409, 18, NULL, NULL),
(49, 1022789, 16, NULL, NULL),
(50, 1022789, 10751, NULL, NULL),
(51, 1022789, 12, NULL, NULL),
(52, 1022789, 35, NULL, NULL),
(53, 1022789, 18, NULL, NULL),
(54, 1023922, 27, NULL, NULL),
(55, 1023922, 80, NULL, NULL),
(56, 1023922, 9648, NULL, NULL),
(57, 1086747, 14, NULL, NULL),
(58, 1086747, 9648, NULL, NULL),
(59, 1086747, 53, NULL, NULL),
(60, 1086747, 27, NULL, NULL),
(64, 280180, 28, NULL, NULL),
(65, 280180, 35, NULL, NULL),
(66, 280180, 80, NULL, NULL),
(67, 519182, 16, NULL, NULL),
(68, 519182, 10751, NULL, NULL),
(69, 519182, 35, NULL, NULL),
(70, 519182, 28, NULL, NULL),
(71, 746036, 28, NULL, NULL),
(72, 746036, 35, NULL, NULL),
(73, 932086, 37, NULL, NULL),
(74, 932086, 18, NULL, NULL),
(75, 1032425, 18, NULL, NULL),
(76, 1032425, 37, NULL, NULL),
(77, 1039868, 53, NULL, NULL),
(78, 1039868, 9648, NULL, NULL),
(79, 1039868, 18, NULL, NULL),
(80, 1066262, 28, NULL, NULL),
(81, 1066262, 18, NULL, NULL),
(82, 1209290, 16, NULL, NULL),
(83, 1209290, 878, NULL, NULL),
(84, 1209290, 28, NULL, NULL),
(85, 1226578, 80, NULL, NULL),
(86, 1226578, 27, NULL, NULL),
(87, 1226578, 53, NULL, NULL),
(88, 718821, 28, NULL, NULL),
(89, 718821, 12, NULL, NULL),
(90, 718821, 53, NULL, NULL),
(91, 639720, 35, NULL, NULL),
(92, 639720, 14, NULL, NULL),
(93, 639720, 10751, NULL, NULL),
(94, 762441, 27, NULL, NULL),
(95, 762441, 878, NULL, NULL),
(96, 762441, 53, NULL, NULL),
(97, 929590, 10752, NULL, NULL),
(98, 929590, 28, NULL, NULL),
(99, 929590, 18, NULL, NULL);

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(12, 'Adventure', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(14, 'Fantasy', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(16, 'Animation', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(18, 'Drama', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(27, 'Horror', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(28, 'Action', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(35, 'Comedy', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(36, 'History', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(37, 'Western', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(53, 'Thriller', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(80, 'Crime', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(99, 'Documentary', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(878, 'Science Fiction', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(9648, 'Mystery', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10402, 'Music', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10749, 'Romance', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10751, 'Family', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10752, 'War', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10770, 'TV Movie', '2024-07-16 20:42:09', '2024-07-16 20:42:09');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_07_15_213953_create_sessions_table', 1),
(7, '2024_07_15_223214_create_collections_table', 1),
(8, '2024_07_15_223215_create_movies_table', 1),
(9, '2024_07_15_223217_create_genres_table', 1),
(10, '2024_07_15_224048_create_production_companies_table', 1),
(11, '2024_07_15_224352_create_production_countries_table', 1),
(12, '2024_07_15_224449_create_spoken_languages_table', 1);

INSERT INTO `movie_production_company` (`id`, `movie_id`, `production_company_id`, `created_at`, `updated_at`) VALUES
(86, 280180, 1, NULL, NULL),
(281, 508883, 2, NULL, NULL),
(284, 519182, 1, NULL, NULL),
(290, 533535, 1, NULL, NULL),
(294, 639720, 1, NULL, NULL),
(298, 653346, 1, NULL, NULL),
(300, 693134, 1, NULL, NULL),
(306, 718821, 1, NULL, NULL),
(310, 746036, 1, NULL, NULL),
(318, 748783, 3, NULL, NULL),
(319, 748783, 4, NULL, NULL),
(320, 748783, 1, NULL, NULL),
(324, 762441, 1, NULL, NULL),
(328, 786892, 5, NULL, NULL),
(329, 786892, 1, NULL, NULL),
(331, 823464, 1, NULL, NULL),
(335, 929590, 6, NULL, NULL),
(336, 929590, 4, NULL, NULL),
(337, 929590, 1, NULL, NULL),
(339, 932086, 1, NULL, NULL),
(343, 956842, 1, NULL, NULL),
(348, 974262, 1, NULL, NULL),
(352, 1008409, 1, NULL, NULL),
(355, 1022789, 1, NULL, NULL),
(359, 1023922, 1, NULL, NULL),
(363, 1032425, 8, NULL, NULL),
(364, 1032425, 4, NULL, NULL),
(365, 1032425, 1, NULL, NULL),
(367, 1039868, 9, NULL, NULL),
(374, 1066262, 5, NULL, NULL),
(375, 1066262, 10, NULL, NULL),
(378, 1086747, 1, NULL, NULL),
(381, 1209290, 1, NULL, NULL),
(387, 1226578, 7, NULL, NULL),
(388, 1226578, 1, NULL, NULL);

INSERT INTO `movie_spoken_language` (`id`, `movie_id`, `spoken_language_id`, `created_at`, `updated_at`) VALUES
(2, 508883, 2, NULL, NULL),
(4, 533535, 1, NULL, NULL),
(6, 653346, 1, NULL, NULL),
(7, 693134, 1, NULL, NULL),
(9, 748783, 1, NULL, NULL),
(11, 786892, 1, NULL, NULL),
(12, 823464, 1, NULL, NULL),
(14, 956842, 1, NULL, NULL),
(15, 974262, 1, NULL, NULL),
(16, 1008409, 1, NULL, NULL),
(17, 1022789, 1, NULL, NULL),
(18, 1023922, 1, NULL, NULL),
(19, 1086747, 1, NULL, NULL),
(21, 280180, 1, NULL, NULL),
(22, 519182, 1, NULL, NULL),
(23, 746036, 1, NULL, NULL),
(24, 746036, 3, NULL, NULL),
(25, 932086, 1, NULL, NULL),
(26, 932086, 4, NULL, NULL),
(27, 932086, 5, NULL, NULL),
(28, 1032425, 3, NULL, NULL),
(29, 1032425, 6, NULL, NULL),
(30, 1032425, 1, NULL, NULL),
(31, 1039868, 7, NULL, NULL),
(32, 1066262, 1, NULL, NULL),
(33, 1066262, 5, NULL, NULL),
(34, 1209290, 1, NULL, NULL),
(35, 1226578, 1, NULL, NULL),
(36, 718821, 1, NULL, NULL),
(37, 639720, 1, NULL, NULL),
(38, 762441, 1, NULL, NULL),
(39, 929590, 1, NULL, NULL);

INSERT INTO `movies` (`id`, `title`, `original_title`, `overview`, `poster_path`, `backdrop_path`, `media_type`, `adult`, `original_language`, `popularity`, `release_date`, `video`, `vote_average`, `vote_count`, `budget`, `homepage`, `imdb_id`, `revenue`, `runtime`, `status`, `tagline`, `collection_id`, `created_at`, `updated_at`) VALUES
(280180, 'Beverly Hills Cop: Axel F', 'Beverly Hills Cop: Axel F', 'Forty years after his unforgettable first case in Beverly Hills, Detroit cop Axel Foley returns to do what he does best: solve crimes and cause chaos.', '/zszRKfzjM5jltiq8rk6rasKVpUv.jpg', '/rrwt0u1rW685u9bJ9ougg5HJEHC.jpg', NULL, 0, 'en', 1321.30, '2024-06-20', 0, 6.91, 574, 150000000, 'https://www.netflix.com/title/81076856', 'tt3083016', 0, 118, 'Released', '', 85861, '2024-07-17 14:10:08', '2024-07-17 14:46:36'),
(508883, 'The Boy and the Heron', '君たちはどう生きるか', 'While the Second World War rages, the teenage Mahito, haunted by his mother\'s tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy\'s mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"', '/f4oZTcfGrVTXKTWg157AwikXqmP.jpg', '/ybn3jCia5XBD0ZgEM07gcUPuRNh.jpg', NULL, 0, 'ja', 303.14, '2023-07-14', 0, 7.51, 1446, 50000000, 'https://gkids.com/films/the-boy-and-the-heron/', 'tt6587046', 294200000, 124, 'Released', 'Where death comes to an end, life finds a new beginning.', NULL, '2024-07-16 20:42:09', '2024-07-17 14:46:36'),
(519182, 'Despicable Me 4', 'Despicable Me 4', 'Gru and Lucy and their girls — Margo, Edith and Agnes — welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Meanwhile, Gru faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.', '/3w84hCFJATpiCO5g8hpdWVPBbmq.jpg', '/fDmci71SMkfZM8RnCuXJVDPaSdE.jpg', NULL, 0, 'en', 4379.88, '2024-06-20', 0, 7.47, 288, 100000000, 'https://www.despicable.me', 'tt7510222', 437809340, 95, 'Released', 'Things just got a little more despicable.', 86066, '2024-07-17 14:10:08', '2024-07-17 14:46:36'),
(533535, 'Deadpool & Wolverine', 'Deadpool & Wolverine', 'A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.', '/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg', '/dvBCdCohwWbsP5qAaglOXagDMtk.jpg', NULL, 0, 'en', 621.58, '2024-07-24', 0, 0.00, 0, 250000000, 'https://www.marvel.com/movies/deadpool-and-wolverine', 'tt6263850', 0, 128, 'Post Production', 'Come together.', 448150, '2024-07-16 20:42:09', '2024-07-17 14:46:36'),
(639720, 'IF', 'IF', 'A young girl who goes through a difficult experience begins to see everyone\'s imaginary friends who have been left behind as their real-life friends have grown up.', '/xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg', '/nxxCPRGTzxUH8SFMrIsvMmdxHti.jpg', NULL, 0, 'en', 386.70, '2024-05-08', 0, 7.38, 641, 110000000, 'https://www.if.movie', 'tt11152168', 184520784, 104, 'Released', 'A story you have to believe to see.', NULL, '2024-07-17 14:46:36', '2024-07-17 14:46:36'),
(653346, 'Kingdom of the Planet of the Apes', 'Kingdom of the Planet of the Apes', 'Several generations following Caesar\'s reign, apes – now the dominant species – live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all he\'s known about the past and to make choices that will define a future for apes and humans alike.', '/gKkl37BQuKTanygYQG1pyYgLVgf.jpg', '/fqv8v6AycXKsivp1T5yKtLbGXce.jpg', NULL, 0, 'en', 1804.61, '2024-05-08', 0, 7.12, 1868, 160000000, 'https://www.20thcenturystudios.com/movies/kingdom-of-the-planet-of-the-apes', 'tt11389872', 392879995, 145, 'Released', 'No one can stop the reign.', 173710, '2024-07-16 20:42:09', '2024-07-17 14:46:36'),
(693134, 'Dune: Part Two', 'Dune: Part Two', 'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.', '/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg', '/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg', NULL, 0, 'en', 367.09, '2024-02-27', 0, 8.17, 4841, 190000000, 'https://www.dunemovie.com', 'tt15239678', 711844359, 167, 'Released', 'Long live the fighters.', 726871, '2024-07-16 20:42:09', '2024-07-17 14:46:36'),
(718821, 'Twisters', 'Twisters', 'As storm season intensifies, the paths of former storm chaser Kate Carter and reckless social-media superstar Tyler Owens collide when terrifying phenomena never seen before are unleashed. The pair and their competing teams find themselves squarely in the paths of multiple storm systems converging over central Oklahoma in the fight of their lives.', '/g7yg6jJj4Z377j5h6S3MBRmjQ7U.jpg', '/7aPrv2HFssWcOtpig5G3HEVk3uS.jpg', NULL, 0, 'en', 539.24, '2024-07-10', 0, 7.80, 49, 200000000, 'https://www.twisters-movie.com', 'tt12584954', 0, 117, 'Released', 'Chase. Ride. Survive.', 1062948, '2024-07-17 14:36:15', '2024-07-17 14:46:36'),
(746036, 'The Fall Guy', 'The Fall Guy', 'Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job.', '/tSz1qsmSJon0rqjHBxXZmrotuse.jpg', '/H5HjE7Xb9N09rbWn1zBfxgI8uz.jpg', NULL, 0, 'en', 419.26, '2024-04-24', 0, 7.24, 1561, 125000000, 'https://www.thefallguymovie.com', 'tt1684562', 176300239, 126, 'Released', 'Fall hard.', NULL, '2024-07-17 14:10:08', '2024-07-17 14:46:36'),
(748783, 'The Garfield Movie', 'The Garfield Movie', 'Garfield, the world-famous, Monday-hating, lasagna-loving indoor cat, is about to have a wild outdoor adventure! After an unexpected reunion with his long-lost father – scruffy street cat Vic – Garfield and his canine friend Odie are forced from their perfectly pampered life into joining Vic in a hilarious, high-stakes heist.', '/p6AbOJvMQhBmffd0PIv0u8ghWeY.jpg', '/Akv9GlCCMrzcDkVz4ad8MdLl9DK.jpg', NULL, 0, 'en', 2381.19, '2024-04-30', 0, 7.25, 434, 60000000, 'https://www.thegarfield-movie.com/', 'tt5779228', 244865603, 101, 'Released', 'Indoor cat. Outdoor adventure.', NULL, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(762441, 'A Quiet Place: Day One', 'A Quiet Place: Day One', 'As New York City is invaded by alien creatures who hunt by sound, a woman named Sam fights to survive.', '/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg', '/6XjMwQTvnICBz6TguiDKkDVHvgS.jpg', NULL, 0, 'en', 641.39, '2024-06-26', 0, 6.91, 416, 67000000, 'https://www.aquietplacemovie.com', 'tt13433802', 220729000, 99, 'Released', 'Hear how it all began.', NULL, '2024-07-17 14:46:36', '2024-07-17 14:46:37'),
(786892, 'Furiosa: A Mad Max Saga', 'Furiosa: A Mad Max Saga', 'As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel presided over by The Immortan Joe. While the two Tyrants war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.', '/iADOJ8Zymht2JPMoy3R7xceZprc.jpg', '/wNAhuOZ3Zf84jCIlrcI6JhgmY5q.jpg', NULL, 0, 'en', 1912.45, '2024-05-22', 0, 7.65, 2147, 170000000, 'https://www.furiosaamadmaxsaga.com', 'tt12037194', 171338772, 149, 'Released', 'Fury is born.', 8945, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(823464, 'Godzilla x Kong: The New Empire', 'Godzilla x Kong: The New Empire', 'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.', '/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg', '/lLh39Th5plbrQgbQ4zyIULsd0Pp.jpg', NULL, 0, 'en', 949.61, '2024-03-27', 0, 7.20, 3191, 150000000, 'https://www.godzillaxkongmovie.com', 'tt14539740', 567156493, 115, 'Released', 'Rise together or fall alone.', 535313, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(929590, 'Civil War', 'Civil War', 'In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.', '/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg', '/a4IWRYNMNMszIkRbEIiNsRg6cvt.jpg', NULL, 0, 'en', 703.83, '2024-04-10', 0, 7.00, 1903, 50000000, 'https://a24films.com/films/civil-war', 'tt17279496', 121695834, 109, 'Released', 'Welcome to the frontline.', NULL, '2024-07-17 14:46:36', '2024-07-17 14:46:37'),
(932086, 'Horizon: An American Saga - Chapter 1', 'Horizon: An American Saga - Chapter 1', 'Explore the lure of the Old West and how it was won—and lost—through the blood, sweat and tears of many. Spanning 15 years before, during, and following the Civil War, from 1859 to 1874, embark on an emotional journey across a country at war with itself, experienced through the lens of families, friends and foes all attempting to discover what it truly means to be the United States of America.', '/hqDkO0W9uk4aiwzn3pTeLO7NPZD.jpg', '/yKrZcgpMwgGEbxolugcOKFdxjxF.jpg', NULL, 0, 'en', 147.77, '2024-06-26', 0, 7.02, 72, 50000000, 'https://www.horizonamericansaga.com', 'tt17505010', 29575411, 181, 'Released', 'The American saga begins this summer.', 1126640, '2024-07-17 14:10:08', '2024-07-17 14:46:37'),
(956842, 'Fly Me to the Moon', 'Fly Me to the Moon', 'Sparks fly in all directions as marketing maven Kelly Jones, brought in to fix NASA\'s public image, wreaks havoc on Apollo 11 launch director Cole Davis\' already difficult task of putting a man on the moon. When the White House deems the mission too important to fail, Jones is directed to stage a fake moon landing as backup, and the countdown truly begins.', '/gjk8YdXpItoC1in53FCrZMFIuBx.jpg', '/8xMR5w9qfpwhTJzjjvfj2ywvIF3.jpg', NULL, 0, 'en', 159.60, '2024-07-06', 0, 7.34, 67, 100000000, 'https://www.flymetothemoon.movie', 'tt1896747', 19000000, 132, 'Released', 'Will they make history... or fake it?', NULL, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(974262, 'Descendants: The Rise of Red', 'Descendants: The Rise of Red', 'After the Queen of Hearts incites a coup on Auradon, her rebellious daughter Red and Cinderella\'s perfectionist daughter Chloe join forces and travel back in time to try to undo the traumatic event that set Red\'s mother down her villainous path.', '/dwxWNJ9oDLqNPbA0884h5J7mfqy.jpg', '/dn3gbDpXPSwC6saMJOHkCiFA9jn.jpg', NULL, 0, 'en', 912.26, '2024-07-11', 0, 7.30, 119, 0, 'https://www.disneyplus.com/movies/descendants-the-rise-of-red/pa71YxxSEaY2', 'tt20202136', 0, 92, 'Released', 'There\'s a new way to be wicked.', 466463, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(1008409, 'The Bikeriders', 'The Bikeriders', 'After a chance encounter, headstrong Kathy is drawn to Benny, member of Midwestern motorcycle club the Vandals. As the club transforms into a dangerous underworld of violence, Benny must choose between Kathy and his loyalty to the club.', '/qTb6sSRt8Pw96JTan8ezU2xO0FU.jpg', '/bVigVS3LVotEK4GsBlGOagkjPEc.jpg', NULL, 0, 'en', 310.75, '2024-06-19', 0, 7.12, 282, 40000000, 'https://focusfeatures.com/the-bikeriders', 'tt21454134', 32581575, 116, 'Released', 'Legacies don\'t come easy.', NULL, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(1022789, 'Inside Out 2', 'Inside Out 2', 'Teenager Riley\'s mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.', '/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg', '/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg', NULL, 0, 'en', 5696.18, '2024-06-11', 0, 7.70, 1847, 200000000, 'https://movies.disney.com/inside-out-2', 'tt22022452', 1350092077, 97, 'Released', 'Make room for new emotions.', 1022790, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(1023922, 'MaXXXine', 'MaXXXine', 'In 1980s Hollywood, adult film star and aspiring actress Maxine Minx finally gets her big break. But as a mysterious killer stalks the starlets of Hollywood, a trail of blood threatens to reveal her sinister past.', '/ArvoFK6nlouZRxYmtIOUzKIrg90.jpg', '/viKEEaaCaZ0hZ2nGuvIEozlLooL.jpg', NULL, 0, 'en', 164.51, '2024-07-04', 0, 7.05, 78, 2000000, 'https://a24films.com/films/maxxxine', 'tt22048412', 14704432, 104, 'Released', 'Hollywood is a killer.', 950289, '2024-07-16 20:42:09', '2024-07-17 14:46:37'),
(1032425, 'The Dead Don\'t Hurt', 'The Dead Don\'t Hurt', 'In the 1860s, fiercely independent French-Canadian Vivienne Le Coudy embarks on a journey with Danish immigrant Holger Olsen, attempting to forge a life together in the dusty town of Elk Flats, Nevada. When Holger decides to go fight for the Union in the burgeoning Civil War, Vivienne must fend for herself, which isn\'t easy in a town controlled by a corrupt mayor.', '/br67EKUD34UL3mihsHqJhDzJaIt.jpg', '/u3qYwom6TtMXtglaVs07Bcu1L49.jpg', NULL, 0, 'en', 56.77, '2024-05-01', 0, 6.30, 38, 0, 'https://www.thedeaddonthurt.com/', 'tt22773644', 970119, 130, 'Released', '', NULL, '2024-07-17 14:10:08', '2024-07-17 14:46:37'),
(1039868, 'Vanished into the Night', 'Svaniti nella notte', 'A father, immersed in a difficult divorce process, embarks on a dangerous mission when his children disappear from their isolated country house.', '/f83MF5KVFRs5zuFCPlb6UQV1Yo9.jpg', '/1Lnch5CEdeND59iAF3aSGIJFI0D.jpg', NULL, 0, 'it', 287.79, '2024-07-10', 0, 4.78, 43, 0, 'https://www.netflix.com/title/81163835', 'tt14034294', 0, 93, 'Released', '', NULL, '2024-07-17 14:10:08', '2024-07-17 14:46:37'),
(1066262, 'The Convert', 'The Convert', 'Munro, a soldier turned lay preacher, comes to New Zealand to minister to the first British colonists, but he is converted by the powerful chief Maianui to serve a different purpose.', '/e5ZqqPlhKstzB4geibpZh38w7Pq.jpg', '/tqSg1hHiSWhHAhnjDhhevaFGsP0.jpg', NULL, 0, 'en', 121.43, '2024-03-14', 0, 6.46, 11, 0, '', 'tt20113412', 0, 119, 'Released', 'A fight for peace. A heart at war.', NULL, '2024-07-17 14:10:08', '2024-07-17 14:46:38'),
(1086747, 'The Watchers', 'The Watchers', 'A young artist gets stranded in an extensive, immaculate forest in western Ireland, where, after finding shelter, she becomes trapped alongside three strangers, stalked by mysterious creatures each night.', '/vZVEUPychdvZLrTNwWErr9xZFmu.jpg', '/wXx72bbhhnfORmlSNMWR28fPd8b.jpg', NULL, 0, 'en', 410.11, '2024-06-06', 0, 6.58, 492, 30000000, 'https://www.areyouwatching.com', 'tt26736843', 51147812, 102, 'Released', 'Let them see you.', NULL, '2024-07-16 20:42:09', '2024-07-17 14:46:38'),
(1209290, 'Justice League: Crisis on Infinite Earths Part Three', 'Justice League: Crisis on Infinite Earths Part Three', 'Now fully revealed as the ultimate threat to existence, the Anti-Monitor wages an unrelenting attack on the surviving Earths that struggle for survival in a pocket universe. One by one, these worlds and all their inhabitants are vaporized! On the planets that remain, even time itself is shattered, and heroes from the past join the Justice League and their rag-tag allies against the epitome of evil. But as they make their last stand, will the sacrifice of the superheroes be enough to save us all?', '/a3q8NkM8uTh9E23VsbUOdDSbBeN.jpg', '/dsGwCEO8tda4FlgHKvL95f0oQbH.jpg', NULL, 0, 'en', 114.29, '2024-07-16', 0, 5.79, 12, 0, 'https://www.warnerbros.com/movies/justice-league-crisis-infinite-earths-part-three', 'tt30150917', 0, 99, 'Released', '', 1178688, '2024-07-17 14:10:08', '2024-07-17 14:46:38'),
(1226578, 'Longlegs', 'Longlegs', 'In pursuit of a notorious serial killer, a rookie FBI agent with a mysterious past must solve a series of occult clues to end his terrifying killing spree.', '/dLAP1apgFIoBoPNw4HJLVACSu7u.jpg', '/Avtx5jsdPuDa091jvx2Lye3ygke.jpg', NULL, 0, 'en', 291.77, '2024-07-10', 0, 6.77, 69, 10000000, 'https://neonrated.com/films/longlegs', 'tt23468450', 22600000, 101, 'Released', 'Say your prayers.', NULL, '2024-07-17 14:10:08', '2024-07-17 14:46:38');

INSERT INTO `production_companies` (`id`, `name`, `logo_path`, `origin_country`, `created_at`, `updated_at`) VALUES
(1, 'Don Simpson/Jerry Bruckheimer Films', '/Aszf09kIVXR6cwG9lwjZIawbYVS.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(2, 'Eddie Murphy Productions', NULL, 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(3, 'Studio Ghibli', '/eS79pslnoKbWg7t3PMA9ayl0bGs.png', 'JP', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(4, 'Illumination', '/fOG2oY4m1YuYTQh4bMqqZkmgOAI.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(5, 'Universal Pictures', '/8lvHyhjr8oUKOOy2dKXoALWKdp0.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(6, 'Marvel Studios', '/hUzeosd33nzE5MCNsZxCGEKTXaQ.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(7, 'Kevin Feige Productions', NULL, 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(8, 'Maximum Effort', '/hx0C1XcSxGgat8N62GpxoJGTkCk.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(9, '21 Laps Entertainment', '/9YJrHYlcfHtwtulkFMAies3aFEl.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(10, 'Genre Films', '/Aqomtf9oh5dKtxBNEagkdlp3aGv.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(11, 'Paramount Pictures', '/gz66EfNoYPqHTYI4q9UEN4CbHRc.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(12, 'Sunday Night Productions', '/v6aLhoAviWYkfOksBJTd9XbO0YH.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(13, '20th Century Studios', '/h0rjX5vjW5r8yEnUBStFarjcLT4.png', 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(14, 'Oddball Entertainment', NULL, 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(15, 'Jason T. Reed Productions', NULL, 'US', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(16, 'Legendary Pictures', '/8M99Dkt23MjQMTTWukq4m5XsEuo.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(17, 'Warner Bros. Pictures', '/zhD3hhtKB5qyv7ZeL4uLpNxgMVU.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(18, 'Amblin Entertainment', '/cEaxANEisCqeEoRvODv2dO1I0iI.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(19, 'The Kennedy/Marshall Company', '/vdK6ZhC2CSW36j0VPEavRxOpbEg.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(20, 'Alcon Entertainment', '/9WOE5AQUXbOtLU6GTwfjS8OMF0v.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(21, 'DNEG', '/omWPoru2LNayUOBqjMBLP9KrFrP.png', 'GB', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(22, 'Wayfarer Studios', '/879WnwsOH1oP6NlLY7ChD6vL6lh.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(23, 'One Cool Group', NULL, 'HK', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(24, 'Stage 6 Films', '/xytTBODEy3p20ksHL4Ftxr483Iv.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(25, 'Andrews McMeel Entertainment', '/p8IO8N3bIaWaebafj52xvVB1On6.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(26, 'John Cohen Productions', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(27, 'Platinum Dunes', '/vOQg26GjR0LnkN1Ph9uyog1UuOE.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(28, 'Kennedy Miller Mitchell', '/xqE1fjLynj3RaZca9chctZQyfzZ.png', 'AU', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(29, 'Domain Entertainment', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(30, 'DNA Films', '/6a26if3IKy7mlrQuGHHVp6ufQtF.png', 'GB', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(31, 'IPR.VC', '/ggrWFqk5mPMks0vE3aCy3l9e0dv.png', 'FI', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(32, 'A24', '/1ZXsGaFPgrgS6ZZGS37AqD5uU12.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(33, 'These Pictures', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(34, 'Berlanti Productions', '/3e294jszfE6cE8TOogmj0zNd6pL.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(35, 'Apple Studios', '/oE7H93u8sy5vvW5EH3fpCp68vvB.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(36, 'Walt Disney Television', '/rRGi5UkwvdOPSfr5Xf42RZUsYgd.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(37, 'Suzanne Todd Productions', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(38, 'Potato Monkey Productions', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(39, 'GWave Productions', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(40, 'Tri-State Pictures', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(41, 'New Regency Pictures', '/wRn5HnYMGeJHmItRypgOZOC6gwY.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(42, 'Regency Enterprises', '/7cxRWzi4LsVm4Utfpr1hfARNurT.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(43, 'Walt Disney Pictures', '/wdrCwmRnLFJhEoH8GSfymY85KHT.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(44, 'Pixar', '/1TjvGVDMYsj6JBxOAkUHpPEwLf7.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(45, 'Motel Mojave', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(46, 'Access Entertainment', '/zAyfGEx1LJOkwNTrHugnWHzLRE.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(47, 'Blinding Edge Pictures', '/bVu0qQm4GujSTCvZZz9S3rHDczA.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(48, 'Inimitable Pictures', NULL, 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(49, 'C2 Motion Picture Group', '/lOouI8ibBzhLI4qvku74FPUVT8t.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(50, 'Saturn Films', '/vLENXiYTyITnMDrTKabUXhgTKX2.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(51, 'Oddfellows Entertainment', '/pYRSCID37ULO3fyP2HiuGA828IN.png', 'CA', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(52, 'Traffic.', NULL, '', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(53, 'Range Media Partners', '/kzQwU2H6woBFti9cqjr9BrVXrst.png', 'US', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(54, '87North Productions', '/zvJFu1C6gB80A98n6IGXBvMtgVl.png', 'US', '2024-07-17 14:10:10', '2024-07-17 14:10:10'),
(55, 'Entertainment 360', '/vJLYh9YHQaEryuzu7GNUa1zwKG1.png', 'US', '2024-07-17 14:10:10', '2024-07-17 14:10:10'),
(56, 'Territory Pictures', NULL, 'US', '2024-07-17 14:10:11', '2024-07-17 14:10:11'),
(57, 'Talipot Studio', '/j3aXPZaJcLdI6X3ezja5x0lN4bG.png', 'MX', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(58, 'Recorded Picture Company', '/8HB3TFUeo83keAPHfFfrNtN2MmA.png', 'GB', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(59, 'Perceval Pictures', '/p9pTDjZsyxsQ7pwj0pskJPmmzJq.png', 'US', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(60, 'Picomedia', '/u1DBUwYHOPsbTB7ZTqmg2kwfRQU.png', 'IT', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(61, 'Jump Film and Television', NULL, 'NZ', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(62, 'MBK Productions', '/eenvRLQEo1lVpToBFUKWJ9tqUX.png', 'GB', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(63, 'New Zealand Film Commission', '/a05DY2oSeUOVFDM61RsQa9x9RoC.png', 'NZ', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(64, 'Mister Smith Entertainment', '/7hfV6fYqdBxfL8BbgcRTM2hNNqH.png', 'GB', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(65, 'Brouhaha Entertainment', '/63KGHkv2ir0WdhIKuVXDltukmTT.png', 'AU', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(66, 'Kismet Film Company', NULL, '', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(67, 'Warner Bros. Animation', '/l5zW8jjmQOCx2dFmvnmbYmqoBmL.png', 'US', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(68, 'DC Entertainment', '/2Tc1P3Ac8M479naPp1kYT3izLS5.png', 'US', '2024-07-17 14:10:12', '2024-07-17 14:10:12');

INSERT INTO `production_countries` (`id`, `iso_3166_1`, `name`, `created_at`, `updated_at`) VALUES
(1, 'US', 'United States of America', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(2, 'JP', 'Japan', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(3, 'HK', 'Hong Kong', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(4, 'GB', 'United Kingdom', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(5, 'AU', 'Australia', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(6, 'FI', 'Finland', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(7, 'CA', 'Canada', '2024-07-16 20:42:10', '2024-07-16 20:42:10'),
(8, 'MX', 'Mexico', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(9, 'IT', 'Italy', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(10, 'NZ', 'New Zealand', '2024-07-17 14:10:12', '2024-07-17 14:10:12');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JmwnPZQcp6MJcJaTwFVUEiVI9FW1IE8rueIQjIpG', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSzJqRGpBU1N3bFdCVDdxY3BpODdmZ0kyTmhUSUIzVHpNVTZodkF0TiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiQ3RzBVQy5hUnJNdElOdGhjTUEzcHh1TmRNL25VS2QzWEh2VFlvbzFWS3FwUGdXUlpLMUJ6ZSI7fQ==', 1721227639);

INSERT INTO `spoken_languages` (`id`, `name`, `iso_639_1`, `english_name`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'English', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(2, '日本語', 'ja', 'Japanese', '2024-07-16 20:42:09', '2024-07-16 20:42:09'),
(3, 'Français', 'fr', 'French', '2024-07-17 14:10:10', '2024-07-17 14:10:10'),
(4, '普通话', 'zh', 'Mandarin', '2024-07-17 14:10:11', '2024-07-17 14:10:11'),
(5, '', 'nv', 'Navajo', '2024-07-17 14:10:11', '2024-07-17 14:10:11'),
(6, 'Español', 'es', 'Spanish', '2024-07-17 14:10:12', '2024-07-17 14:10:12'),
(7, 'Italiano', 'it', 'Italian', '2024-07-17 14:10:12', '2024-07-17 14:10:12');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@tmdb.app', NULL, '$2y$12$7G0UC.aRrMtINthcMA3pxuNdM/nUKd3XHvTYoo1VKqpPgWRZK1Bze', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 20:42:07', '2024-07-16 20:42:07');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;