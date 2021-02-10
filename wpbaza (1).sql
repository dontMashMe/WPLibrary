-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 10, 2021 at 02:26 PM
-- Server version: 8.0.22
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpbaza`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_customer`
--

DROP TABLE IF EXISTS `wp_customer`;
CREATE TABLE IF NOT EXISTS `wp_customer` (
  `user_id` mediumint NOT NULL,
  `registered_date` datetime NOT NULL,
  `user_name_surname` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `smjer` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_pass` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_customer`
--

INSERT INTO `wp_customer` (`user_id`, `registered_date`, `user_name_surname`, `email`, `smjer`, `user_pass`) VALUES
(1064904, '2021-01-28 11:19:21', 'Markan', 'noviemail@mail.com', '113', '123123'),
(1076482, '2021-01-07 16:30:36', 'Marijan', 'marijan.bebek@mail.com', '115', '123123'),
(1526231, '2021-01-28 14:35:54', 'Ivan', 'email@email.com', '115', '123123'),
(2360008, '2021-01-07 16:08:56', 'Marijan', 'marijan.bebek@mail.com', '', '123123'),
(2992007, '2021-01-28 11:09:10', 'Markić', 'randomemail@mail.com', '114', '123123');

-- --------------------------------------------------------

--
-- Table structure for table `wp_customer_book`
--

DROP TABLE IF EXISTS `wp_customer_book`;
CREATE TABLE IF NOT EXISTS `wp_customer_book` (
  `order_id` mediumint NOT NULL AUTO_INCREMENT,
  `user_id` mediumint NOT NULL,
  `book_id` mediumint NOT NULL,
  `date_rented` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_customer_book`
--

INSERT INTO `wp_customer_book` (`order_id`, `user_id`, `book_id`, `date_rented`, `active`) VALUES
(13, 1076482, 198, '2021-01-11', 0),
(14, 1076482, 208, '2021-01-11', 0),
(15, 1076482, 193, '2021-01-11', 0),
(16, 1076482, 208, '2021-01-25', 0),
(17, 1076482, 201, '2021-01-25', 0),
(18, 1076482, 208, '2021-01-25', 0),
(19, 1076482, 193, '2021-01-25', 0),
(20, 1076482, 174, '2021-01-25', 0),
(21, 1076482, 201, '2021-01-25', 0),
(22, 1076482, 208, '2021-01-25', 0),
(23, 1076482, 177, '2021-01-25', 0),
(24, 1076482, 208, '2021-01-25', 0),
(25, 1076482, 177, '2021-01-25', 0),
(26, 1076482, 193, '2021-01-25', 0),
(27, 1076482, 208, '2021-01-27', 0),
(28, 1076482, 201, '2021-01-27', 0),
(29, 1076482, 201, '2021-01-27', 0),
(30, 1076482, 193, '2021-01-27', 0),
(31, 1076482, 188, '2021-01-27', 0),
(32, 1076482, 177, '2021-01-27', 0),
(33, 1076482, 169, '2021-01-27', 0),
(34, 1076482, 177, '2021-01-27', 0),
(35, 1076482, 208, '2021-01-27', 0),
(36, 1076482, 177, '2021-01-27', 0),
(37, 1076482, 201, '2021-01-27', 0),
(38, 1076482, 177, '2021-01-27', 0),
(39, 1076482, 201, '2021-01-27', 0),
(40, 1076482, 201, '2021-01-28', 0),
(41, 1076482, 177, '2021-01-28', 0),
(42, 1076482, 174, '2021-01-28', 0),
(43, 1076482, 208, '2021-01-28', 0),
(44, 1076482, 169, '2021-01-28', 0),
(45, 1526231, 193, '2021-01-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Knjižnica Visoke Škole', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'marijan.bebek@mail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:242:{s:8:\"smjer/?$\";s:25:\"index.php?post_type=smjer\";s:38:\"smjer/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=smjer&feed=$matches[1]\";s:33:\"smjer/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=smjer&feed=$matches[1]\";s:25:\"smjer/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=smjer&paged=$matches[1]\";s:9:\"knjiga/?$\";s:26:\"index.php?post_type=knjiga\";s:39:\"knjiga/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=knjiga&feed=$matches[1]\";s:34:\"knjiga/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=knjiga&feed=$matches[1]\";s:26:\"knjiga/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=knjiga&paged=$matches[1]\";s:8:\"autor/?$\";s:25:\"index.php?post_type=autor\";s:38:\"autor/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=autor&feed=$matches[1]\";s:33:\"autor/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=autor&feed=$matches[1]\";s:25:\"autor/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=autor&paged=$matches[1]\";s:6:\"rad/?$\";s:23:\"index.php?post_type=rad\";s:36:\"rad/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?post_type=rad&feed=$matches[1]\";s:31:\"rad/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?post_type=rad&feed=$matches[1]\";s:23:\"rad/page/([0-9]{1,})/?$\";s:41:\"index.php?post_type=rad&paged=$matches[1]\";s:9:\"mentor/?$\";s:26:\"index.php?post_type=mentor\";s:39:\"mentor/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=mentor&feed=$matches[1]\";s:34:\"mentor/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=mentor&feed=$matches[1]\";s:26:\"mentor/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=mentor&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"smjer/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"smjer/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"smjer/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"smjer/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"smjer/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"smjer/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"smjer/([^/]+)/embed/?$\";s:38:\"index.php?smjer=$matches[1]&embed=true\";s:26:\"smjer/([^/]+)/trackback/?$\";s:32:\"index.php?smjer=$matches[1]&tb=1\";s:46:\"smjer/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?smjer=$matches[1]&feed=$matches[2]\";s:41:\"smjer/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?smjer=$matches[1]&feed=$matches[2]\";s:34:\"smjer/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?smjer=$matches[1]&paged=$matches[2]\";s:41:\"smjer/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?smjer=$matches[1]&cpage=$matches[2]\";s:30:\"smjer/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?smjer=$matches[1]&page=$matches[2]\";s:22:\"smjer/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"smjer/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"smjer/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"smjer/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"smjer/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"smjer/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"knjiga/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"knjiga/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"knjiga/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"knjiga/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"knjiga/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"knjiga/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"knjiga/([^/]+)/embed/?$\";s:39:\"index.php?knjiga=$matches[1]&embed=true\";s:27:\"knjiga/([^/]+)/trackback/?$\";s:33:\"index.php?knjiga=$matches[1]&tb=1\";s:47:\"knjiga/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?knjiga=$matches[1]&feed=$matches[2]\";s:42:\"knjiga/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?knjiga=$matches[1]&feed=$matches[2]\";s:35:\"knjiga/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?knjiga=$matches[1]&paged=$matches[2]\";s:42:\"knjiga/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?knjiga=$matches[1]&cpage=$matches[2]\";s:31:\"knjiga/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?knjiga=$matches[1]&page=$matches[2]\";s:23:\"knjiga/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"knjiga/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"knjiga/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"knjiga/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"knjiga/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"knjiga/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:50:\"kata_broj/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?kata_broj=$matches[1]&feed=$matches[2]\";s:45:\"kata_broj/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?kata_broj=$matches[1]&feed=$matches[2]\";s:26:\"kata_broj/([^/]+)/embed/?$\";s:42:\"index.php?kata_broj=$matches[1]&embed=true\";s:38:\"kata_broj/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?kata_broj=$matches[1]&paged=$matches[2]\";s:20:\"kata_broj/([^/]+)/?$\";s:31:\"index.php?kata_broj=$matches[1]\";s:51:\"kategorija/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?kategorija=$matches[1]&feed=$matches[2]\";s:46:\"kategorija/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?kategorija=$matches[1]&feed=$matches[2]\";s:27:\"kategorija/([^/]+)/embed/?$\";s:43:\"index.php?kategorija=$matches[1]&embed=true\";s:39:\"kategorija/([^/]+)/page/?([0-9]{1,})/?$\";s:50:\"index.php?kategorija=$matches[1]&paged=$matches[2]\";s:21:\"kategorija/([^/]+)/?$\";s:32:\"index.php?kategorija=$matches[1]\";s:54:\"broj_stranica/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?broj_stranica=$matches[1]&feed=$matches[2]\";s:49:\"broj_stranica/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?broj_stranica=$matches[1]&feed=$matches[2]\";s:30:\"broj_stranica/([^/]+)/embed/?$\";s:46:\"index.php?broj_stranica=$matches[1]&embed=true\";s:42:\"broj_stranica/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?broj_stranica=$matches[1]&paged=$matches[2]\";s:24:\"broj_stranica/([^/]+)/?$\";s:35:\"index.php?broj_stranica=$matches[1]\";s:49:\"dostupno/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?dostupno=$matches[1]&feed=$matches[2]\";s:44:\"dostupno/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?dostupno=$matches[1]&feed=$matches[2]\";s:25:\"dostupno/([^/]+)/embed/?$\";s:41:\"index.php?dostupno=$matches[1]&embed=true\";s:37:\"dostupno/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?dostupno=$matches[1]&paged=$matches[2]\";s:19:\"dostupno/([^/]+)/?$\";s:30:\"index.php?dostupno=$matches[1]\";s:48:\"izdavac/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?izdavac=$matches[1]&feed=$matches[2]\";s:43:\"izdavac/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?izdavac=$matches[1]&feed=$matches[2]\";s:24:\"izdavac/([^/]+)/embed/?$\";s:40:\"index.php?izdavac=$matches[1]&embed=true\";s:36:\"izdavac/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?izdavac=$matches[1]&paged=$matches[2]\";s:18:\"izdavac/([^/]+)/?$\";s:29:\"index.php?izdavac=$matches[1]\";s:33:\"autor/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"autor/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"autor/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"autor/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"autor/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"autor/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"autor/([^/]+)/embed/?$\";s:38:\"index.php?autor=$matches[1]&embed=true\";s:26:\"autor/([^/]+)/trackback/?$\";s:32:\"index.php?autor=$matches[1]&tb=1\";s:46:\"autor/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?autor=$matches[1]&feed=$matches[2]\";s:41:\"autor/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?autor=$matches[1]&feed=$matches[2]\";s:34:\"autor/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?autor=$matches[1]&paged=$matches[2]\";s:41:\"autor/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?autor=$matches[1]&cpage=$matches[2]\";s:30:\"autor/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?autor=$matches[1]&page=$matches[2]\";s:22:\"autor/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"autor/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"autor/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"autor/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"autor/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"autor/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:31:\"rad/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:41:\"rad/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:61:\"rad/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"rad/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:56:\"rad/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:37:\"rad/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:20:\"rad/([^/]+)/embed/?$\";s:36:\"index.php?rad=$matches[1]&embed=true\";s:24:\"rad/([^/]+)/trackback/?$\";s:30:\"index.php?rad=$matches[1]&tb=1\";s:44:\"rad/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?rad=$matches[1]&feed=$matches[2]\";s:39:\"rad/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?rad=$matches[1]&feed=$matches[2]\";s:32:\"rad/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?rad=$matches[1]&paged=$matches[2]\";s:39:\"rad/([^/]+)/comment-page-([0-9]{1,})/?$\";s:43:\"index.php?rad=$matches[1]&cpage=$matches[2]\";s:28:\"rad/([^/]+)(?:/([0-9]+))?/?$\";s:42:\"index.php?rad=$matches[1]&page=$matches[2]\";s:20:\"rad/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:30:\"rad/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:50:\"rad/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"rad/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:45:\"rad/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:26:\"rad/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:51:\"vrsta_rada/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?vrsta_rada=$matches[1]&feed=$matches[2]\";s:46:\"vrsta_rada/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?vrsta_rada=$matches[1]&feed=$matches[2]\";s:27:\"vrsta_rada/([^/]+)/embed/?$\";s:43:\"index.php?vrsta_rada=$matches[1]&embed=true\";s:39:\"vrsta_rada/([^/]+)/page/?([0-9]{1,})/?$\";s:50:\"index.php?vrsta_rada=$matches[1]&paged=$matches[2]\";s:21:\"vrsta_rada/([^/]+)/?$\";s:32:\"index.php?vrsta_rada=$matches[1]\";s:49:\"ustanova/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?ustanova=$matches[1]&feed=$matches[2]\";s:44:\"ustanova/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?ustanova=$matches[1]&feed=$matches[2]\";s:25:\"ustanova/([^/]+)/embed/?$\";s:41:\"index.php?ustanova=$matches[1]&embed=true\";s:37:\"ustanova/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?ustanova=$matches[1]&paged=$matches[2]\";s:19:\"ustanova/([^/]+)/?$\";s:30:\"index.php?ustanova=$matches[1]\";s:34:\"mentor/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"mentor/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"mentor/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"mentor/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"mentor/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"mentor/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"mentor/([^/]+)/embed/?$\";s:39:\"index.php?mentor=$matches[1]&embed=true\";s:27:\"mentor/([^/]+)/trackback/?$\";s:33:\"index.php?mentor=$matches[1]&tb=1\";s:47:\"mentor/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?mentor=$matches[1]&feed=$matches[2]\";s:42:\"mentor/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?mentor=$matches[1]&feed=$matches[2]\";s:35:\"mentor/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?mentor=$matches[1]&paged=$matches[2]\";s:42:\"mentor/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?mentor=$matches[1]&cpage=$matches[2]\";s:31:\"mentor/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?mentor=$matches[1]&page=$matches[2]\";s:23:\"mentor/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"mentor/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"mentor/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"mentor/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"mentor/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"mentor/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=7&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:33:\"classic-editor/classic-editor.php\";i:1;s:9:\"hello.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:60:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema/style.css\";i:2;s:0:\"\";}', 'no'),
(40, 'template', 'tematema', 'yes'),
(41, 'stylesheet', 'tematema', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:3:{i:1;a:0:{}i:3;a:4:{s:5:\"title\";s:108:\"Visoka škola za menadžment u turizmu i informatici • Matije Gupca 78 • Virovitica • Tel: 033 721 099\";s:4:\"text\";s:0:\"\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:31:\"pop-up-pop-up/pop-up-pop-up.php\";s:28:\"wp_mypopups_delete_file_code\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '20', 'yes'),
(82, 'page_on_front', '7', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '221', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1623423688', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'initial_db_version', '49752', 'yes'),
(99, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:76:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:9:\"read_post\";b:1;s:24:\"read_private_sgpb_popups\";b:1;s:15:\"edit_sgpb_popup\";b:1;s:16:\"edit_sgpb_popups\";b:1;s:23:\"edit_others_sgpb_popups\";b:1;s:26:\"edit_published_sgpb_popups\";b:1;s:19:\"publish_sgpb_popups\";b:1;s:18:\"delete_sgpb_popups\";b:1;s:25:\"delete_others_sgpb_popups\";b:1;s:26:\"delete_private_sgpb_popups\";b:1;s:25:\"delete_private_sgpb_popup\";b:1;s:28:\"delete_published_sgpb_popups\";b:1;s:19:\"sgpb_manage_options\";b:1;s:18:\"manage_popup_terms\";b:1;s:29:\"manage_popup_categories_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:33:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:9:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(100, 'fresh_site', '0', 'yes'),
(101, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:15:\"footer-sidebar1\";a:1:{i:0;s:13:\"media_image-2\";}s:15:\"footer-sidebar2\";a:1:{i:0;s:6:\"text-3\";}s:15:\"footer-sidebar3\";a:1:{i:0;s:13:\"media_image-3\";}s:13:\"array_version\";i:3;}', 'yes'),
(107, 'cron', 'a:6:{i:1612969289;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1612969290;a:4:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1612969365;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1612969367;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1613401290;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:3:{i:2;a:15:{s:4:\"size\";s:4:\"full\";s:5:\"width\";i:179;s:6:\"height\";i:104;s:7:\"caption\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:9:\"link_type\";s:6:\"custom\";s:8:\"link_url\";s:0:\"\";s:13:\"image_classes\";s:0:\"\";s:12:\"link_classes\";s:0:\"\";s:8:\"link_rel\";s:0:\"\";s:17:\"link_target_blank\";b:0;s:11:\"image_title\";s:0:\"\";s:13:\"attachment_id\";i:36;s:3:\"url\";s:77:\"http://localhost/wordpress/wp-content/uploads/2020/12/vsmti_en_logo_small.png\";s:5:\"title\";s:0:\"\";}i:3;a:15:{s:4:\"size\";s:6:\"medium\";s:5:\"width\";i:324;s:6:\"height\";i:59;s:7:\"caption\";s:0:\"\";s:3:\"alt\";s:0:\"\";s:9:\"link_type\";s:6:\"custom\";s:8:\"link_url\";s:0:\"\";s:13:\"image_classes\";s:0:\"\";s:12:\"link_classes\";s:0:\"\";s:8:\"link_rel\";s:0:\"\";s:17:\"link_target_blank\";b:0;s:11:\"image_title\";s:0:\"\";s:13:\"attachment_id\";i:37;s:3:\"url\";s:69:\"http://localhost/wordpress/wp-content/uploads/2020/12/logo-300x55.png\";s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'recovery_keys', 'a:0:{}', 'yes'),
(119, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.6.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.6.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.6.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.6.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.6.1-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.6.1\";s:7:\"version\";s:5:\"5.6.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:3:\"5.6\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.6.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.6.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.6.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.6.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.6.1-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.6.1-rollback-0.zip\";}s:7:\"current\";s:5:\"5.6.1\";s:7:\"version\";s:5:\"5.6.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:3:\"5.6\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1612967158;s:15:\"version_checked\";s:3:\"5.6\";s:12:\"translations\";a:0:{}}', 'no'),
(122, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1607872765;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(131, 'can_compress_scripts', '1', 'no'),
(144, 'recently_activated', 'a:2:{s:31:\"pop-up-pop-up/pop-up-pop-up.php\";i:1611750450;s:31:\"popup-builder/popup-builder.php\";i:1611746888;}', 'yes'),
(151, 'finished_updating_comment_type', '1', 'yes'),
(152, 'current_theme', 'Tema Knjige', 'yes'),
(153, 'theme_mods_tematema', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:8:\"top-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(154, 'theme_switched', '', 'yes'),
(155, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1612967164;s:7:\"checked\";a:1:{s:8:\"tematema\";s:0:\"\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(176, 'recovery_mode_email_last_sent', '1610964314', 'yes'),
(177, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:1:{i:0;i:2;}}', 'yes'),
(193, 'acf_version', '5.9.3', 'yes'),
(204, '_transient_health-check-site-status-result', '{\"good\":12,\"recommended\":6,\"critical\":2}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(221, '_transient_dirsize_cache', 'a:214:{s:48:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/blue\";i:73417;s:50:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/coffee\";i:70872;s:53:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/ectoplasm\";i:73411;s:49:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/light\";i:76561;s:52:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/midnight\";i:73370;s:50:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/modern\";i:73484;s:49:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/ocean\";i:70894;s:51:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors/sunrise\";i:73430;s:43:\"C:\\wamp64\\www\\wordpress/wp-admin/css/colors\";i:608029;s:36:\"C:\\wamp64\\www\\wordpress/wp-admin/css\";i:2404484;s:39:\"C:\\wamp64\\www\\wordpress/wp-admin/images\";i:676556;s:41:\"C:\\wamp64\\www\\wordpress/wp-admin/includes\";i:2832818;s:43:\"C:\\wamp64\\www\\wordpress/wp-admin/js/widgets\";i:139383;s:35:\"C:\\wamp64\\www\\wordpress/wp-admin/js\";i:1878894;s:38:\"C:\\wamp64\\www\\wordpress/wp-admin/maint\";i:7241;s:40:\"C:\\wamp64\\www\\wordpress/wp-admin/network\";i:123593;s:37:\"C:\\wamp64\\www\\wordpress/wp-admin/user\";i:3418;s:32:\"C:\\wamp64\\www\\wordpress/wp-admin\";i:8800667;s:42:\"C:\\wamp64\\www\\wordpress/wp-content/upgrade\";i:0;s:34:\"C:\\wamp64\\www\\wordpress/wp-content\";i:28;s:42:\"C:\\wamp64\\www\\wordpress/wp-includes/assets\";i:9245;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/block-patterns\";i:17482;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/block-supports\";i:14899;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/archives\";i:284;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/audio\";i:722;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/block\";i:209;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/button\";i:1041;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/buttons\";i:144;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/calendar\";i:203;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/categories\";i:354;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/classic\";i:238;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/code\";i:204;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/column\";i:327;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/columns\";i:287;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/embed\";i:570;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/file\";i:748;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/gallery\";i:1454;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/group\";i:380;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/heading\";i:747;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/html\";i:233;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/image\";i:1270;s:58:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/latest-comments\";i:450;s:55:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/latest-posts\";i:1430;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/list\";i:574;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/media-text\";i:1582;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/missing\";i:387;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/more\";i:298;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/nextpage\";i:191;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/paragraph\";i:618;s:55:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/preformatted\";i:270;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/pullquote\";i:579;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/quote\";i:389;s:46:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/rss\";i:647;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/search\";i:599;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/separator\";i:246;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/shortcode\";i:235;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/social-link\";i:342;s:55:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/social-links\";i:310;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/spacer\";i:182;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/subhead\";i:266;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/table\";i:2381;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/tag-cloud\";i:279;s:55:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/text-columns\";i:455;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/verse\";i:305;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks/video\";i:1340;s:42:\"C:\\wamp64\\www\\wordpress/wp-includes/blocks\";i:110751;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/certificates\";i:234459;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/block-directory\";i:18516;s:57:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/block-editor\";i:369779;s:58:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/block-library\";i:470185;s:55:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/components\";i:491573;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/edit-post\";i:179799;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/editor\";i:113027;s:59:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/format-library\";i:9700;s:65:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/list-reusable-blocks\";i:9088;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist/nux\";i:12720;s:44:\"C:\\wamp64\\www\\wordpress/wp-includes/css/dist\";i:1674387;s:39:\"C:\\wamp64\\www\\wordpress/wp-includes/css\";i:2311016;s:45:\"C:\\wamp64\\www\\wordpress/wp-includes/customize\";i:169905;s:41:\"C:\\wamp64\\www\\wordpress/wp-includes/fonts\";i:289826;s:39:\"C:\\wamp64\\www\\wordpress/wp-includes/ID3\";i:1134311;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/images/crystal\";i:15541;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/images/media\";i:2419;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/images/smilies\";i:10082;s:46:\"C:\\wamp64\\www\\wordpress/wp-includes/images/wlw\";i:4413;s:42:\"C:\\wamp64\\www\\wordpress/wp-includes/images\";i:103747;s:39:\"C:\\wamp64\\www\\wordpress/wp-includes/IXR\";i:33913;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/js/codemirror\";i:1287141;s:43:\"C:\\wamp64\\www\\wordpress/wp-includes/js/crop\";i:20004;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/js/dist/vendor\";i:2531840;s:43:\"C:\\wamp64\\www\\wordpress/wp-includes/js/dist\";i:13729757;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/js/imgareaselect\";i:48990;s:44:\"C:\\wamp64\\www\\wordpress/wp-includes/js/jcrop\";i:18340;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/js/jquery/ui\";i:794124;s:45:\"C:\\wamp64\\www\\wordpress/wp-includes/js/jquery\";i:1308762;s:61:\"C:\\wamp64\\www\\wordpress/wp-includes/js/mediaelement/renderers\";i:18880;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/js/mediaelement\";i:719406;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/js/plupload\";i:488464;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/js/swfupload\";i:8715;s:47:\"C:\\wamp64\\www\\wordpress/wp-includes/js/thickbox\";i:31154;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/langs\";i:15529;s:62:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/charmap\";i:31811;s:66:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/colorpicker\";i:4910;s:67:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/compat3x/css\";i:8179;s:63:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/compat3x\";i:21758;s:69:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/directionality\";i:2749;s:65:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/fullscreen\";i:7779;s:57:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/hr\";i:1347;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/image\";i:55874;s:59:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/link\";i:32949;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/lists\";i:97383;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/media\";i:57914;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/paste\";i:113193;s:63:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/tabfocus\";i:5336;s:64:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/textcolor\";i:16237;s:64:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wordpress\";i:50292;s:67:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpautoresize\";i:8341;s:64:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpdialogs\";i:3761;s:66:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpeditimage\";i:37908;s:62:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpemoji\";i:5111;s:64:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpgallery\";i:4837;s:61:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wplink\";i:26511;s:68:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wptextpattern\";i:11972;s:61:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins/wpview\";i:9005;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/plugins\";i:606978;s:68:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins/lightgray/fonts\";i:155760;s:66:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins/lightgray/img\";i:2856;s:62:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins/lightgray\";i:210254;s:69:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins/wordpress/images\";i:14207;s:62:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins/wordpress\";i:22831;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/skins\";i:233085;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/themes/inlite\";i:452642;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/themes/modern\";i:446221;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/themes\";i:898863;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce/utils\";i:18822;s:46:\"C:\\wamp64\\www\\wordpress/wp-includes/js/tinymce\";i:2854054;s:38:\"C:\\wamp64\\www\\wordpress/wp-includes/js\";i:22890548;s:45:\"C:\\wamp64\\www\\wordpress/wp-includes/PHPMailer\";i:215008;s:40:\"C:\\wamp64\\www\\wordpress/wp-includes/pomo\";i:52025;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/random_compat\";i:40843;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Auth\";i:1941;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Cookie\";i:3818;s:59:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Exception/HTTP\";i:14334;s:64:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Exception/Transport\";i:918;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Exception\";i:16745;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Proxy\";i:3471;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Response\";i:2125;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Transport\";i:27761;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests/Utility\";i:3393;s:44:\"C:\\wamp64\\www\\wordpress/wp-includes/Requests\";i:136596;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/rest-api/endpoints\";i:478543;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/rest-api/fields\";i:21950;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/rest-api/search\";i:15130;s:44:\"C:\\wamp64\\www\\wordpress/wp-includes/rest-api\";i:597535;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Cache\";i:39593;s:58:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Content/Type\";i:8015;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Content\";i:8015;s:57:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Decode/HTML\";i:17241;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Decode\";i:17241;s:50:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/HTTP\";i:11515;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Net\";i:7493;s:51:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/Parse\";i:20551;s:61:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/XML/Declaration\";i:7098;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie/XML\";i:7098;s:45:\"C:\\wamp64\\www\\wordpress/wp-includes/SimplePie\";i:455756;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/sitemaps/providers\";i:15133;s:44:\"C:\\wamp64\\www\\wordpress/wp-includes/sitemaps\";i:45054;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/lib\";i:76084;s:74:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced/Core/ChaCha20\";i:224;s:79:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced/Core/Curve25519/Ge\";i:602;s:76:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced/Core/Curve25519\";i:820;s:74:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced/Core/Poly1305\";i:112;s:65:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced/Core\";i:2444;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/namespaced\";i:2698;s:65:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/Base64\";i:22135;s:67:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/ChaCha20\";i:5152;s:72:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/Curve25519/Ge\";i:7881;s:69:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/Curve25519\";i:119831;s:67:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/Poly1305\";i:12912;s:71:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core/SecretStream\";i:3624;s:58:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core\";i:388928;s:69:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32/ChaCha20\";i:6295;s:74:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32/Curve25519/Ge\";i:8177;s:71:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32/Curve25519\";i:122399;s:69:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32/Poly1305\";i:15980;s:73:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32/SecretStream\";i:3656;s:60:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/Core32\";i:437457;s:59:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src/PHP52\";i:4116;s:53:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat/src\";i:1128619;s:49:\"C:\\wamp64\\www\\wordpress/wp-includes/sodium_compat\";i:1213152;s:52:\"C:\\wamp64\\www\\wordpress/wp-includes/Text/Diff/Engine\";i:31662;s:54:\"C:\\wamp64\\www\\wordpress/wp-includes/Text/Diff/Renderer\";i:5535;s:45:\"C:\\wamp64\\www\\wordpress/wp-includes/Text/Diff\";i:44010;s:40:\"C:\\wamp64\\www\\wordpress/wp-includes/Text\";i:56925;s:48:\"C:\\wamp64\\www\\wordpress/wp-includes/theme-compat\";i:15414;s:43:\"C:\\wamp64\\www\\wordpress/wp-includes/widgets\";i:148347;s:35:\"C:\\wamp64\\www\\wordpress/wp-includes\";i:36344638;s:23:\"C:\\wamp64\\www\\wordpress\";i:45317715;s:60:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema/css/fonts\";i:399115;s:54:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema/css\";i:4801201;s:57:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema/images\";i:1102927;s:53:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema/js\";i:2546644;s:50:\"C:\\wamp64\\www\\wordpress/wp-content/themes/tematema\";i:8471386;s:41:\"C:\\wamp64\\www\\wordpress/wp-content/themes\";i:8471414;s:56:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/akismet/views\";i:30415;s:59:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/akismet/_inc/img\";i:5052;s:55:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/akismet/_inc\";i:29951;s:50:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/akismet\";i:238044;s:60:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/classic-editor/js\";i:624;s:57:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/classic-editor\";i:61168;s:42:\"C:\\wamp64\\www\\wordpress/wp-content/plugins\";i:301818;s:50:\"C:\\wamp64\\www\\wordpress/wp-content/uploads/2020/12\";i:22090;s:47:\"C:\\wamp64\\www\\wordpress/wp-content/uploads/2020\";i:22090;s:42:\"C:\\wamp64\\www\\wordpress/wp-content/uploads\";i:22090;}', 'yes'),
(505, 'category_children', 'a:0:{}', 'yes'),
(651, 'SGPBUsageDays', '0', 'yes'),
(652, 'SGPBInstallDate', '1611745514', 'yes'),
(653, 'SGPBOpenNextTime', '1614337514', 'yes'),
(654, 'SGPBMaxOpenCount', '80', 'yes'),
(655, 'sgpbPopupBuilderRegisteredPlugins', '[]', 'yes'),
(656, 'SGPB_INACTIVE_EXTENSIONS', 'inactive', 'yes'),
(660, 'sgpb-all-notifications-data', '[{\"id\":\"sgpbMainSupportBanner\",\"priority\":1,\"type\":1,\"message\":\"<div class=\\\"sgpb-support-notification-wrapper sgpb-wrapper\\\"><h4 class=\\\"sgpb-support-notification-title\\\">Need some help?<\\/h4><h4 class=\\\"sgpb-support-notification-title\\\">Let us know what you think.<\\/h4><a class=\\\"btn btn-info\\\" target=\\\"_blank\\\" href=\\\"http:\\/\\/bit.ly\\/sgpbPluginSource\\\"><span class=\\\"dashicons sgpb-dashicons-heart sgpb-info-text-white\\\"><\\/span><span class=\\\"sg-info-text\\\">Rate Us<\\/span><\\/a><a class=\\\"btn btn-info\\\" target=\\\"_blank\\\" href=\\\"https:\\/\\/help.popup-builder.com\\\"><span class=\\\"dashicons sgpb-dashicons-megaphone sgpb-info-text-white\\\"><\\/span>Support Potal<\\/a><a class=\\\"btn btn-info\\\" target=\\\"_blank\\\" href=\\\"https:\\/\\/wordpress.org\\/support\\/plugin\\/popup-builder\\\"><span class=\\\"dashicons sgpb-dashicons-admin-plugins sgpb-info-text-white\\\"><\\/span>Support Forum<\\/a><a class=\\\"btn btn-info\\\" target=\\\"_blank\\\" href=\\\"https:\\/\\/popup-builder.com\\/\\\"><span class=\\\"dashicons sgpb-dashicons-editor-help sgpb-info-text-white\\\"><\\/span>LIVE chat<\\/a><a class=\\\"btn btn-info\\\" target=\\\"_blank\\\" href=\\\"mailto:support@popup-builder.com?subject=Hello\\\"><span class=\\\"dashicons sgpb-dashicons-email-alt sgpb-info-text-white\\\"><\\/span>Email<\\/a><\\/div><div class=\\\"sgpb-support-notification-dont-show\\\">Bored of this?<a class=\\\"sgpb-dont-show-again-support-notification\\\" href=\\\"javascript:void(0)\\\"> Press here <\\/a>and we will not show it again!<\\/div>\"}]', 'yes'),
(661, 'sgpb-metabox-banner-remote-get', '<div class=\"sgpb-right-banner-wrapper\"><div class=\"sgpb-first-row\" style=\"background-image: url(https://popup-builder.com/wp-content/uploads/2018/12/subsciption-plus-banner-wordpress.jpg);\"></div><div class=\"sgpb-second-row\"></div></div>\nCustomize Your Subscription Fields and Mail Templates with our new <a target=\"_blank\" href=\"https://popup-builder.com/downloads/mailchimp-popup/\">Subscription Plus </a> extension.\n<style>.sgpb-first-row{background-size: 100%;min-height: 310px;background-repeat: no-repeat;}</style>', 'yes'),
(662, 'sgpbModifiedRegisteredPluginsPaths2', '1', 'yes'),
(664, 'sgpb-unnecessary-scripts-removed-1', '1', 'yes'),
(673, 'SgpbCounter', 'a:1:{i:224;i:45;}', 'yes'),
(716, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1612967164;s:7:\"checked\";a:2:{s:33:\"classic-editor/classic-editor.php\";s:3:\"1.6\";s:9:\"hello.php\";s:5:\"1.7.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(755, '_site_transient_timeout_php_check_7772753a7ea0fe5c6dd1e8406c9ba6ba', '1613050072', 'no'),
(756, '_site_transient_php_check_7772753a7ea0fe5c6dd1e8406c9ba6ba', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(757, '_site_transient_timeout_browser_596504ab6498de58013fb1f91ee16006', '1613050079', 'no'),
(758, '_site_transient_browser_596504ab6498de58013fb1f91ee16006', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"88.0.4324.96\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(773, '_site_transient_timeout_theme_roots', '1612968962', 'no'),
(774, '_site_transient_theme_roots', 'a:1:{s:8:\"tematema\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(5, 7, '_edit_last', '1'),
(6, 7, '_edit_lock', '1611843195:1'),
(41, 20, '_edit_last', '1'),
(42, 20, '_edit_lock', '1610199525:1'),
(45, 24, '_edit_last', '1'),
(46, 24, '_edit_lock', '1611844889:1'),
(47, 27, '_menu_item_type', 'post_type'),
(48, 27, '_menu_item_menu_item_parent', '0'),
(49, 27, '_menu_item_object_id', '24'),
(50, 27, '_menu_item_object', 'page'),
(51, 27, '_menu_item_target', ''),
(52, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(53, 27, '_menu_item_xfn', ''),
(54, 27, '_menu_item_url', ''),
(65, 29, '_menu_item_type', 'post_type'),
(66, 29, '_menu_item_menu_item_parent', '0'),
(67, 29, '_menu_item_object_id', '20'),
(68, 29, '_menu_item_object', 'page'),
(69, 29, '_menu_item_target', ''),
(70, 29, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(71, 29, '_menu_item_xfn', ''),
(72, 29, '_menu_item_url', ''),
(86, 31, '_edit_last', '1'),
(87, 31, '_edit_lock', '1610202345:1'),
(88, 33, '_menu_item_type', 'post_type'),
(89, 33, '_menu_item_menu_item_parent', '0'),
(90, 33, '_menu_item_object_id', '31'),
(91, 33, '_menu_item_object', 'page'),
(92, 33, '_menu_item_target', ''),
(93, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(94, 33, '_menu_item_xfn', ''),
(95, 33, '_menu_item_url', ''),
(97, 35, '_menu_item_type', 'post_type'),
(98, 35, '_menu_item_menu_item_parent', '0'),
(99, 35, '_menu_item_object_id', '7'),
(100, 35, '_menu_item_object', 'page'),
(101, 35, '_menu_item_target', ''),
(102, 35, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(103, 35, '_menu_item_xfn', ''),
(104, 35, '_menu_item_url', ''),
(106, 36, '_wp_attached_file', '2020/12/vsmti_en_logo_small.png'),
(107, 36, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:179;s:6:\"height\";i:104;s:4:\"file\";s:31:\"2020/12/vsmti_en_logo_small.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"vsmti_en_logo_small-150x104.png\";s:5:\"width\";i:150;s:6:\"height\";i:104;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(108, 37, '_wp_attached_file', '2020/12/logo.png'),
(109, 37, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:324;s:6:\"height\";i:59;s:4:\"file\";s:16:\"2020/12/logo.png\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"logo-300x55.png\";s:5:\"width\";i:300;s:6:\"height\";i:55;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"logo-150x59.png\";s:5:\"width\";i:150;s:6:\"height\";i:59;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(121, 73, '_wp_attached_file', '2020/12/Gospoda_glembajevi.jpg'),
(122, 73, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:293;s:4:\"file\";s:30:\"2020/12/Gospoda_glembajevi.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"Gospoda_glembajevi-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(127, 76, '_wp_attached_file', '2020/12/preobra-enja-a-4cbd4cf584e43.jpg'),
(128, 76, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:283;s:6:\"height\";i:373;s:4:\"file\";s:40:\"2020/12/preobra-enja-a-4cbd4cf584e43.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"preobra-enja-a-4cbd4cf584e43-228x300.jpg\";s:5:\"width\";i:228;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"preobra-enja-a-4cbd4cf584e43-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(135, 81, '_wp_attached_file', '2020/12/Dundo_Maroje_Zg_1008.jpg'),
(136, 81, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:514;s:6:\"height\";i:759;s:4:\"file\";s:32:\"2020/12/Dundo_Maroje_Zg_1008.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"Dundo_Maroje_Zg_1008-203x300.jpg\";s:5:\"width\";i:203;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"Dundo_Maroje_Zg_1008-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(142, 85, '_wp_attached_file', '2020/12/k_534915_640.jpg'),
(143, 85, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:4:\"file\";s:24:\"2020/12/k_534915_640.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:24:\"k_534915_640-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"k_534915_640-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(147, 92, '_wp_attached_file', '2021/01/12468132.jpg'),
(148, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:271;s:6:\"height\";i:475;s:4:\"file\";s:20:\"2021/01/12468132.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"12468132-171x300.jpg\";s:5:\"width\";i:171;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"12468132-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(160, 96, '_menu_item_type', 'post_type_archive'),
(161, 96, '_menu_item_menu_item_parent', '0'),
(162, 96, '_menu_item_object_id', '-16'),
(163, 96, '_menu_item_object', 'knjiga'),
(164, 96, '_menu_item_target', ''),
(165, 96, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(166, 96, '_menu_item_xfn', ''),
(167, 96, '_menu_item_url', ''),
(172, 100, '_edit_last', '1'),
(173, 100, '_wp_page_template', 'login.php'),
(182, 100, '_edit_lock', '1610033848:1'),
(183, 103, '_menu_item_type', 'post_type'),
(184, 103, '_menu_item_menu_item_parent', '0'),
(185, 103, '_menu_item_object_id', '100'),
(186, 103, '_menu_item_object', 'page'),
(187, 103, '_menu_item_target', ''),
(188, 103, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(189, 103, '_menu_item_xfn', ''),
(190, 103, '_menu_item_url', ''),
(191, 103, '_menu_item_orphaned', '1609842638'),
(203, 106, '_edit_last', '1'),
(204, 106, '_edit_lock', '1610018956:1'),
(205, 106, '_wp_page_template', 'registracija.php'),
(217, 110, '_edit_last', '1'),
(218, 110, '_edit_lock', '1610033847:1'),
(219, 110, '_wp_page_template', 'profil.php'),
(228, 113, '_edit_last', '1'),
(229, 113, '_edit_lock', '1610035691:1'),
(230, 114, '_edit_last', '1'),
(231, 114, '_edit_lock', '1610035695:1'),
(232, 115, '_edit_last', '1'),
(233, 115, '_edit_lock', '1610035711:1'),
(234, 116, '_edit_last', '1'),
(235, 116, '_edit_lock', '1610035721:1'),
(236, 117, '_edit_last', '1'),
(237, 117, '_edit_lock', '1610962513:1'),
(238, 119, '_edit_last', '1'),
(239, 119, '_edit_lock', '1610099971:1'),
(240, 119, '_wp_page_template', 'kosarica.php'),
(241, 120, '_menu_item_type', 'post_type'),
(242, 120, '_menu_item_menu_item_parent', '0'),
(243, 120, '_menu_item_object_id', '119'),
(244, 120, '_menu_item_object', 'page'),
(245, 120, '_menu_item_target', ''),
(246, 120, '_menu_item_classes', 'a:1:{i:0;s:8:\"kosarica\";}'),
(247, 120, '_menu_item_xfn', ''),
(248, 120, '_menu_item_url', ''),
(249, 24, '_wp_page_template', 'default'),
(254, 131, '_wp_attached_file', '2021/01/news.jpg'),
(255, 131, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:700;s:6:\"height\";i:394;s:4:\"file\";s:16:\"2021/01/news.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"news-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"news-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(264, 7, '_wp_page_template', 'default'),
(268, 134, '_edit_last', '1'),
(269, 134, '_edit_lock', '1610198297:1'),
(270, 135, '_wp_attached_file', '2021/01/Djeca-djeci-Akcija-darivanja-igracaka-900-x-600.jpg'),
(271, 135, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:59:\"2021/01/Djeca-djeci-Akcija-darivanja-igracaka-900-x-600.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"Djeca-djeci-Akcija-darivanja-igracaka-900-x-600-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"Djeca-djeci-Akcija-darivanja-igracaka-900-x-600-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"Djeca-djeci-Akcija-darivanja-igracaka-900-x-600-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(272, 134, '_thumbnail_id', '135'),
(275, 137, '_edit_last', '1'),
(276, 137, '_edit_lock', '1610198484:1'),
(282, 140, '_wp_attached_file', '2021/01/zavicajci-300x160-1.png'),
(283, 140, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:160;s:4:\"file\";s:31:\"2021/01/zavicajci-300x160-1.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"zavicajci-300x160-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(284, 137, '_thumbnail_id', '140'),
(287, 141, '_edit_last', '1'),
(288, 141, '_edit_lock', '1610222321:1'),
(291, 141, '_oembed_f903538245571e170d162020d0052b7a', '<iframe title=\"Ivana Vidak - Kako napisati rad...\" width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/U44LrBNuTxI?feature=oembed\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(292, 141, '_oembed_time_f903538245571e170d162020d0052b7a', '1610198761'),
(293, 143, '_wp_attached_file', '2021/01/Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad-.jpg'),
(294, 143, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:64:\"2021/01/Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad-.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:64:\"Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad--300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:64:\"Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad--150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:64:\"Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad--768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(295, 141, '_thumbnail_id', '143'),
(312, 31, '_wp_page_template', 'repo.php'),
(313, 162, '_edit_last', '1'),
(314, 162, '_edit_lock', '1610962571:1'),
(315, 162, 'smjer_rada', 'Menadžment'),
(316, 163, '_edit_last', '1'),
(317, 163, '_edit_lock', '1610965475:1'),
(318, 163, 'smjer_rada', 'Računarstvo'),
(319, 164, '_edit_last', '1'),
(320, 164, '_edit_lock', '1610967274:1'),
(321, 164, 'smjer_rada', 'Elektrotehnika'),
(345, 167, '_edit_last', '1'),
(346, 167, '_edit_lock', '1610369306:1'),
(347, 168, '_wp_attached_file', '2021/01/unnamed.gif'),
(348, 168, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:156;s:6:\"height\";i:200;s:4:\"file\";s:19:\"2021/01/unnamed.gif\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"unnamed-150x150.gif\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/gif\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(349, 167, '_thumbnail_id', '168'),
(350, 169, '_edit_last', '1'),
(351, 169, '_edit_lock', '1610369725:1'),
(352, 169, 'autori_knjige', 'Fikret Bahtijarević-Šiber'),
(353, 171, '_wp_attached_file', '2021/01/030347.jpg'),
(354, 171, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:799;s:6:\"height\";i:1000;s:4:\"file\";s:18:\"2021/01/030347.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"030347-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"030347-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"030347-768x961.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:961;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(355, 169, '_thumbnail_id', '171'),
(356, 172, '_edit_last', '1'),
(357, 172, '_edit_lock', '1610369434:1'),
(358, 173, '_wp_attached_file', '2021/01/download.jpg'),
(359, 173, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:184;s:4:\"file\";s:20:\"2021/01/download.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"download-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(360, 172, '_thumbnail_id', '173'),
(361, 174, '_edit_last', '1'),
(362, 174, '_edit_lock', '1610369567:1'),
(363, 174, 'autori_knjige', 'Bert Bates'),
(364, 176, '_wp_attached_file', '2021/01/51BSxeykubL._SX258_BO1204203200_.jpg'),
(365, 176, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:301;s:4:\"file\";s:44:\"2021/01/51BSxeykubL._SX258_BO1204203200_.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"51BSxeykubL._SX258_BO1204203200_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(366, 174, '_thumbnail_id', '176'),
(367, 177, '_edit_last', '1'),
(368, 177, '_edit_lock', '1610369703:1'),
(369, 179, '_edit_last', '1'),
(370, 179, '_edit_lock', '1610369596:1'),
(371, 180, '_wp_attached_file', '2021/01/download-1.jpg'),
(372, 180, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:252;s:4:\"file\";s:22:\"2021/01/download-1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"download-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(373, 179, '_thumbnail_id', '180'),
(374, 181, '_wp_attached_file', '2021/01/Clrs3.jpeg'),
(375, 181, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:297;s:6:\"height\";i:335;s:4:\"file\";s:18:\"2021/01/Clrs3.jpeg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"Clrs3-266x300.jpeg\";s:5:\"width\";i:266;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"Clrs3-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(376, 177, '_thumbnail_id', '181'),
(377, 177, 'autori_knjige', 'Thomas H. Cormen'),
(378, 184, '_edit_last', '1'),
(379, 184, '_edit_lock', '1610369836:1'),
(380, 185, '_wp_attached_file', '2021/01/Joel_Spolsky_2014-06-18.jpg'),
(381, 185, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2130;s:6:\"height\";i:2112;s:4:\"file\";s:35:\"2021/01/Joel_Spolsky_2014-06-18.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"Joel_Spolsky_2014-06-18-300x297.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:297;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"Joel_Spolsky_2014-06-18-1024x1015.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1015;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"Joel_Spolsky_2014-06-18-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"Joel_Spolsky_2014-06-18-768x762.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:762;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:37:\"Joel_Spolsky_2014-06-18-1536x1523.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1523;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:37:\"Joel_Spolsky_2014-06-18-2048x2031.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:2031;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:8:\"GT-I9300\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1403123671\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"3.7\";s:3:\"iso\";s:2:\"80\";s:13:\"shutter_speed\";s:4:\"0.05\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(382, 184, '_thumbnail_id', '185'),
(383, 188, '_edit_last', '1'),
(384, 188, '_edit_lock', '1610369903:1'),
(385, 189, '_wp_attached_file', '2021/01/41Egb0W3JiL._SX404_BO1204203200_.jpg'),
(386, 189, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:406;s:6:\"height\";i:500;s:4:\"file\";s:44:\"2021/01/41Egb0W3JiL._SX404_BO1204203200_.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"41Egb0W3JiL._SX404_BO1204203200_-244x300.jpg\";s:5:\"width\";i:244;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"41Egb0W3JiL._SX404_BO1204203200_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(387, 188, '_thumbnail_id', '189'),
(388, 188, 'autori_knjige', 'Avram Joel Spolsky'),
(389, 191, '_edit_last', '1'),
(390, 191, '_edit_lock', '1610369987:1'),
(391, 192, '_wp_attached_file', '2021/01/2002f35249b6c2bd1fbf.jpeg'),
(392, 192, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:540;s:6:\"height\";i:326;s:4:\"file\";s:33:\"2021/01/2002f35249b6c2bd1fbf.jpeg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"2002f35249b6c2bd1fbf-300x181.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:181;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"2002f35249b6c2bd1fbf-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(393, 191, '_thumbnail_id', '192'),
(394, 193, '_edit_last', '1'),
(395, 193, '_edit_lock', '1610370071:1'),
(396, 194, '_wp_attached_file', '2021/01/Ruralni-turizam-u-Hrvatskoj_MEP-scaled.jpg'),
(397, 194, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1851;s:6:\"height\";i:2560;s:4:\"file\";s:50:\"2021/01/Ruralni-turizam-u-Hrvatskoj_MEP-scaled.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:43:\"Ruralni-turizam-u-Hrvatskoj_MEP-217x300.jpg\";s:5:\"width\";i:217;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:44:\"Ruralni-turizam-u-Hrvatskoj_MEP-740x1024.jpg\";s:5:\"width\";i:740;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:43:\"Ruralni-turizam-u-Hrvatskoj_MEP-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:44:\"Ruralni-turizam-u-Hrvatskoj_MEP-768x1062.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1062;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:45:\"Ruralni-turizam-u-Hrvatskoj_MEP-1110x1536.jpg\";s:5:\"width\";i:1110;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:45:\"Ruralni-turizam-u-Hrvatskoj_MEP-1480x2048.jpg\";s:5:\"width\";i:1480;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:35:\"Ruralni-turizam-u-Hrvatskoj_MEP.jpg\";}'),
(398, 193, '_thumbnail_id', '194'),
(399, 193, 'autori_knjige', 'Damir Demonja'),
(400, 196, '_edit_last', '1'),
(401, 196, '_edit_lock', '1610370274:1'),
(402, 197, '_wp_attached_file', '2021/01/Branko_Blazevic2.jpg'),
(403, 197, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:28:\"2021/01/Branko_Blazevic2.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"Branko_Blazevic2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"Branko_Blazevic2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(404, 196, '_thumbnail_id', '197'),
(405, 198, '_edit_last', '1'),
(406, 198, '_edit_lock', '1610370354:1'),
(407, 199, '_wp_attached_file', '2021/01/028459.jpg'),
(408, 199, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:456;s:6:\"height\";i:698;s:4:\"file\";s:18:\"2021/01/028459.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"028459-196x300.jpg\";s:5:\"width\";i:196;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"028459-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(409, 198, '_thumbnail_id', '199'),
(410, 198, 'autori_knjige', 'Branko Blažević'),
(411, 201, '_edit_last', '1'),
(412, 201, '_edit_lock', '1610370686:1'),
(413, 202, '_edit_last', '1'),
(414, 202, '_edit_lock', '1610370593:1'),
(415, 203, '_wp_attached_file', '2021/01/AlterSteven_2010.jpg'),
(416, 203, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:380;s:6:\"height\";i:430;s:4:\"file\";s:28:\"2021/01/AlterSteven_2010.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"AlterSteven_2010-265x300.jpg\";s:5:\"width\";i:265;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"AlterSteven_2010-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.8\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:12:\"Canon EOS 5D\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1265618644\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"110\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:17:\"0.016666666666667\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(417, 202, '_thumbnail_id', '203'),
(418, 201, 'autori_knjige', 'Steven Alter'),
(419, 205, '_wp_attached_file', '2021/01/51K1MGDQ1VL._SX364_BO1204203200_.jpg'),
(420, 205, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:366;s:6:\"height\";i:474;s:4:\"file\";s:44:\"2021/01/51K1MGDQ1VL._SX364_BO1204203200_.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"51K1MGDQ1VL._SX364_BO1204203200_-232x300.jpg\";s:5:\"width\";i:232;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"51K1MGDQ1VL._SX364_BO1204203200_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(421, 201, '_thumbnail_id', '205'),
(422, 207, '_wp_attached_file', '2021/01/Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1.jpg'),
(423, 207, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2560;s:6:\"height\";i:1936;s:4:\"file\";s:91:\"2021/01/Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:91:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-300x227.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:227;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:92:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-1024x774.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:774;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:91:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:91:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-768x581.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:581;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:93:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-1536x1162.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1162;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:93:\"Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1-2048x1549.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1549;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(424, 206, '_edit_last', '1'),
(425, 206, '_thumbnail_id', '207'),
(426, 206, '_edit_lock', '1610372568:1'),
(427, 208, '_edit_last', '1'),
(428, 208, '_edit_lock', '1610963293:1'),
(429, 209, '_wp_attached_file', '2021/01/030686.jpg'),
(430, 209, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:673;s:6:\"height\";i:1000;s:4:\"file\";s:18:\"2021/01/030686.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"030686-202x300.jpg\";s:5:\"width\";i:202;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"030686-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(431, 208, '_thumbnail_id', '209'),
(432, 208, 'autori_knjige', 'Petar Biljanović'),
(433, 212, '_edit_last', '1'),
(434, 212, '_edit_lock', '1610964621:1'),
(435, 164, 'mentor_rada', 'Silvio Hrabar'),
(436, 213, '_edit_last', '1'),
(437, 213, '_edit_lock', '1610965859:1'),
(438, 163, 'mentor_rada', 'test'),
(439, 214, '_wp_attached_file', '2021/01/TN.jpg'),
(440, 214, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:141;s:6:\"height\";i:200;s:4:\"file\";s:14:\"2021/01/TN.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"TN-141x150.jpg\";s:5:\"width\";i:141;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(441, 164, '_thumbnail_id', '214'),
(442, 213, '_wp_trash_meta_status', 'publish'),
(443, 213, '_wp_trash_meta_time', '1610967317'),
(444, 213, '_wp_desired_post_slug', 'test-2'),
(445, 212, '_wp_trash_meta_status', 'publish'),
(446, 212, '_wp_trash_meta_time', '1610967318'),
(447, 212, '_wp_desired_post_slug', 'test'),
(448, 215, '_edit_last', '1'),
(449, 215, '_edit_lock', '1610967269:1'),
(450, 216, '_wp_attached_file', '2021/01/p6656.jpg'),
(451, 216, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:533;s:4:\"file\";s:17:\"2021/01/p6656.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"p6656-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"p6656-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:17:\"p6656-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(452, 215, '_thumbnail_id', '216'),
(453, 219, '_wp_attached_file', '2021/01/ikonixa.png'),
(454, 219, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:300;s:6:\"height\";i:300;s:4:\"file\";s:19:\"2021/01/ikonixa.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"ikonixa-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(455, 220, '_wp_attached_file', '2021/01/Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png'),
(456, 220, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1000;s:6:\"height\";i:1000;s:4:\"file\";s:82:\"2021/01/Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:82:\"Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:82:\"Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:82:\"Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(457, 221, '_wp_attached_file', '2021/01/cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png'),
(458, 221, '_wp_attachment_context', 'site-icon'),
(459, 221, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:90:\"2021/01/cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:90:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:90:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:90:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:90:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:90:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:88:\"cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(460, 222, '_wp_trash_meta_status', 'publish'),
(461, 222, '_wp_trash_meta_time', '1611583919'),
(473, 226, '_edit_last', '1'),
(474, 226, '_edit_lock', '1611838323:1'),
(475, 227, '_edit_last', '1'),
(476, 227, '_edit_lock', '1611838378:1'),
(477, 227, 'autori_knjige', 'Hubert Meluzin'),
(478, 229, '_edit_last', '1'),
(479, 229, '_edit_lock', '1611838850:1'),
(480, 230, '_edit_last', '1'),
(481, 230, '_edit_lock', '1611838932:1'),
(482, 231, '_wp_attached_file', '2021/01/433506_digitalni-sustavi_420x610r.jpg'),
(483, 231, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:420;s:6:\"height\";i:610;s:4:\"file\";s:45:\"2021/01/433506_digitalni-sustavi_420x610r.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"433506_digitalni-sustavi_420x610r-207x300.jpg\";s:5:\"width\";i:207;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"433506_digitalni-sustavi_420x610r-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(484, 230, '_thumbnail_id', '231'),
(485, 230, 'autori_knjige', 'Vlado Glavinić'),
(486, 233, '_edit_last', '1'),
(487, 233, '_edit_lock', '1611839060:1'),
(488, 234, '_wp_attached_file', '2021/01/5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium.jpg'),
(489, 234, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:550;s:6:\"height\";i:550;s:4:\"file\";s:55:\"2021/01/5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:55:\"5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:55:\"5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(490, 233, '_thumbnail_id', '234'),
(491, 235, '_edit_last', '1'),
(492, 235, '_edit_lock', '1611839137:1'),
(493, 236, '_wp_attached_file', '2021/01/download-2.jpg'),
(494, 236, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:196;s:6:\"height\";i:257;s:4:\"file\";s:22:\"2021/01/download-2.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"download-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(495, 235, '_thumbnail_id', '236'),
(496, 235, 'autori_knjige', 'Michael McCallister'),
(497, 238, '_edit_last', '1'),
(498, 238, '_edit_lock', '1611839241:1'),
(499, 239, '_wp_attached_file', '2021/01/unnamed.jpg'),
(500, 239, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:424;s:6:\"height\";i:512;s:4:\"file\";s:19:\"2021/01/unnamed.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"unnamed-248x300.jpg\";s:5:\"width\";i:248;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"unnamed-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(501, 238, '_thumbnail_id', '239'),
(502, 240, '_edit_last', '1'),
(503, 240, '_edit_lock', '1611839313:1'),
(504, 240, 'autori_knjige', 'Boris Demidovič'),
(505, 242, '_wp_attached_file', '2021/01/132537.jpg'),
(506, 242, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:704;s:6:\"height\";i:1000;s:4:\"file\";s:18:\"2021/01/132537.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"132537-211x300.jpg\";s:5:\"width\";i:211;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"132537-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(507, 240, '_thumbnail_id', '242');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(7, 1, '2020-12-13 16:22:43', '2020-12-13 16:22:43', 'Knjižnica Visoke škole za menadžment u turizmu i informatici u Virovitici posjeduje fond knjižne građe koji je specifičan za potrebe visokoškolskog obrazovanja u informatičkom menadžmentu, ruralnom turizmu, poduzetništvu, računarstvu i elektrotehnici. Literatura se nabavlja u skladu s potrebama nastave pojedinog kolegija.\r\n\r\nUz navedeni fond, knjižnica posjeduje i referentnu zbirku (zbirka rječnika, atlasa, enciklopedija) i zbirku periodike (aktualni naslovi).\r\nUz literaturu na hrvatskom jeziku, posjeduje i zbirku na engleskom jeziku koja pokriva područja psihologije, obrazovanja, ekonomije, medicine, matematike, biologije i kemije, te zbirku završnih radova prvostupnika Visoke škole za menadžment u turizmu i informatici u Virovitici.\r\n\r\nVSMTI Knjižnica se nalazi u zgradi Visoke škole u prostoriji 1-14.\r\n\r\nUpisi u knjižnicu se vrši prilikom upisa u prvu godinu studija. Dolaskom u Knjižnicu Visoke škole Virovitica, ispunjavanjem Upitnika za članstvo, koje je besplatno. Traženi naslov literature (pregled knjižničnog kataloga) možete pronaći OVDJE. Odjednom se može posuditi dva primjerka knjižne građe na rok od 14 dana, uz mogućnost produživanja roka posudbe.\r\n\r\n\r\n<strong>Kontakt:</strong>\r\nPrizemlje Visoke škole Virovitica (1-14) \r\nMatije Gupca 78, 33 000 Virovitica\r\n<strong>Tel.</strong> 033 492 256\r\n<strong>E-mail:</strong> ivana.vidak@vsmti.hr\r\n\r\n', 'Knjižnica Visoke škole', '', 'publish', 'closed', 'closed', '', 'knjiznica-visoke-skole', '', '', '2021-01-18 14:02:21', '2021-01-18 14:02:21', '', 0, 'http://localhost/wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2020-12-13 16:22:43', '2020-12-13 16:22:43', 'Dobro ošli!', 'Knjižnica Visoke Škole', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-12-13 16:22:43', '2020-12-13 16:22:43', '', 7, 'http://localhost/wordpress/2020/12/13/7-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2020-12-14 09:07:27', '2020-12-14 09:07:27', 'Dobro ošli!\r\n\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', 'Knjižnica Visoke Škole', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2020-12-14 09:07:27', '2020-12-14 09:07:27', '', 7, 'http://localhost/wordpress/2020/12/14/7-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2020-12-14 12:01:56', '2020-12-14 12:01:56', '', 'Vijesti', '', 'publish', 'closed', 'closed', '', 'vijesti', '', '', '2021-01-09 11:41:36', '2021-01-09 11:41:36', '', 0, 'http://localhost/wordpress/?page_id=20', 0, 'page', '', 0),
(21, 1, '2020-12-14 12:01:56', '2020-12-14 12:01:56', '', 'Vijesit', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2020-12-14 12:01:56', '2020-12-14 12:01:56', '', 20, 'http://localhost/wordpress/20-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2020-12-14 12:02:19', '2020-12-14 12:02:19', '<p class=\"display-3\" style=\"padding-bottom:25px;\">Visoka škola za menadžment u turizmu i informatici</p>\r\n<div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'publish', 'closed', 'closed', '', 'o-nama', '', '', '2021-01-08 16:49:53', '2021-01-08 16:49:53', '', 0, 'http://localhost/wordpress/?page_id=24', 0, 'page', '', 0),
(25, 1, '2020-12-14 12:02:19', '2020-12-14 12:02:19', '', 'Diplomski i seminarski radovi', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2020-12-14 12:02:19', '2020-12-14 12:02:19', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2020-12-14 12:02:24', '2020-12-14 12:02:24', '', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2020-12-14 12:02:24', '2020-12-14 12:02:24', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2020-12-14 12:02:42', '2020-12-14 12:02:42', ' ', '', '', 'publish', 'closed', 'closed', '', '27', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/?p=27', 5, 'nav_menu_item', '', 0),
(29, 1, '2020-12-14 12:02:42', '2020-12-14 12:02:42', ' ', '', '', 'publish', 'closed', 'closed', '', '29', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/?p=29', 4, 'nav_menu_item', '', 0),
(31, 1, '2020-12-14 12:03:16', '2020-12-14 12:03:16', '', 'Akademski radovi', '', 'publish', 'closed', 'closed', '', 'diplomski-i-seminarski-radovi-2', '', '', '2021-01-09 14:28:09', '2021-01-09 14:28:09', '', 0, 'http://localhost/wordpress/?page_id=31', 0, 'page', '', 0),
(32, 1, '2020-12-14 12:03:16', '2020-12-14 12:03:16', '', 'Diplomski i seminarski radovi', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2020-12-14 12:03:16', '2020-12-14 12:03:16', '', 31, 'http://localhost/wordpress/31-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2020-12-14 12:03:32', '2020-12-14 12:03:32', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/?p=33', 3, 'nav_menu_item', '', 0),
(34, 1, '2020-12-14 12:03:47', '2020-12-14 12:03:47', '', 'Vijesti', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2020-12-14 12:03:47', '2020-12-14 12:03:47', '', 20, 'http://localhost/wordpress/20-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2020-12-14 12:05:38', '2020-12-14 12:05:38', '', 'Početna', '', 'publish', 'closed', 'closed', '', '35', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/?p=35', 1, 'nav_menu_item', '', 0),
(36, 1, '2020-12-14 13:43:35', '2020-12-14 13:43:35', '', 'vsmti_en_logo_small', '', 'inherit', 'open', 'closed', '', 'vsmti_en_logo_small', '', '', '2020-12-14 13:43:35', '2020-12-14 13:43:35', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/vsmti_en_logo_small.png', 0, 'attachment', 'image/png', 0),
(37, 1, '2020-12-14 14:00:01', '2020-12-14 14:00:01', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2020-12-14 14:00:01', '2020-12-14 14:00:01', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/logo.png', 0, 'attachment', 'image/png', 0),
(73, 1, '2020-12-16 09:48:53', '2020-12-16 09:48:53', '', 'Gospoda_glembajevi', '', 'inherit', 'open', 'closed', '', 'gospoda_glembajevi', '', '', '2020-12-16 09:48:53', '2020-12-16 09:48:53', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/Gospoda_glembajevi.jpg', 0, 'attachment', 'image/jpeg', 0),
(76, 1, '2020-12-16 19:15:49', '2020-12-16 19:15:49', '', 'preobra-enja-a-4cbd4cf584e43', '', 'inherit', 'open', 'closed', '', 'preobra-enja-a-4cbd4cf584e43', '', '', '2020-12-16 19:15:49', '2020-12-16 19:15:49', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/preobra-enja-a-4cbd4cf584e43.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2020-12-16 19:17:54', '2020-12-16 19:17:54', '', 'Dundo_Maroje_Zg_1008', '', 'inherit', 'open', 'closed', '', 'dundo_maroje_zg_1008', '', '', '2020-12-16 19:17:54', '2020-12-16 19:17:54', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/Dundo_Maroje_Zg_1008.jpg', 0, 'attachment', 'image/jpeg', 0),
(85, 1, '2020-12-21 14:11:19', '2020-12-21 14:11:19', '', 'k_534915_640', '', 'inherit', 'open', 'closed', '', 'k_534915_640', '', '', '2020-12-21 14:11:19', '2020-12-21 14:11:19', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/12/k_534915_640.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2021-01-02 09:49:22', '2021-01-02 09:49:22', '', '12468132', '', 'inherit', 'open', 'closed', '', '12468132', '', '', '2021-01-02 09:49:22', '2021-01-02 09:49:22', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/01/12468132.jpg', 0, 'attachment', 'image/jpeg', 0),
(95, 1, '2021-01-02 11:10:28', '2021-01-02 11:10:28', '', 'Akademski radovi', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2021-01-02 11:10:28', '2021-01-02 11:10:28', '', 31, 'http://localhost/wordpress/31-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2021-01-02 11:16:50', '2021-01-02 11:16:50', 'Knjiga', 'Knjižnični katalog', '', 'publish', 'closed', 'closed', '', '96', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/?p=96', 2, 'nav_menu_item', '', 0),
(100, 1, '2021-01-05 10:30:28', '2021-01-05 10:30:28', '', 'Prijava', '', 'publish', 'closed', 'closed', '', 'prijava', '', '', '2021-01-05 10:30:28', '2021-01-05 10:30:28', '', 0, 'http://localhost/wordpress/?page_id=100', 0, 'page', '', 0),
(102, 1, '2021-01-05 10:30:28', '2021-01-05 10:30:28', '', 'Prijava', '', 'inherit', 'closed', 'closed', '', '100-revision-v1', '', '', '2021-01-05 10:30:28', '2021-01-05 10:30:28', '', 100, 'http://localhost/wordpress/100-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2021-01-05 10:30:38', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-01-05 10:30:38', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=103', 1, 'nav_menu_item', '', 0),
(106, 1, '2021-01-07 11:30:40', '2021-01-07 11:30:40', '', 'Registracija', '', 'publish', 'closed', 'closed', '', 'registracija', '', '', '2021-01-07 11:31:40', '2021-01-07 11:31:40', '', 0, 'http://localhost/wordpress/?page_id=106', 0, 'page', '', 0),
(108, 1, '2021-01-07 11:30:40', '2021-01-07 11:30:40', '', 'Registracija', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2021-01-07 11:30:40', '2021-01-07 11:30:40', '', 106, 'http://localhost/wordpress/106-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2021-01-07 14:04:31', '2021-01-07 14:04:31', '', 'Profil', '', 'publish', 'closed', 'closed', '', 'profil', '', '', '2021-01-07 14:04:31', '2021-01-07 14:04:31', '', 0, 'http://localhost/wordpress/?page_id=110', 0, 'page', '', 0),
(112, 1, '2021-01-07 14:04:31', '2021-01-07 14:04:31', '', 'Profil', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2021-01-07 14:04:31', '2021-01-07 14:04:31', '', 110, 'http://localhost/wordpress/110-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2021-01-07 16:10:07', '2021-01-07 16:10:07', '', 'Računarstvo', '', 'publish', 'closed', 'closed', '', 'racunarstvo', '', '', '2021-01-07 16:10:35', '2021-01-07 16:10:35', '', 0, 'http://localhost/wordpress/?post_type=smjer&#038;p=113', 0, 'smjer', '', 0),
(114, 1, '2021-01-07 16:10:39', '2021-01-07 16:10:39', '', 'Informatički menadžment', '', 'publish', 'closed', 'closed', '', 'informaticki-menadzment', '', '', '2021-01-07 16:10:39', '2021-01-07 16:10:39', '', 0, 'http://localhost/wordpress/?post_type=smjer&#038;p=114', 0, 'smjer', '', 0),
(115, 1, '2021-01-07 16:10:55', '2021-01-07 16:10:55', '', 'Menadžment ruralnog turizma (MRT)', '', 'publish', 'closed', 'closed', '', 'menadzment-ruralnog-turizma-mrt', '', '', '2021-01-07 16:10:55', '2021-01-07 16:10:55', '', 0, 'http://localhost/wordpress/?post_type=smjer&#038;p=115', 0, 'smjer', '', 0),
(116, 1, '2021-01-07 16:11:05', '2021-01-07 16:11:05', '', 'Elektrotehnika', '', 'publish', 'closed', 'closed', '', 'elektrotehnika', '', '', '2021-01-07 16:11:05', '2021-01-07 16:11:05', '', 0, 'http://localhost/wordpress/?post_type=smjer&#038;p=116', 0, 'smjer', '', 0),
(117, 1, '2021-01-07 16:11:26', '2021-01-07 16:11:26', '', 'Menadžment', '', 'publish', 'closed', 'closed', '', 'menadzment', '', '', '2021-01-07 16:11:26', '2021-01-07 16:11:26', '', 0, 'http://localhost/wordpress/?post_type=smjer&#038;p=117', 0, 'smjer', '', 0),
(119, 1, '2021-01-08 09:54:39', '2021-01-08 09:54:39', '', 'Košarica', '', 'publish', 'closed', 'closed', '', 'kosarica', '', '', '2021-01-08 10:01:55', '2021-01-08 10:01:55', '', 0, 'http://localhost/wordpress/?page_id=119', 0, 'page', '', 0),
(120, 1, '2021-01-08 09:54:39', '2021-01-08 09:54:39', '', '<i class=\"fas fa-shopping-cart\" style=\"padding-right:5px;\"></i>Košarica', '', 'publish', 'closed', 'closed', '', '120', '', '', '2021-01-09 14:22:26', '2021-01-09 14:22:26', '', 0, 'http://localhost/wordpress/120/', 6, 'nav_menu_item', '', 0),
(121, 1, '2021-01-08 09:54:39', '2021-01-08 09:54:39', '', 'Košarica', '', 'inherit', 'closed', 'closed', '', '119-revision-v1', '', '', '2021-01-08 09:54:39', '2021-01-08 09:54:39', '', 119, 'http://localhost/wordpress/119-revision-v1/', 0, 'revision', '', 0),
(122, 1, '2021-01-08 16:43:58', '2021-01-08 16:43:58', ' <div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: https://www.vsmti.hr<br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:43:58', '2021-01-08 16:43:58', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2021-01-08 16:49:00', '2021-01-08 16:49:00', '<p class=\"h3\" style=\"padding-bottom:25px;\">Visoka škola za menadžment u turizmu i informatici</p>\n<div class=\"row\">\n        <div class=\"col\">\n            <p class=\"mbr-text\">\n                <strong>Adresa:</strong><br>\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\n                <br>\n                <br><strong>Kontakti:</strong><br>\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\n\n            </p>\n        </div>\n        <div class=\"col\">\n            <div class=\"google-map\"><iframe\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\n                    tabindex=\"0\"></iframe></div>\n        </div>\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-autosave-v1', '', '', '2021-01-08 16:49:00', '2021-01-08 16:49:00', '', 24, 'http://localhost/wordpress/24-autosave-v1/', 0, 'revision', '', 0),
(124, 1, '2021-01-08 16:46:36', '2021-01-08 16:46:36', ' <div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:46:36', '2021-01-08 16:46:36', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(125, 1, '2021-01-08 16:47:51', '2021-01-08 16:47:51', '<h4>Visoka škola za menadžment u turizmu i informatici</h4> \r\n<div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:47:51', '2021-01-08 16:47:51', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(126, 1, '2021-01-08 16:48:46', '2021-01-08 16:48:46', '<p class=\"h3\">Visoka škola za menadžment u turizmu i informatici</p>\r\n<div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:48:46', '2021-01-08 16:48:46', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(127, 1, '2021-01-08 16:49:01', '2021-01-08 16:49:01', '<p class=\"h3\" style=\"padding-bottom:25px;\">Visoka škola za menadžment u turizmu i informatici</p>\r\n<div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:49:01', '2021-01-08 16:49:01', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2021-01-08 16:49:53', '2021-01-08 16:49:53', '<p class=\"display-3\" style=\"padding-bottom:25px;\">Visoka škola za menadžment u turizmu i informatici</p>\r\n<div class=\"row\">\r\n        <div class=\"col\">\r\n            <p class=\"mbr-text\">\r\n                <strong>Adresa:</strong><br>\r\n                <br>Matije Gupca 78,&nbsp;<br>33000 Virovitica<br>\r\n                <br>\r\n                <br><strong>Kontakti:</strong><br>\r\n                <br>Email: info@vsmti.hr<br>Telefon: 033 721 099<br>Fax: 033 721 037&nbsp;\r\n                <br>Web: <a href=\"https://www.vsmti.hr\">https://www.vsmti.hr</a><br>\r\n\r\n            </p>\r\n        </div>\r\n        <div class=\"col\">\r\n            <div class=\"google-map\"><iframe\r\n                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2779.47171974895!2d17.384985315841156!3d45.841857716184485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4767ea60a94baec7%3A0x458326689edfc1bd!2sUl.%20Matije%20Gupca%2078%2C%2033000%2C%20Virovitica!5e0!3m2!1sen!2shr!4v1592308556469!5m2!1sen!2shr\"\r\n                    width=\"500\" height=\"350\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\"\r\n                    tabindex=\"0\"></iframe></div>\r\n        </div>\r\n    </div>', 'O nama', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2021-01-08 16:49:53', '2021-01-08 16:49:53', '', 24, 'http://localhost/wordpress/24-revision-v1/', 0, 'revision', '', 0),
(131, 1, '2021-01-09 12:09:48', '2021-01-09 12:09:48', '', 'news', '', 'inherit', 'open', 'closed', '', 'news', '', '', '2021-01-09 12:09:48', '2021-01-09 12:09:48', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/01/news.jpg', 0, 'attachment', 'image/jpeg', 0),
(133, 1, '2021-01-09 13:10:47', '2021-01-09 13:10:47', 'Knjižnica Visoke škole za menadžment u turizmu i informatici u Virovitici posjeduje fond knjižne građe koji je specifičan za potrebe visokoškolskog obrazovanja u informatičkom menadžmentu, ruralnom turizmu, poduzetništvu, računarstvu i elektrotehnici. Literatura se nabavlja u skladu s potrebama nastave pojedinog kolegija.\r\n\r\nUz navedeni fond, knjižnica posjeduje i referentnu zbirku (zbirka rječnika, atlasa, enciklopedija) i zbirku periodike (aktualni naslovi).\r\nUz literaturu na hrvatskom jeziku, posjeduje i zbirku na engleskom jeziku koja pokriva područja psihologije, obrazovanja, ekonomije, medicine, matematike, biologije i kemije, te zbirku završnih radova prvostupnika Visoke škole za menadžment u turizmu i informatici u Virovitici.', 'Knjižnica Visoke Škole', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-01-09 13:10:47', '2021-01-09 13:10:47', '', 7, 'http://localhost/wordpress/7-revision-v1/', 0, 'revision', '', 0),
(134, 1, '2021-01-09 13:20:40', '2021-01-09 13:20:40', 'Draga djeco i roditelji!\r\n\r\nKnjižnica organizira akciju prikupljanja igračaka za djecu potresom pogođenih područja.\r\nIgračke se mogu donijeti u Knjižnicu od 7.30 do 19.30 sati.\r\nMi ćemo ih dezinficirati i adekvatno pohraniti.\r\nAkcija traje do kraja siječnja 2021.\r\nDostavu i podjelu će obaviti Gradsko društvo Crvenog križa Virovitica.\r\ninfo:  gkc@vt.t-com.hr  721 940.\r\nPozivamo djecu da daruju djecu!', 'Djeca djeci – akcija darivanja igračaka', '', 'publish', 'open', 'open', '', 'djeca-djeci-akcija-darivanja-igracaka', '', '', '2021-01-09 13:20:40', '2021-01-09 13:20:40', '', 0, 'http://localhost/wordpress/?p=134', 0, 'post', '', 0),
(135, 1, '2021-01-09 13:20:36', '2021-01-09 13:20:36', '', 'Djeca-djeci-Akcija-darivanja-igracaka-900-x-600', '', 'inherit', 'open', 'closed', '', 'djeca-djeci-akcija-darivanja-igracaka-900-x-600', '', '', '2021-01-09 13:20:36', '2021-01-09 13:20:36', '', 134, 'http://localhost/wordpress/wp-content/uploads/2021/01/Djeca-djeci-Akcija-darivanja-igracaka-900-x-600.jpg', 0, 'attachment', 'image/jpeg', 0),
(136, 1, '2021-01-09 13:20:40', '2021-01-09 13:20:40', 'Draga djeco i roditelji!\r\n\r\nKnjižnica organizira akciju prikupljanja igračaka za djecu potresom pogođenih područja.\r\nIgračke se mogu donijeti u Knjižnicu od 7.30 do 19.30 sati.\r\nMi ćemo ih dezinficirati i adekvatno pohraniti.\r\nAkcija traje do kraja siječnja 2021.\r\nDostavu i podjelu će obaviti Gradsko društvo Crvenog križa Virovitica.\r\ninfo:  gkc@vt.t-com.hr  721 940.\r\nPozivamo djecu da daruju djecu!', 'Djeca djeci – akcija darivanja igračaka', '', 'inherit', 'closed', 'closed', '', '134-revision-v1', '', '', '2021-01-09 13:20:40', '2021-01-09 13:20:40', '', 134, 'http://localhost/wordpress/134-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2021-01-09 13:21:45', '2021-01-09 13:21:45', 'Božićno vrijeme je za većinu najdraži ili barem poseban dio godine.\r\nSjećamo se snijega, djetinjstva, doma ispunjenog mirisima finih kolača, darova… Pitali smo naše ugledne zavičajne autore koja ih knjiga ili događaj podsjećaju na Božić? Njihova najdraža božićna priča ili pjesma? Čega se rado prisjećaju?\r\n\r\nRoko Idžojtić, autor stripa i prof. likovne kulture, je rekao da u adventsko i božićno vrijeme voli čitati sa svojom djecom i uživati u ilustracijama u Andersenovom djelu Snježna kraljica. U bajci se ne spominje Isus, Marija i sv. Tri kralja, ali to je priča o vječnoj borbi dobra i zla u kojoj zli razbija čarobno ogledalo, otrovana krhotina završi u oku dječaka čije se srce potom zaledi. Zarobljenog u dvorcu Snježne kraljice spašava svojom dobrotom djevojčica Gerda.\r\nRođenje malog djeteta također je donijelo dobro cijelom čovječanstvu, pa je u redu zapitati se koliko smo dobri, koliko dobra činimo. Roko je preporučio i istoimeni film te poželio sretan Božić, zdravu, mirnu, uspješnu i veselu Novu godinu.', 'O Božiću su rekli ugledni zavičajni autori', '', 'publish', 'open', 'open', '', 'o-bozicu-su-rekli-ugledni-zavicajni-autori', '', '', '2021-01-09 13:23:47', '2021-01-09 13:23:47', '', 0, 'http://localhost/wordpress/?p=137', 0, 'post', '', 0),
(139, 1, '2021-01-09 13:21:45', '2021-01-09 13:21:45', 'Božićno vrijeme je za većinu najdraži ili barem poseban dio godine.\r\nSjećamo se snijega, djetinjstva, doma ispunjenog mirisima finih kolača, darova… Pitali smo naše ugledne zavičajne autore koja ih knjiga ili događaj podsjećaju na Božić? Njihova najdraža božićna priča ili pjesma? Čega se rado prisjećaju?\r\n\r\nRoko Idžojtić, autor stripa i prof. likovne kulture, je rekao da u adventsko i božićno vrijeme voli čitati sa svojom djecom i uživati u ilustracijama u Andersenovom djelu Snježna kraljica. U bajci se ne spominje Isus, Marija i sv. Tri kralja, ali to je priča o vječnoj borbi dobra i zla u kojoj zli razbija čarobno ogledalo, otrovana krhotina završi u oku dječaka čije se srce potom zaledi. Zarobljenog u dvorcu Snježne kraljice spašava svojom dobrotom djevojčica Gerda.\r\nRođenje malog djeteta također je donijelo dobro cijelom čovječanstvu, pa je u redu zapitati se koliko smo dobri, koliko dobra činimo. Roko je preporučio i istoimeni film te poželio sretan Božić, zdravu, mirnu, uspješnu i veselu Novu godinu.', 'O Božiću su rekli ugledni zavičajni autori', '', 'inherit', 'closed', 'closed', '', '137-revision-v1', '', '', '2021-01-09 13:21:45', '2021-01-09 13:21:45', '', 137, 'http://localhost/wordpress/137-revision-v1/', 0, 'revision', '', 0),
(140, 1, '2021-01-09 13:23:44', '2021-01-09 13:23:44', '', 'zavicajci-300x160', '', 'inherit', 'open', 'closed', '', 'zavicajci-300x160', '', '', '2021-01-09 13:23:44', '2021-01-09 13:23:44', '', 137, 'http://localhost/wordpress/wp-content/uploads/2021/01/zavicajci-300x160-1.png', 0, 'attachment', 'image/png', 0),
(141, 1, '2021-01-09 13:25:59', '2021-01-09 13:25:59', 'Kako prepoznati lažne izvore?\r\nKako doći do relevantnih podataka?\r\n\r\nKorisne savjete i upute iz informacijske pismenosti poslušajte u izlaganju naše gošće <strong>Ivane Vidak, dipl. bibl. i prof, v. pred.</strong>\r\n\r\n<br><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/U44LrBNuTxI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'VIDEO Kako napisati (izvrstan) završni rad?', '', 'publish', 'open', 'open', '', 'video-kako-napisati-izvrstan-zavrsni-rad', '', '', '2021-01-09 20:01:02', '2021-01-09 20:01:02', '', 0, 'http://localhost/wordpress/?p=141', 0, 'post', '', 0),
(142, 1, '2021-01-09 13:25:59', '2021-01-09 13:25:59', 'Kako prepoznati lažne izvore?\r\nKako doći do relevantnih podataka?\r\n\r\nKorisne savjete i upute iz informacijske pismenosti poslušajte u izlaganju naše gošće <strong>Ivane Vidak, dipl. bibl. i prof, v. pred.</strong>\r\n\r\n\r\nhttps://www.youtube.com/watch?v=U44LrBNuTxI&feature=emb_title', 'VIDEO Kako napisati (izvrstan) završni rad?', '', 'inherit', 'closed', 'closed', '', '141-revision-v1', '', '', '2021-01-09 13:25:59', '2021-01-09 13:25:59', '', 141, 'http://localhost/wordpress/141-revision-v1/', 0, 'revision', '', 0),
(143, 1, '2021-01-09 13:26:20', '2021-01-09 13:26:20', '', 'Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad-', '', 'inherit', 'open', 'closed', '', 'screenshot_2020-12-09-ivana-vidak-kako-napisati-rad', '', '', '2021-01-09 13:26:20', '2021-01-09 13:26:20', '', 141, 'http://localhost/wordpress/wp-content/uploads/2021/01/Screenshot_2020-12-09-Ivana-Vidak-Kako-napisati-rad-.jpg', 0, 'attachment', 'image/jpeg', 0),
(144, 1, '2021-01-09 13:27:23', '2021-01-09 13:27:23', 'Kako prepoznati lažne izvore?\r\nKako doći do relevantnih podataka?\r\n\r\nKorisne savjete i upute iz informacijske pismenosti poslušajte u izlaganju naše gošće <strong>Ivane Vidak, dipl. bibl. i prof, v. pred.</strong>\r\n\r\n\r\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/U44LrBNuTxI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'VIDEO Kako napisati (izvrstan) završni rad?', '', 'inherit', 'closed', 'closed', '', '141-revision-v1', '', '', '2021-01-09 13:27:23', '2021-01-09 13:27:23', '', 141, 'http://localhost/wordpress/141-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2021-01-09 14:22:59', '2021-01-09 14:22:59', 'Knjižnica Visoke škole za menadžment u turizmu i informatici u Virovitici posjeduje fond knjižne građe koji je specifičan za potrebe visokoškolskog obrazovanja u informatičkom menadžmentu, ruralnom turizmu, poduzetništvu, računarstvu i elektrotehnici. Literatura se nabavlja u skladu s potrebama nastave pojedinog kolegija.\r\n\r\nUz navedeni fond, knjižnica posjeduje i referentnu zbirku (zbirka rječnika, atlasa, enciklopedija) i zbirku periodike (aktualni naslovi).\r\nUz literaturu na hrvatskom jeziku, posjeduje i zbirku na engleskom jeziku koja pokriva područja psihologije, obrazovanja, ekonomije, medicine, matematike, biologije i kemije, te zbirku završnih radova prvostupnika Visoke škole za menadžment u turizmu i informatici u Virovitici.\r\n\r\nVSMTI Knjižnica se nalazi u zgradi Visoke škole u prostoriji 1-14.\r\n\r\nUpisi u knjižnicu se vrši prilikom upisa u prvu godinu studija. Dolaskom u Knjižnicu Visoke škole Virovitica, ispunjavanjem Upitnika za članstvo, koje je besplatno. Traženi naslov literature (pregled knjižničnog kataloga) možete pronaći OVDJE. Odjednom se može posuditi dva primjerka knjižne građe na rok od 14 dana, uz mogućnost produživanja roka posudbe.\r\n\r\n\r\n<strong>Kontakt:</strong>\r\nPrizemlje Visoke škole Virovitica (1-14) \r\nMatije Gupca 78, 33 000 Virovitica\r\n<strong>Tel.</strong> 033 492 256\r\n<strong>E-mail:</strong> ivana.vidak@vsmti.hr\r\n\r\n', 'Knjižnica Visoke Škole', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-01-09 14:22:59', '2021-01-09 14:22:59', '', 7, 'http://localhost/wordpress/7-revision-v1/', 0, 'revision', '', 0),
(162, 1, '2021-01-09 17:30:20', '2021-01-09 17:30:20', 'Poduzetnički mindset podrazumijeva specifičan pogled na svijet, načine razmišljanja, mišljenja i stavove karakteristične za poduzetnike ili poduzetne pojedince. On obuhvaća sklonost pojedinca prema otkrivanju (ili stvaranju), vrednovanju i iskorištavanju prilika u okolini. Moguće ga je razvijati u različitim situacijama i karijernim odabirima – ne nužno samo u situaciji vođenja i upravljanja vlastitim poduzetničkim pothvatom. Teorijski okviri su identificirali osnovne dimenzije poduzetničkom mindseta, a u okviru ove teme studnet će imati priliku povezati navedene teorijske okvire sa stvarnim primjerima poduzetnih osoba.\r\n\r\n', 'Analiza poduzetničkog mindseta na primjeru poduzetnika', '', 'publish', 'closed', 'closed', '', 'mrt-mrk-mrk', '', '', '2021-01-09 20:53:45', '2021-01-09 20:53:45', '', 0, 'http://localhost/wordpress/?post_type=rad&#038;p=162', 0, 'rad', '', 0),
(163, 1, '2021-01-09 18:47:42', '2021-01-09 18:47:42', 'When analysing Internet traffic today it can be found that digital video content prevails. Its domination will continue to grow in the upcoming years and reach 82% of all traffic by 2021. If converted to Internet video minutes per second, this equals about one million video minutes per second. Providing and supporting improved compression capability is therefore expected from video processing devices. This will relieve the pressure on storage systems and communication networks while creating preconditions for further development of video services. Transform and quantization is one of the most compute-intensive parts of modern hybrid video coding systems where coding algorithm itself is commonly standardized. High Efficiency Video Coding (HEVC) is state-of-the-art video coding standard which achieves high compression efficiency at the cost of high computational complexity. In this paper we present highly parallel GPU accelerator for HEVC transform and quantization which targets most common heterogeneous computing CPU+GPU system. The accelerator is implemented using CUDA programming model. All the relevant state-of-the-art techniques related to kernel vectorization, shared memory optimization and overlapping data transfers with computation were investigated, customized and carefully combined to obtain a performance efficient solution across all applicable transform sizes. The proposed solution is compared against reference implementation which uses NVIDIA cuBLAS library to perform the same work. Obtained speedup factors for DCI 4K frame are 2.46 times for largest transform size and 130.17 times for smallest transform size what revealed substantial performance gap of this library when targeting GPU of the Kepler architecture. Achieved processing time of frame transform and quantization are up to 4.82 ms\r\n\r\n', 'Highly parallel GPU accelerator for HEVC transform and quantization', '', 'publish', 'closed', 'closed', '', 'highly-parallel-gpu-accelerator-for-hevc-transform-and-quantization', '', '', '2021-01-18 10:26:15', '2021-01-18 10:26:15', '', 0, 'http://localhost/wordpress/?post_type=rad&#038;p=163', 0, 'rad', '', 0),
(164, 1, '2021-01-09 18:51:51', '2021-01-09 18:51:51', '	\r\nU poglavlju 1 opisan je razvoj radiodifuzije od 1887. pa sve do danas. Prvi poznati prijenos informacije pomoću elektromagnetskog vala ostvario je Heinrich Hertz u nastojanju potvrđivanja Maxwellove teorije elektromagnetskih valova. U svom eksperimentu načinio je prvi odašiljački sustav koji se sastojao od odašiljača i prijemnika s iskrištem te uspješno potvrdio Maxwellovu teoriju. Odašiljač s iskrištem i njegove izvedenice nastavio se koristiti u komercijalne svrhe, za što je najviše bio zaslužan Marconi, sve do 1907. godine i otkrića triode, vakuumske elektronske cijevi. Otkrićem ovog elektroničkog elementa dolazi do ubrzanog razvoja novih grana elektronike i elektroničke industrije, a među njima i radiodifuzije na području dugog, srednjeg i kratkog vala.\r\n\r\n\r\n', 'Arhitektura izlaznog stupnja poluvodičkog kratkovalnog odašiljača velike snage za digitalnu radiodifuziju.', '', 'publish', 'closed', 'closed', '', 'arhitektura-izlaznog-stupnja-poluvodickog-kratkovalnog-odasiljaca-velike-snage-za-digitalnu-radiodifuziju', '', '', '2021-01-18 10:56:58', '2021-01-18 10:56:58', '', 0, 'http://localhost/wordpress/?post_type=rad&#038;p=164', 0, 'rad', '', 0),
(165, 1, '2021-01-09 20:01:02', '2021-01-09 20:01:02', 'Kako prepoznati lažne izvore?\r\nKako doći do relevantnih podataka?\r\n\r\nKorisne savjete i upute iz informacijske pismenosti poslušajte u izlaganju naše gošće <strong>Ivane Vidak, dipl. bibl. i prof, v. pred.</strong>\r\n\r\n<br><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/U44LrBNuTxI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'VIDEO Kako napisati (izvrstan) završni rad?', '', 'inherit', 'closed', 'closed', '', '141-revision-v1', '', '', '2021-01-09 20:01:02', '2021-01-09 20:01:02', '', 141, 'http://localhost/wordpress/141-revision-v1/', 0, 'revision', '', 0),
(167, 1, '2021-01-11 12:50:49', '2021-01-11 12:50:49', 'Bahtijarević-Šiber, Fikreta, hrvatska psihologinja (Banja Luka, 12. I. 1942). Diplomirala (1965) i doktorirala (1981) psihologiju na Filozofskom fakultetu u Zagrebu. Profesorica menadžerske psihologije na Ekonomskom fakultetu u Zagrebu. U knjizi Motivacija i raspodjela (1986) sustavno je prikazala postojeće teorije motivacije i njihovu ulogu u procjeni vrijednosti rada. Važnija djela: Management ljudskih potencijala (1999), Menadžment (koautor, 2004), Suvremeni menadžment (koautor, 2008), Strateški menadžment ljudskih potencijala (2014) i dr.\r\n\r\n ', 'Fikret Bahtijarević-Šiber', '', 'publish', 'closed', 'closed', '', 'fikret-bahtijarevic-siber', '', '', '2021-01-11 12:50:49', '2021-01-11 12:50:49', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=167', 0, 'autor', '', 0),
(168, 1, '2021-01-11 12:50:37', '2021-01-11 12:50:37', '', 'unnamed', '', 'inherit', 'open', 'closed', '', 'unnamed', '', '', '2021-01-11 12:50:37', '2021-01-11 12:50:37', '', 167, 'http://localhost/wordpress/wp-content/uploads/2021/01/unnamed.gif', 0, 'attachment', 'image/gif', 0),
(169, 1, '2021-01-11 12:51:33', '2021-01-11 12:51:33', 'Knjiga je namijenjena studentima Ekonomskog fakulteta Sveučilišta u Zagrebu kao udžbenik za predmet Menadžment na III. godini studija. Sastoji se od 4 dijela i 17 poglavlja. Logički je strukturirana i postupno uvodi čitatelja u sve bitne aspekte suvremenog menadžmenta. Središnje mjesto u knjizi ima prvo poglavlje, koje nosi naziv Menadžerske vještine, jer doista, suvremeni menadžer mora odlično poznavati sve menadžerske vještine. Njegova uspješnost u vještinama menadžmenta osposobljava ga za najizazovnije poslove i za rješavanje najsloženijih problema. Da bi menadžer bio uspješan u vještinama menadžmenta, on mora poznavati sustave, pristupe, tehnike i sredstva menadžmenta, što se obrađuje u drugom dijelu knjige. Treći dio knjige odnosi se na posebna područja menadžmenta, pa je izučavanje međukulturalnoga i međunarodnog menadžmenta te menadžmenta u globalnom okruženju potrebno i našim studentima koji se zapošljavaju i u globalnim organizacijama. Posljednje poglavlje Izazovi menadžmenta u 21. st. obrađuje teme poslovne i menadžerske etike i društvene odgovornosti kompanija, upravljanje znanjem i različitostima te ulogu žena u menadžmentu.\r\n', 'Suvremeni menadžment', '', 'publish', 'closed', 'closed', '', 'suvremeni-menadzment-vjestine-sustavi-i-izazovi', '', '', '2021-01-11 12:57:48', '2021-01-11 12:57:48', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=169', 0, 'knjiga', '', 0),
(170, 1, '2021-01-11 12:51:33', '2021-01-11 12:51:33', 'Knjiga je namijenjena studentima Ekonomskog fakulteta Sveučilišta u Zagrebu kao udžbenik za predmet Menadžment na III. godini studija. Sastoji se od 4 dijela i 17 poglavlja. Logički je strukturirana i postupno uvodi čitatelja u sve bitne aspekte suvremenog menadžmenta. Središnje mjesto u knjizi ima prvo poglavlje, koje nosi naziv Menadžerske vještine, jer doista, suvremeni menadžer mora odlično poznavati sve menadžerske vještine. Njegova uspješnost u vještinama menadžmenta osposobljava ga za najizazovnije poslove i za rješavanje najsloženijih problema. Da bi menadžer bio uspješan u vještinama menadžmenta, on mora poznavati sustave, pristupe, tehnike i sredstva menadžmenta, što se obrađuje u drugom dijelu knjige. Treći dio knjige odnosi se na posebna područja menadžmenta, pa je izučavanje međukulturalnoga i međunarodnog menadžmenta te menadžmenta u globalnom okruženju potrebno i našim studentima koji se zapošljavaju i u globalnim organizacijama. Posljednje poglavlje Izazovi menadžmenta u 21. st. obrađuje teme poslovne i menadžerske etike i društvene odgovornosti kompanija, upravljanje znanjem i različitostima te ulogu žena u menadžmentu.\r\n', 'Suvremeni menadžment - Vještine, sustavi i izazovi', '', 'inherit', 'closed', 'closed', '', '169-revision-v1', '', '', '2021-01-11 12:51:33', '2021-01-11 12:51:33', '', 169, 'http://localhost/wordpress/169-revision-v1/', 0, 'revision', '', 0),
(171, 1, '2021-01-11 12:51:54', '2021-01-11 12:51:54', '', '030347', '', 'inherit', 'open', 'closed', '', '030347', '', '', '2021-01-11 12:51:54', '2021-01-11 12:51:54', '', 169, 'http://localhost/wordpress/wp-content/uploads/2021/01/030347.jpg', 0, 'attachment', 'image/jpeg', 0),
(172, 1, '2021-01-11 12:52:58', '2021-01-11 12:52:58', 'Bert Bates (18 August 1907 – 23 April 1976) was a British film editor, sometimes credited as A. S. Bates. He worked on more than sixty films during his career. Bates edited his first feature film, Many Waters, in 1931. He went on to be employed by many leading British studios, working on films by directors including Alfred Hitchcock, Anatole Litvak and Carol Reed.\r\n\r\n', 'Bert Bates', '', 'publish', 'closed', 'closed', '', 'bert-bates', '', '', '2021-01-11 12:52:58', '2021-01-11 12:52:58', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=172', 0, 'autor', '', 0),
(173, 1, '2021-01-11 12:52:54', '2021-01-11 12:52:54', '', 'download', '', 'inherit', 'open', 'closed', '', 'download', '', '', '2021-01-11 12:52:54', '2021-01-11 12:52:54', '', 172, 'http://localhost/wordpress/wp-content/uploads/2021/01/download.jpg', 0, 'attachment', 'image/jpeg', 0),
(174, 1, '2021-01-11 12:54:05', '2021-01-11 12:54:05', 'Learning a complex new language is no easy task especially when it s an object-oriented computer programming language like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn\'t always want to take in the dry, technical stuff you\'re forced to study.\r\n', 'Head First Java, 2nd Edition', '', 'publish', 'closed', 'closed', '', 'head-first-java-2nd-edition', '', '', '2021-01-11 12:54:22', '2021-01-11 12:54:22', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=174', 0, 'knjiga', '', 0),
(175, 1, '2021-01-11 12:54:05', '2021-01-11 12:54:05', 'Learning a complex new language is no easy task especially when it s an object-oriented computer programming language like Java. You might think the problem is your brain. It seems to have a mind of its own, a mind that doesn\'t always want to take in the dry, technical stuff you\'re forced to study.\r\n', 'Head First Java, 2nd Edition', '', 'inherit', 'closed', 'closed', '', '174-revision-v1', '', '', '2021-01-11 12:54:05', '2021-01-11 12:54:05', '', 174, 'http://localhost/wordpress/174-revision-v1/', 0, 'revision', '', 0),
(176, 1, '2021-01-11 12:54:20', '2021-01-11 12:54:20', '', '51BSxeykubL._SX258_BO1,204,203,200_', '', 'inherit', 'open', 'closed', '', '51bsxeykubl-_sx258_bo1204203200_', '', '', '2021-01-11 12:54:20', '2021-01-11 12:54:20', '', 174, 'http://localhost/wordpress/wp-content/uploads/2021/01/51BSxeykubL._SX258_BO1204203200_.jpg', 0, 'attachment', 'image/jpeg', 0),
(177, 1, '2021-01-11 12:57:26', '2021-01-11 12:57:26', 'Introduction to Algorithms is a book on computer programming by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. The book has been widely used as the textbook for algorithms courses at many universities[1] and is commonly cited as a reference for algorithms in published papers, with over 10,000 citations documented on CiteSeerX.[2] The book sold half a million copies during its first 20 years.[3] Its fame has led to the common use of the abbreviation \"CLRS\" (Cormen, Leiserson, Rivest, Stein), or, in the first edition, \"CLR\" (Cormen, Leiserson, Rivest).[4]\r\n\r\n', 'Introduction to Algorithms', '', 'publish', 'closed', 'closed', '', 'introduction-to-algorithms', '', '', '2021-01-11 12:57:26', '2021-01-11 12:57:26', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=177', 0, 'knjiga', '', 0),
(179, 1, '2021-01-11 12:55:39', '2021-01-11 12:55:39', 'Thomas H. Cormen koautor je Uvoda u algoritme, zajedno s Charlesom Leisersonom, Ronom Rivestom i Cliffom Steinom. Godine 2013. objavio je novu knjigu pod naslovom Algoritmi otključan. Profesor je računalnih znanosti na Dartmouth Collegeu i bivši predsjednik Odjela za računarske znanosti u Dartmouth Collegeu. ', 'Thomas H. Cormen', '', 'publish', 'closed', 'closed', '', 'thomas-h-cormen', '', '', '2021-01-11 12:55:39', '2021-01-11 12:55:39', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=179', 0, 'autor', '', 0),
(180, 1, '2021-01-11 12:55:37', '2021-01-11 12:55:37', '', 'download (1)', '', 'inherit', 'open', 'closed', '', 'download-1', '', '', '2021-01-11 12:55:37', '2021-01-11 12:55:37', '', 179, 'http://localhost/wordpress/wp-content/uploads/2021/01/download-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(181, 1, '2021-01-11 12:57:24', '2021-01-11 12:57:24', '', 'Clrs3', '', 'inherit', 'open', 'closed', '', 'clrs3', '', '', '2021-01-11 12:57:24', '2021-01-11 12:57:24', '', 177, 'http://localhost/wordpress/wp-content/uploads/2021/01/Clrs3.jpeg', 0, 'attachment', 'image/jpeg', 0),
(182, 1, '2021-01-11 12:57:26', '2021-01-11 12:57:26', 'Introduction to Algorithms is a book on computer programming by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein. The book has been widely used as the textbook for algorithms courses at many universities[1] and is commonly cited as a reference for algorithms in published papers, with over 10,000 citations documented on CiteSeerX.[2] The book sold half a million copies during its first 20 years.[3] Its fame has led to the common use of the abbreviation \"CLRS\" (Cormen, Leiserson, Rivest, Stein), or, in the first edition, \"CLR\" (Cormen, Leiserson, Rivest).[4]\r\n\r\n', 'Introduction to Algorithms', '', 'inherit', 'closed', 'closed', '', '177-revision-v1', '', '', '2021-01-11 12:57:26', '2021-01-11 12:57:26', '', 177, 'http://localhost/wordpress/177-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(183, 1, '2021-01-11 12:57:48', '2021-01-11 12:57:48', 'Knjiga je namijenjena studentima Ekonomskog fakulteta Sveučilišta u Zagrebu kao udžbenik za predmet Menadžment na III. godini studija. Sastoji se od 4 dijela i 17 poglavlja. Logički je strukturirana i postupno uvodi čitatelja u sve bitne aspekte suvremenog menadžmenta. Središnje mjesto u knjizi ima prvo poglavlje, koje nosi naziv Menadžerske vještine, jer doista, suvremeni menadžer mora odlično poznavati sve menadžerske vještine. Njegova uspješnost u vještinama menadžmenta osposobljava ga za najizazovnije poslove i za rješavanje najsloženijih problema. Da bi menadžer bio uspješan u vještinama menadžmenta, on mora poznavati sustave, pristupe, tehnike i sredstva menadžmenta, što se obrađuje u drugom dijelu knjige. Treći dio knjige odnosi se na posebna područja menadžmenta, pa je izučavanje međukulturalnoga i međunarodnog menadžmenta te menadžmenta u globalnom okruženju potrebno i našim studentima koji se zapošljavaju i u globalnim organizacijama. Posljednje poglavlje Izazovi menadžmenta u 21. st. obrađuje teme poslovne i menadžerske etike i društvene odgovornosti kompanija, upravljanje znanjem i različitostima te ulogu žena u menadžmentu.\r\n', 'Suvremeni menadžment', '', 'inherit', 'closed', 'closed', '', '169-revision-v1', '', '', '2021-01-11 12:57:48', '2021-01-11 12:57:48', '', 169, 'http://localhost/wordpress/169-revision-v1/', 0, 'revision', '', 0),
(184, 1, '2021-01-11 12:59:34', '2021-01-11 12:59:34', 'Avram Joel Spolsky softverski je inženjer i pisac. Autor je Joel on Software, bloga o razvoju softvera i tvorac Trello softvera za upravljanje projektima. Bio je voditelj programa u Microsoft Excel timu između 1991. i 1994. Kasnije je 2000. osnovao Fog Creek Software i pokrenuo blog Joel on Software. ', 'Avram Joel Spolsky', '', 'publish', 'closed', 'closed', '', 'avram-joel-spolsky', '', '', '2021-01-11 12:59:34', '2021-01-11 12:59:34', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=184', 0, 'autor', '', 0),
(185, 1, '2021-01-11 12:59:28', '2021-01-11 12:59:28', '', 'Joel_Spolsky_2014-06-18', '', 'inherit', 'open', 'closed', '', 'joel_spolsky_2014-06-18', '', '', '2021-01-11 12:59:28', '2021-01-11 12:59:28', '', 184, 'http://localhost/wordpress/wp-content/uploads/2021/01/Joel_Spolsky_2014-06-18.jpg', 0, 'attachment', 'image/jpeg', 0),
(188, 1, '2021-01-11 13:00:46', '2021-01-11 13:00:46', 'Most programmers\' fear of user interface (UI) programming comes from their fear of doing UI design. They think that UI design is like graphic design―the mysterious process by which creative, latte-drinking, all-black-wearing people produce cool-looking, artistic pieces. Most programmers see themselves as analytic, logical thinkers instead―strong at reasoning, weak on artistic judgment, and incapable of doing UI design.\r\n\r\nIn this brilliantly readable book, author Joel Spolsky proposes simple, logical rules that can be applied without any artistic talent to improve any user interface, from traditional GUI applications to websites to consumer electronics. Spolsky\'s primary axiom, the importance of bringing the program model in line with the user model, is both rational and simple.', 'User Interface Design for Programmers', '', 'publish', 'closed', 'closed', '', 'user-interface-design-for-programmers', '', '', '2021-01-11 13:00:46', '2021-01-11 13:00:46', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=188', 0, 'knjiga', '', 0),
(189, 1, '2021-01-11 13:00:11', '2021-01-11 13:00:11', '', '41Egb0W3JiL._SX404_BO1,204,203,200_', '', 'inherit', 'open', 'closed', '', '41egb0w3jil-_sx404_bo1204203200_', '', '', '2021-01-11 13:00:11', '2021-01-11 13:00:11', '', 188, 'http://localhost/wordpress/wp-content/uploads/2021/01/41Egb0W3JiL._SX404_BO1204203200_.jpg', 0, 'attachment', 'image/jpeg', 0),
(190, 1, '2021-01-11 13:00:46', '2021-01-11 13:00:46', 'Most programmers\' fear of user interface (UI) programming comes from their fear of doing UI design. They think that UI design is like graphic design―the mysterious process by which creative, latte-drinking, all-black-wearing people produce cool-looking, artistic pieces. Most programmers see themselves as analytic, logical thinkers instead―strong at reasoning, weak on artistic judgment, and incapable of doing UI design.\r\n\r\nIn this brilliantly readable book, author Joel Spolsky proposes simple, logical rules that can be applied without any artistic talent to improve any user interface, from traditional GUI applications to websites to consumer electronics. Spolsky\'s primary axiom, the importance of bringing the program model in line with the user model, is both rational and simple.', 'User Interface Design for Programmers', '', 'inherit', 'closed', 'closed', '', '188-revision-v1', '', '', '2021-01-11 13:00:46', '2021-01-11 13:00:46', '', 188, 'http://localhost/wordpress/188-revision-v1/', 0, 'revision', '', 0),
(191, 1, '2021-01-11 13:02:10', '2021-01-11 13:02:10', 'Damir Demonja rođen je 1966. godine u Zagrebu, gdje se i školovao. Godine 1993. diplomirao je filozofiju i povijest umjetnosti na Filozofskom fakultetu Sveučilišta u Zagrebu, na kojem je magistrirao 1996. i doktorirao 2001. godine. Na Institutu za povijest umjetnosti (IPU) u Zagrebu radi od 1993. do 2001. godine, gdje je, između ostalog, bio voditelj vlastitog poticajnog projekta za najbolje i najperspektivnije znanstvene novake. Godine 2003. zaposlio se u Ministarstvu turizma Republike Hrvatske kao viši stručni savjetnik za međunarodnu bilateralnu i regionalnu suradnju, baveći se međunarodnom turističkom suradnjom, a potom kao viši stručni savjetnik za selektivne oblike turizma i razvojne projekte s područjem rada vezanim za kulturni i ruralni turizam te razvojne projekte kulturnog i ruralnog turizma.', 'Damir Demonja', '', 'publish', 'closed', 'closed', '', 'damir-demonja', '', '', '2021-01-11 13:02:10', '2021-01-11 13:02:10', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=191', 0, 'autor', '', 0),
(192, 1, '2021-01-11 13:02:07', '2021-01-11 13:02:07', '', '2002f35249b6c2bd1fbf', '', 'inherit', 'open', 'closed', '', '2002f35249b6c2bd1fbf', '', '', '2021-01-11 13:02:07', '2021-01-11 13:02:07', '', 191, 'http://localhost/wordpress/wp-content/uploads/2021/01/2002f35249b6c2bd1fbf.jpeg', 0, 'attachment', 'image/jpeg', 0),
(193, 1, '2021-01-11 13:03:34', '2021-01-11 13:03:34', 'Knjiga «Ruralni turizam u Hrvatskoj s hrvatskim primjerima dobre prakse i europskim iskustvima» raspravlja o pojmovima i terminima ruralnog turizma, tumači ruralnu turističku destinaciju, opisuje nastanak i razvoj ruralnog turizma, određuje ruralni turizam i njegove brojne oblike, integrira i sintetizira dostupna prethodna znanja o ruralnom turizmu, opširno analizira njegovo postojeće stanje i perspektive razvoja, bavi se marketingom u ruralnom turizmu i njegovim oblicima, daje pregled stanja ruralnog turizma u Hrvatskoj i promišlja o njegovim dosadašnjim ostvarenim učincima, predstavlja odabrane hrvatske primjere dobre prakse, kao i one europskih zemalja, i daje temeljne odrednice, smjernice za daljnji razvoj ruralnog turizma u Hrvatskoj. Ona je znanstveno utemeljeni poticaj što žurnijeg, sustavnijeg i formalnijeg zahvaćanja/osmišljavanja ruralnog turizma kao jednog od budućih važnijih generatora gospodarskog razvoja u Hrvatskoj. Njome se daje doprinos znanstvenom istraživanju ruralnog turizma u Hrvatskoj, a može poslužiti i kao odgovarajući temelj za sva buduća istraživanja ove teme.\r\n\r\n', 'Ruralni turizam u Hrvatskoj', '', 'publish', 'closed', 'closed', '', 'ruralni-turizam-u-hrvatskoj', '', '', '2021-01-11 13:03:34', '2021-01-11 13:03:34', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=193', 0, 'knjiga', '', 0),
(194, 1, '2021-01-11 13:03:25', '2021-01-11 13:03:25', '', 'Ruralni-turizam-u-Hrvatskoj_MEP', '', 'inherit', 'open', 'closed', '', 'ruralni-turizam-u-hrvatskoj_mep', '', '', '2021-01-11 13:03:25', '2021-01-11 13:03:25', '', 193, 'http://localhost/wordpress/wp-content/uploads/2021/01/Ruralni-turizam-u-Hrvatskoj_MEP.jpg', 0, 'attachment', 'image/jpeg', 0),
(195, 1, '2021-01-11 13:03:34', '2021-01-11 13:03:34', 'Knjiga «Ruralni turizam u Hrvatskoj s hrvatskim primjerima dobre prakse i europskim iskustvima» raspravlja o pojmovima i terminima ruralnog turizma, tumači ruralnu turističku destinaciju, opisuje nastanak i razvoj ruralnog turizma, određuje ruralni turizam i njegove brojne oblike, integrira i sintetizira dostupna prethodna znanja o ruralnom turizmu, opširno analizira njegovo postojeće stanje i perspektive razvoja, bavi se marketingom u ruralnom turizmu i njegovim oblicima, daje pregled stanja ruralnog turizma u Hrvatskoj i promišlja o njegovim dosadašnjim ostvarenim učincima, predstavlja odabrane hrvatske primjere dobre prakse, kao i one europskih zemalja, i daje temeljne odrednice, smjernice za daljnji razvoj ruralnog turizma u Hrvatskoj. Ona je znanstveno utemeljeni poticaj što žurnijeg, sustavnijeg i formalnijeg zahvaćanja/osmišljavanja ruralnog turizma kao jednog od budućih važnijih generatora gospodarskog razvoja u Hrvatskoj. Njome se daje doprinos znanstvenom istraživanju ruralnog turizma u Hrvatskoj, a može poslužiti i kao odgovarajući temelj za sva buduća istraživanja ove teme.\r\n\r\n', 'Ruralni turizam u Hrvatskoj', '', 'inherit', 'closed', 'closed', '', '193-revision-v1', '', '', '2021-01-11 13:03:34', '2021-01-11 13:03:34', '', 193, 'http://localhost/wordpress/193-revision-v1/', 0, 'revision', '', 0),
(196, 1, '2021-01-11 13:06:58', '2021-01-11 13:06:58', 'Branko Blažević\r\nUniversity of Rijeka, Faculty of Tourism and Hospitality Management\r\nPotvrđena adresa e-pošte na fthm.hr\r\nopća ekonomija makroekonomija ekonomska politikaturizam', 'Branko Blažević', '', 'publish', 'closed', 'closed', '', 'branko-blazevic', '', '', '2021-01-11 13:06:58', '2021-01-11 13:06:58', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=196', 0, 'autor', '', 0),
(197, 1, '2021-01-11 13:06:55', '2021-01-11 13:06:55', '', 'Branko_Blazevic2', '', 'inherit', 'open', 'closed', '', 'branko_blazevic2', '', '', '2021-01-11 13:06:55', '2021-01-11 13:06:55', '', 196, 'http://localhost/wordpress/wp-content/uploads/2021/01/Branko_Blazevic2.jpg', 0, 'attachment', 'image/jpeg', 0),
(198, 1, '2021-01-11 13:08:17', '2021-01-11 13:08:17', 'Knjiga se bavi problematikom gospodarskog sustava, posebno turizmom, razvojnom problematikom, ekološkom i ukupnom ekonomskom problematikom. Dva glavna cilja knjige su: (i)približiti vezu gospodarskog sustava i turizma u sklopu opće teorije sustava i zalaganje za sustavni pristup problematici gospodarskog i turističkog razvoja ; (ii)pružiti cjeloviti uvid u poimanje i razumijevanje turizma kao složenog gospodarskog i društvenog sustava. Bez sustavnog pristupa kao nove naučne metodologije i njegove primjene na vrlo složene sustave i pojave, kao što je i turistički sustav, i to od najmanjih gospodarskih organizacija, gospodarskih grana, regija do nacionalnog gospodarstva i svjetskog društvenog sustava, put ka optimalnoj strategiji gospodarskog razvoja bio bi nemoguć.\r\n\r\n', 'Turizam u gospodarskom sustavu', '', 'publish', 'closed', 'closed', '', 'turizam-u-gospodarskom-sustavu', '', '', '2021-01-11 13:08:17', '2021-01-11 13:08:17', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=198', 0, 'knjiga', '', 0),
(199, 1, '2021-01-11 13:07:35', '2021-01-11 13:07:35', '', '028459', '', 'inherit', 'open', 'closed', '', '028459', '', '', '2021-01-11 13:07:35', '2021-01-11 13:07:35', '', 198, 'http://localhost/wordpress/wp-content/uploads/2021/01/028459.jpg', 0, 'attachment', 'image/jpeg', 0),
(200, 1, '2021-01-11 13:08:17', '2021-01-11 13:08:17', 'Knjiga se bavi problematikom gospodarskog sustava, posebno turizmom, razvojnom problematikom, ekološkom i ukupnom ekonomskom problematikom. Dva glavna cilja knjige su: (i)približiti vezu gospodarskog sustava i turizma u sklopu opće teorije sustava i zalaganje za sustavni pristup problematici gospodarskog i turističkog razvoja ; (ii)pružiti cjeloviti uvid u poimanje i razumijevanje turizma kao složenog gospodarskog i društvenog sustava. Bez sustavnog pristupa kao nove naučne metodologije i njegove primjene na vrlo složene sustave i pojave, kao što je i turistički sustav, i to od najmanjih gospodarskih organizacija, gospodarskih grana, regija do nacionalnog gospodarstva i svjetskog društvenog sustava, put ka optimalnoj strategiji gospodarskog razvoja bio bi nemoguć.\r\n\r\n', 'Turizam u gospodarskom sustavu', '', 'inherit', 'closed', 'closed', '', '198-revision-v1', '', '', '2021-01-11 13:08:17', '2021-01-11 13:08:17', '', 198, 'http://localhost/wordpress/198-revision-v1/', 0, 'revision', '', 0),
(201, 1, '2021-01-11 13:13:26', '2021-01-11 13:13:26', 'A true understanding of information systems requires more than memorizing hundreds of technical buzzwords. The third edition of Professor Steven Alter\'s highly successful Information Systems goes beyond the buzzwords by using a practical, widely applicable approach for analyzing systems from a business professional\'s viewpoint. The work-centered analysis (WCA) method is integrated throughout the book, providing a unifying vision for the material. The text also comes to life through examples within the chapters, true-to-life cases that open and close the chapters, and a Web site (http://hepg.awl.com keyword: Alter)that provides additional cases.', 'Information Systems: A Management Perspective', '', 'publish', 'closed', 'closed', '', 'information-systems-a-management-perspective', '', '', '2021-01-11 13:13:48', '2021-01-11 13:13:48', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=201', 0, 'knjiga', '', 0),
(202, 1, '2021-01-11 13:12:17', '2021-01-11 13:12:17', 'Steven Alter, Professor Emeritus, is a prolific, pioneering researcher and educator who has served a valuable part of USF\'s faculty since 1987. In addition to eight years of experience as vice president of a successful software start-up, over the course of many years of research he developed a systems analysis method for business professionals called the Work System Method. Dr. Alter is the author of seven published books and many journal articles. He teaches courses on technology-enabled innovation and systems in organizations.\r\n\r\n', 'Steven Alter', '', 'publish', 'closed', 'closed', '', 'steven-alter', '', '', '2021-01-11 13:12:17', '2021-01-11 13:12:17', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=202', 0, 'autor', '', 0),
(203, 1, '2021-01-11 13:11:51', '2021-01-11 13:11:51', '', 'AlterSteven_2010', '', 'inherit', 'open', 'closed', '', 'altersteven_2010', '', '', '2021-01-11 13:11:51', '2021-01-11 13:11:51', '', 202, 'http://localhost/wordpress/wp-content/uploads/2021/01/AlterSteven_2010.jpg', 0, 'attachment', 'image/jpeg', 0),
(204, 1, '2021-01-11 13:13:26', '2021-01-11 13:13:26', 'A true understanding of information systems requires more than memorizing hundreds of technical buzzwords. The third edition of Professor Steven Alter\'s highly successful Information Systems goes beyond the buzzwords by using a practical, widely applicable approach for analyzing systems from a business professional\'s viewpoint. The work-centered analysis (WCA) method is integrated throughout the book, providing a unifying vision for the material. The text also comes to life through examples within the chapters, true-to-life cases that open and close the chapters, and a Web site (http://hepg.awl.com keyword: Alter)that provides additional cases.', 'Information Systems: A Management Perspective', '', 'inherit', 'closed', 'closed', '', '201-revision-v1', '', '', '2021-01-11 13:13:26', '2021-01-11 13:13:26', '', 201, 'http://localhost/wordpress/201-revision-v1/', 0, 'revision', '', 0),
(205, 1, '2021-01-11 13:13:45', '2021-01-11 13:13:45', '', '51K1MGDQ1VL._SX364_BO1,204,203,200_', '', 'inherit', 'open', 'closed', '', '51k1mgdq1vl-_sx364_bo1204203200_', '', '', '2021-01-11 13:13:45', '2021-01-11 13:13:45', '', 201, 'http://localhost/wordpress/wp-content/uploads/2021/01/51K1MGDQ1VL._SX364_BO1204203200_.jpg', 0, 'attachment', 'image/jpeg', 0),
(206, 1, '2021-01-11 13:44:56', '2021-01-11 13:44:56', 'Biljanović, Petar, hrvatski inženjer elektrotehnike (Sarajevo, 7. II. 1938 – Zagreb, 27. II. 2020). Na Elektrotehničkom fakultetu u Zagrebu diplomirao 1961., doktorirao 1972., redoviti profesor od 1983. Uveo područje mikroelektronike u znanstveni rad i visokoškolsku nastavu u Hrvatskoj. Autor znanstvenih radova, patenata i visokoškolskih udžbenika Mikroelektronika (1983), Elektronički sklopovi (1989), Poluvodički elektronički elementi (1996). Dobitnik nagrade na Svjetskoj izložbi inovacija u Pittsburghu (1996) te Nagrade »J. J. Strossmayer« za najbolje znanstveno djelo u području tehničkih znanosti u 1996., kao i Državne nagrade tehničke kulture »Faust Vrančić« za životno djelo (2014).\r\n\r\n', 'Petar Biljanović', '', 'publish', 'closed', 'closed', '', 'petar-biljanovic', '', '', '2021-01-11 13:44:56', '2021-01-11 13:44:56', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=206', 0, 'autor', '', 0),
(207, 1, '2021-01-11 13:44:44', '2021-01-11 13:44:44', '', 'Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled', '', 'inherit', 'open', 'closed', '', 'prof-dr-sc-petar-biljanovic-treba-naglavacke-preobraziti-obrazovanje-scaled', '', '', '2021-01-11 13:44:44', '2021-01-11 13:44:44', '', 206, 'http://localhost/wordpress/wp-content/uploads/2021/01/Prof.-dr.-sc-Petar-Biljanovic-Treba-naglavacke-preobraziti-obrazovanje-scaled-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(208, 1, '2021-01-11 13:46:34', '2021-01-11 13:46:34', 'Radi se o materiji koja je u pravom smislu interdisciplinarna, fundamentalna i vrlo opsežna. Prije svega udžbenik je namijenjen studentima elektrotehnike i srodnih struka kao bazična literatura iz širokog područja poluvodičke elektronike i mikroelektronike. Cilj je studente upoznati s principima rada i svojstvima poluvodičkih elektroničkih elemenata, te ih na \"velika vrata\" uvesti u čudesni i izazovni svijet moderne elektronike i mikroelektronike.\r\n', 'Poluvodički elektronički elementi', '', 'publish', 'closed', 'closed', '', 'poluvodicki-elektronicki-elementi', '', '', '2021-01-11 13:46:34', '2021-01-11 13:46:34', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=208', 0, 'knjiga', '', 0),
(209, 1, '2021-01-11 13:45:48', '2021-01-11 13:45:48', '', '030686', '', 'inherit', 'open', 'closed', '', '030686', '', '', '2021-01-11 13:45:48', '2021-01-11 13:45:48', '', 208, 'http://localhost/wordpress/wp-content/uploads/2021/01/030686.jpg', 0, 'attachment', 'image/jpeg', 0),
(210, 1, '2021-01-11 13:46:34', '2021-01-11 13:46:34', 'Radi se o materiji koja je u pravom smislu interdisciplinarna, fundamentalna i vrlo opsežna. Prije svega udžbenik je namijenjen studentima elektrotehnike i srodnih struka kao bazična literatura iz širokog područja poluvodičke elektronike i mikroelektronike. Cilj je studente upoznati s principima rada i svojstvima poluvodičkih elektroničkih elemenata, te ih na \"velika vrata\" uvesti u čudesni i izazovni svijet moderne elektronike i mikroelektronike.\r\n', 'Poluvodički elektronički elementi', '', 'inherit', 'closed', 'closed', '', '208-revision-v1', '', '', '2021-01-11 13:46:34', '2021-01-11 13:46:34', '', 208, 'http://localhost/wordpress/208-revision-v1/', 0, 'revision', '', 0),
(212, 1, '2021-01-18 10:12:43', '2021-01-18 10:12:43', 'test', 'test', '', 'trash', 'closed', 'closed', '', 'test__trashed', '', '', '2021-01-18 10:55:18', '2021-01-18 10:55:18', '', 0, 'http://localhost/wordpress/?post_type=mentor&#038;p=212', 0, 'mentor', '', 0),
(213, 1, '2021-01-18 10:25:59', '2021-01-18 10:25:59', 'test 2 ', 'test 2', '', 'trash', 'closed', 'closed', '', 'test-2__trashed', '', '', '2021-01-18 10:55:17', '2021-01-18 10:55:17', '', 0, 'http://localhost/wordpress/?post_type=mentor&#038;p=213', 0, 'mentor', '', 0),
(214, 1, '2021-01-18 10:41:52', '2021-01-18 10:41:52', '', 'TN', '', 'inherit', 'open', 'closed', '', 'tn', '', '', '2021-01-18 10:41:52', '2021-01-18 10:41:52', '', 164, 'http://localhost/wordpress/wp-content/uploads/2021/01/TN.jpg', 0, 'attachment', 'image/jpeg', 0),
(215, 1, '2021-01-18 10:56:40', '2021-01-18 10:56:40', 'Redoviti profesor, Zavod za komunikacijske i svemirske tehnologije\r\n\r\nLokacija:C12-13      Telefon:6129-828      Telefon kućni:328      E-mail:silvio.hrabar@fer.hr', 'Silvio Hrabar', '', 'publish', 'closed', 'closed', '', 'silvio-hrabar', '', '', '2021-01-18 10:56:49', '2021-01-18 10:56:49', '', 0, 'http://localhost/wordpress/?post_type=mentor&#038;p=215', 0, 'mentor', '', 0),
(216, 1, '2021-01-18 10:56:38', '2021-01-18 10:56:38', '', 'p6656', '', 'inherit', 'open', 'closed', '', 'p6656', '', '', '2021-01-18 10:56:38', '2021-01-18 10:56:38', '', 215, 'http://localhost/wordpress/wp-content/uploads/2021/01/p6656.jpg', 0, 'attachment', 'image/jpeg', 0),
(217, 1, '2021-01-18 14:02:21', '2021-01-18 14:02:21', 'Knjižnica Visoke škole za menadžment u turizmu i informatici u Virovitici posjeduje fond knjižne građe koji je specifičan za potrebe visokoškolskog obrazovanja u informatičkom menadžmentu, ruralnom turizmu, poduzetništvu, računarstvu i elektrotehnici. Literatura se nabavlja u skladu s potrebama nastave pojedinog kolegija.\r\n\r\nUz navedeni fond, knjižnica posjeduje i referentnu zbirku (zbirka rječnika, atlasa, enciklopedija) i zbirku periodike (aktualni naslovi).\r\nUz literaturu na hrvatskom jeziku, posjeduje i zbirku na engleskom jeziku koja pokriva područja psihologije, obrazovanja, ekonomije, medicine, matematike, biologije i kemije, te zbirku završnih radova prvostupnika Visoke škole za menadžment u turizmu i informatici u Virovitici.\r\n\r\nVSMTI Knjižnica se nalazi u zgradi Visoke škole u prostoriji 1-14.\r\n\r\nUpisi u knjižnicu se vrši prilikom upisa u prvu godinu studija. Dolaskom u Knjižnicu Visoke škole Virovitica, ispunjavanjem Upitnika za članstvo, koje je besplatno. Traženi naslov literature (pregled knjižničnog kataloga) možete pronaći OVDJE. Odjednom se može posuditi dva primjerka knjižne građe na rok od 14 dana, uz mogućnost produživanja roka posudbe.\r\n\r\n\r\n<strong>Kontakt:</strong>\r\nPrizemlje Visoke škole Virovitica (1-14) \r\nMatije Gupca 78, 33 000 Virovitica\r\n<strong>Tel.</strong> 033 492 256\r\n<strong>E-mail:</strong> ivana.vidak@vsmti.hr\r\n\r\n', 'Knjižnica Visoke škole', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2021-01-18 14:02:21', '2021-01-18 14:02:21', '', 7, 'http://localhost/wordpress/7-revision-v1/', 0, 'revision', '', 0),
(219, 1, '2021-01-25 14:11:07', '2021-01-25 14:11:07', '', 'ikonixa', '', 'inherit', 'open', 'closed', '', 'ikonixa', '', '', '2021-01-25 14:11:07', '2021-01-25 14:11:07', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/01/ikonixa.png', 0, 'attachment', 'image/png', 0),
(220, 1, '2021-01-25 14:11:51', '2021-01-25 14:11:51', '', 'Lovepik_com-401498089-book-book-icon-free-vector-illustration-material', '', 'inherit', 'open', 'closed', '', 'lovepik_com-401498089-book-book-icon-free-vector-illustration-material', '', '', '2021-01-25 14:11:51', '2021-01-25 14:11:51', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/01/Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png', 0, 'attachment', 'image/png', 0),
(221, 1, '2021-01-25 14:11:56', '2021-01-25 14:11:56', 'http://localhost/wordpress/wp-content/uploads/2021/01/cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png', 'cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png', '', 'inherit', 'open', 'closed', '', 'cropped-lovepik_com-401498089-book-book-icon-free-vector-illustration-material-png', '', '', '2021-01-25 14:11:56', '2021-01-25 14:11:56', '', 0, 'http://localhost/wordpress/wp-content/uploads/2021/01/cropped-Lovepik_com-401498089-book-book-icon-free-vector-illustration-material.png', 0, 'attachment', 'image/png', 0),
(222, 1, '2021-01-25 14:11:59', '2021-01-25 14:11:59', '{\n    \"site_icon\": {\n        \"value\": 221,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-01-25 14:11:59\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd4b20e44-1c5d-46c7-9462-ea6f24893de6', '', '', '2021-01-25 14:11:59', '2021-01-25 14:11:59', '', 0, 'http://localhost/wordpress/d4b20e44-1c5d-46c7-9462-ea6f24893de6/', 0, 'customize_changeset', '', 0),
(226, 1, '2021-01-28 12:54:26', '2021-01-28 12:54:26', 'Rođenje: 12. travnja 1909. (dob 111 godina)\r\nKnjige: Elektrotehnika na lak način: u 1050 pitanja i odgovora te 1006 slika', 'Hubert Meluzin', '', 'publish', 'closed', 'closed', '', 'hubert-meluzin', '', '', '2021-01-28 12:54:26', '2021-01-28 12:54:26', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=226', 0, 'autor', '', 0),
(227, 1, '2021-01-28 12:55:22', '2021-01-28 12:55:22', 'Dimenzije: 14,00 x 20,00 cm.\r\nOpseg: 243 stranice.\r\nUvez: meki, plastificirani.\r\nStanje knjige: vrlo dobro.\r\n\r\nSvezak drugi.\r\n\r\n4. popravljeno izdanje.\r\n\r\nSa slovačkog preveo Zvonko Vistrička.', 'Vježbe i zadaci iz osnova elektrotehnike', '', 'publish', 'closed', 'closed', '', 'vjezbe-i-zadaci-iz-osnova-elektrotehnike', '', '', '2021-01-28 12:55:22', '2021-01-28 12:55:22', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=227', 0, 'knjiga', '', 0),
(228, 1, '2021-01-28 12:55:22', '2021-01-28 12:55:22', 'Dimenzije: 14,00 x 20,00 cm.\r\nOpseg: 243 stranice.\r\nUvez: meki, plastificirani.\r\nStanje knjige: vrlo dobro.\r\n\r\nSvezak drugi.\r\n\r\n4. popravljeno izdanje.\r\n\r\nSa slovačkog preveo Zvonko Vistrička.', 'Vježbe i zadaci iz osnova elektrotehnike', '', 'inherit', 'closed', 'closed', '', '227-revision-v1', '', '', '2021-01-28 12:55:22', '2021-01-28 12:55:22', '', 227, 'http://localhost/wordpress/227-revision-v1/', 0, 'revision', '', 0),
(229, 1, '2021-01-28 13:03:12', '2021-01-28 13:03:12', 'PROF. DR. SC. VLADO GLAVINIĆ\r\nRedoviti profesor, Zavod za elektroniku, mikroelektroniku, računalne i inteligentne sustave\r\n\r\nLokacija:D-318 Telefon:6129-955 Telefon kućni:455 E-mail:vlado.glavinic@fer.hr', 'Vlado Glavinić', '', 'publish', 'closed', 'closed', '', 'vlado-glavinic', '', '', '2021-01-28 13:03:12', '2021-01-28 13:03:12', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=229', 0, 'autor', '', 0),
(230, 1, '2021-01-28 13:04:35', '2021-01-28 13:04:35', 'Sadržaj knjige obuhvaća suštinske koncepcije, teoriju, projektiranje i osnove mikroelektroničke implementacije digitalnih sklopova i sustava. Kao udžbenik namijenjena je studentima Fakulteta elektrotehnike i računarstva.\r\n', 'DIGITALNI SUSTAVI', '', 'publish', 'closed', 'closed', '', 'digitalni-sustavi', '', '', '2021-01-28 13:04:35', '2021-01-28 13:04:35', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=230', 0, 'knjiga', '', 0),
(231, 1, '2021-01-28 13:04:21', '2021-01-28 13:04:21', '', '433506_digitalni-sustavi_420x610r', '', 'inherit', 'open', 'closed', '', '433506_digitalni-sustavi_420x610r', '', '', '2021-01-28 13:04:21', '2021-01-28 13:04:21', '', 230, 'http://localhost/wordpress/wp-content/uploads/2021/01/433506_digitalni-sustavi_420x610r.jpg', 0, 'attachment', 'image/jpeg', 0),
(232, 1, '2021-01-28 13:04:35', '2021-01-28 13:04:35', 'Sadržaj knjige obuhvaća suštinske koncepcije, teoriju, projektiranje i osnove mikroelektroničke implementacije digitalnih sklopova i sustava. Kao udžbenik namijenjena je studentima Fakulteta elektrotehnike i računarstva.\r\n', 'DIGITALNI SUSTAVI', '', 'inherit', 'closed', 'closed', '', '230-revision-v1', '', '', '2021-01-28 13:04:35', '2021-01-28 13:04:35', '', 230, 'http://localhost/wordpress/230-revision-v1/', 0, 'revision', '', 0),
(233, 1, '2021-01-28 13:06:43', '2021-01-28 13:06:43', 'Prevedeno s engleskog jezika-Michael B. McCallister američki je poslovni čovjek i predsjednik Humana, osiguravajućeg društva, i fondacije Humana. Umirovio se kao glavni izvršni direktor u prosincu 2012. godine. ', 'Michael McCallister', '', 'publish', 'closed', 'closed', '', 'michael-mccallister', '', '', '2021-01-28 13:06:43', '2021-01-28 13:06:43', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=233', 0, 'autor', '', 0),
(234, 1, '2021-01-28 13:06:41', '2021-01-28 13:06:41', '', '5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium', '', 'inherit', 'open', 'closed', '', '5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium', '', '', '2021-01-28 13:06:41', '2021-01-28 13:06:41', '', 233, 'http://localhost/wordpress/wp-content/uploads/2021/01/5a4138f5-1d17-4463-a6a4-8b0bf796c716_medium.jpg', 0, 'attachment', 'image/jpeg', 0),
(235, 1, '2021-01-28 13:07:59', '2021-01-28 13:07:59', 'Introduction\r\nWelcome to SUSE Linux 10 Unleashed! This book is going to help you get the most out of your SUSE Linux system, and it includes a fully functional copy of the operating system distribution.\r\n\r\nSince SUSE Linux A.G. was acquired by networking pioneer Novell in 2003, more North Americans are becoming familiar with the SUSE Linux distribution that has long been popular in Europe. SUSE Linux offers an incredibly easy installation and a large number of applications that have been tested for stability.\r\n\r\nSUSE Linux 10 marks a new way of doing things for both Novell and SUSE, and this book can help you join the excitement. SUSE Linux 10 is the first SUSE release built and tested through the OpenSUSE project. Thousands of people around the world downloaded and ran four beta releases, contributed bug reports, feature wish lists, and postings on the OpenSUSE mailing list. Novell has committed to opening up the process even further in 2006. You\'ll read more about the OpenSUSE project in the next chapter.', 'Suse Linux 10: Unleashed', '', 'publish', 'closed', 'closed', '', 'suse-linux-10-unleashed', '', '', '2021-01-28 13:07:59', '2021-01-28 13:07:59', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=235', 0, 'knjiga', '', 0),
(236, 1, '2021-01-28 13:07:56', '2021-01-28 13:07:56', '', 'download', '', 'inherit', 'open', 'closed', '', 'download-2', '', '', '2021-01-28 13:07:56', '2021-01-28 13:07:56', '', 235, 'http://localhost/wordpress/wp-content/uploads/2021/01/download-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(237, 1, '2021-01-28 13:07:59', '2021-01-28 13:07:59', 'Introduction\r\nWelcome to SUSE Linux 10 Unleashed! This book is going to help you get the most out of your SUSE Linux system, and it includes a fully functional copy of the operating system distribution.\r\n\r\nSince SUSE Linux A.G. was acquired by networking pioneer Novell in 2003, more North Americans are becoming familiar with the SUSE Linux distribution that has long been popular in Europe. SUSE Linux offers an incredibly easy installation and a large number of applications that have been tested for stability.\r\n\r\nSUSE Linux 10 marks a new way of doing things for both Novell and SUSE, and this book can help you join the excitement. SUSE Linux 10 is the first SUSE release built and tested through the OpenSUSE project. Thousands of people around the world downloaded and ran four beta releases, contributed bug reports, feature wish lists, and postings on the OpenSUSE mailing list. Novell has committed to opening up the process even further in 2006. You\'ll read more about the OpenSUSE project in the next chapter.', 'Suse Linux 10: Unleashed', '', 'inherit', 'closed', 'closed', '', '235-revision-v1', '', '', '2021-01-28 13:07:59', '2021-01-28 13:07:59', '', 235, 'http://localhost/wordpress/235-revision-v1/', 0, 'revision', '', 0),
(238, 1, '2021-01-28 13:09:44', '2021-01-28 13:09:44', 'Boris Pavlovič Demidovič (ruski: Борис Павлович Демидович; bjeloruski: Барыс Паўлавіч Дземідовіч), (Novogrudok, 2. ožujka 1906. - Moskva, 23. travnja 1977.) - bjeloruski matematičar\r\n\r\nBoris Demidovič je rođen u obitelji nastavnika. [1] Nakon što je diplomirao 1923., dodatno je studirao za nastavnika fizike i matematike do 1927. Imao je ponudu za posao u Bjelorusiji, ali je radije otišao u Rusiju.\r\n\r\nČetiri godine je služio kao profesor matematike u srednjim školama na području Smolenska i Brjanska. Predaje u Moskvi od 1931. godine. U isto vrijeme, postaje postdiplomantski student na Matematičkom institutu Moskvskog državnog sveučilišta. Pod vodstvom Andreja Kolmogorova radio je na teoriji funkcija prave varijable.[2] Kolmogorov je primijetio, da je Demidovič zainteresiran za probleme diferencijalnih jednadžbi pa ga je pozvao, da mu se pridruži u proučavanju kvalitativne teorije običnih diferencijalnih jednadžbi pod vodstvom Vjačeslava Stepanova.\r\n\r\nNakon postdiplomskog studija 1935., radio je na Odjelu za matematiku u Zavodu kožarske industrije. Od 1936. je suradnik na Matematičkom fakultetu Moskovskog državnoga sveučilišta. Do svoje smrti, trajno je ostao član osoblja. Postao je doktor znanosti, sveučilišni profesor i dobio je počasni naslov \"zaslužnog znanstvenika RSFSR-a\".\r\n\r\nIznenada je umro 23. travnja 1977. od akutne kardiovaskularne insuficijencije.\r\n\r\nDemidovič je uglavnom radio u pet područja: dinamički sustavi s integralnim invarijantima, periodična i kvazi-periodična rješenja običnih diferencijalnih jednadžbi; diferencijalni sustavi; ograničena rješenja običnih diferencijalnih jednadžbi; održivost običnih diferencijalnih jednadžbi u posebice orbitalnoj stabilnosti dinamičkih sustava.\r\n\r\nUz znanstvene i obrazovne aktivnosti istodobno je predavao na nekoliko vodećih sveučilišta u Moskvi.\r\n\r\nNjegovo iskustvo kao profesora, ogleda se u knjigama iz matematičke analize, koje su prevedene na mnoge strane jezike, uključujući i hrvatski jezik te se koriste kao sveučilišna literatura.\r\n\r\nČesto je sudjelovao na znanstvenim skupovima i aktivno je surađivao s uredništvima raznih matematičkih časopisa.', 'Boris Demidovič', '', 'publish', 'closed', 'closed', '', 'boris-demidovic', '', '', '2021-01-28 13:09:44', '2021-01-28 13:09:44', '', 0, 'http://localhost/wordpress/?post_type=autor&#038;p=238', 0, 'autor', '', 0),
(239, 1, '2021-01-28 13:09:34', '2021-01-28 13:09:34', '', 'unnamed', '', 'inherit', 'open', 'closed', '', 'unnamed-2', '', '', '2021-01-28 13:09:34', '2021-01-28 13:09:34', '', 238, 'http://localhost/wordpress/wp-content/uploads/2021/01/unnamed.jpg', 0, 'attachment', 'image/jpeg', 0),
(240, 1, '2021-01-28 13:10:35', '2021-01-28 13:10:35', 'Gradivo iz raznih područja matematičke analize može se samo onda temeljito svladati ako se pojedine metode i računski postupci uvježbavaju rješavanjem većeg broja primjera. Povrh toga je neophodno da se vidi i primjena tih metoda na probleme prirodnih i drugih znanosti te na tehničke probleme. To je dakako naročito važno za one koji matematiku izučavaju upravo radi tih primjena.\r\nZbirku koja evo izlazi u prijevodu sastavilo je više ruskih autora pod redakcijom B. R Demidoviča. Ona se odlikuje bogatstvom dobro odabranih primjera iz svih područja matematičke analize, iz diferencijalnog računa, integralnog računa i diferencijalnih jednadžbi, a obrađene su i metode približnog računanja. Pri tome su u tekstu dana kratka, ali temeljita teorijska objašnjenja i lijep broj potpuno izrađenih standardnih primjera. Za sve numeričke zadatke dana su na kraju knjige rješenja, a za teže zadatke, označene s jednom ili dvije zvjezdice (*) uz broj i kratke upute. U dodatku se mogu naći neke najvažnije tablice i niz nacrtanih krivulja. U samom tekstu također ima preko stotinu crteža.\r\nOpseg obuhvaćenog materijala vidi se potanje iz sadržaja. Može se reći da je uzeto u obzir sve što ulazi u okvir uvodnih predavanja matematičke analize na fakultetima i visokim Školama, s izuzetkom analitičke geometrije kojoj se redovno posvećuju posebne zbirke izdataka.\r\nVjerujem daje izdavanjem ove odlične zbirke znatno olakšano izučavanje matematičke analize svim studentima koji se njome bave bilo kao glavnim predmetom studija, bilo kao sredstvom koje im je neophodno za svladavanje tehničkih ili drugih znanosti, jer pored primjera koji služe uvježbavanju formalnih postupaka ima velik broj primjera gdje se ti postupci primjenjuju na konkretne tehničke i fizikalne probleme.', 'Zadaci i riješeni primjeri iz matematičke analize', '', 'publish', 'closed', 'closed', '', 'zadaci-i-rijeseni-primjeri-iz-matematicke-analize', '', '', '2021-01-28 13:10:57', '2021-01-28 13:10:57', '', 0, 'http://localhost/wordpress/?post_type=knjiga&#038;p=240', 0, 'knjiga', '', 0),
(241, 1, '2021-01-28 13:10:35', '2021-01-28 13:10:35', 'Gradivo iz raznih područja matematičke analize može se samo onda temeljito svladati ako se pojedine metode i računski postupci uvježbavaju rješavanjem većeg broja primjera. Povrh toga je neophodno da se vidi i primjena tih metoda na probleme prirodnih i drugih znanosti te na tehničke probleme. To je dakako naročito važno za one koji matematiku izučavaju upravo radi tih primjena.\r\nZbirku koja evo izlazi u prijevodu sastavilo je više ruskih autora pod redakcijom B. R Demidoviča. Ona se odlikuje bogatstvom dobro odabranih primjera iz svih područja matematičke analize, iz diferencijalnog računa, integralnog računa i diferencijalnih jednadžbi, a obrađene su i metode približnog računanja. Pri tome su u tekstu dana kratka, ali temeljita teorijska objašnjenja i lijep broj potpuno izrađenih standardnih primjera. Za sve numeričke zadatke dana su na kraju knjige rješenja, a za teže zadatke, označene s jednom ili dvije zvjezdice (*) uz broj i kratke upute. U dodatku se mogu naći neke najvažnije tablice i niz nacrtanih krivulja. U samom tekstu također ima preko stotinu crteža.\r\nOpseg obuhvaćenog materijala vidi se potanje iz sadržaja. Može se reći da je uzeto u obzir sve što ulazi u okvir uvodnih predavanja matematičke analize na fakultetima i visokim Školama, s izuzetkom analitičke geometrije kojoj se redovno posvećuju posebne zbirke izdataka.\r\nVjerujem daje izdavanjem ove odlične zbirke znatno olakšano izučavanje matematičke analize svim studentima koji se njome bave bilo kao glavnim predmetom studija, bilo kao sredstvom koje im je neophodno za svladavanje tehničkih ili drugih znanosti, jer pored primjera koji služe uvježbavanju formalnih postupaka ima velik broj primjera gdje se ti postupci primjenjuju na konkretne tehničke i fizikalne probleme.', 'Zadaci i riješeni primjeri iz matematičke analize', '', 'inherit', 'closed', 'closed', '', '240-revision-v1', '', '', '2021-01-28 13:10:35', '2021-01-28 13:10:35', '', 240, 'http://localhost/wordpress/240-revision-v1/', 0, 'revision', '', 0),
(242, 1, '2021-01-28 13:10:54', '2021-01-28 13:10:54', '', '132537', '', 'inherit', 'open', 'closed', '', '132537', '', '', '2021-01-28 13:10:54', '2021-01-28 13:10:54', '', 240, 'http://localhost/wordpress/wp-content/uploads/2021/01/132537.jpg', 0, 'attachment', 'image/jpeg', 0),
(243, 1, '2021-02-04 13:27:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-02-04 13:27:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=243', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Top menu', 'top-menu', 0),
(3, '1241245', '1241245', 0),
(4, 'Dramčuga', 'dramcuga', 0),
(5, 'Triler', 'triler', 0),
(6, '1241254125', '1241254125', 0),
(7, 'Kafkaizomav', 'kafkaizomav', 0),
(8, '1412412', '1412412', 0),
(9, '15415125', '15415125', 0),
(10, '95', '95', 0),
(11, 'Školska knjiga', 'skolska-knjiga', 0),
(12, '3', '3', 0),
(13, '5', '5', 0),
(14, '10', '10', 0),
(15, '9', '9', 0),
(16, '8', '8', 0),
(17, 'Diplomski', 'diplomski', 0),
(18, 'Znanstveni rad - Izvorni znanstveni rad', 'znanstveni-rad-izvorni-znanstveni-rad', 0),
(19, 'Disertacija', 'disertacija', 0),
(20, '030347', '030347', 0),
(21, 'Menadžment', 'menadzment', 0),
(22, 'Ekonomija', 'ekonomija', 0),
(23, '696', '696', 0),
(24, '2', '2', 0),
(25, '978-0596009205', '978-0596009205', 0),
(26, 'Programiranje', 'programiranje', 0),
(27, 'Računarstvo', 'racunarstvo', 0),
(28, '400', '400', 0),
(29, '1', '1', 0),
(30, 'O Reilly', 'o-reilly', 0),
(31, '11123454', '11123454', 0),
(32, 'Algoritmi', 'algoritmi', 0),
(33, '450', '450', 0),
(34, '1112324', '1112324', 0),
(35, 'Dizajn', 'dizajn', 0),
(36, '250', '250', 0),
(37, 'apress', 'apress', 0),
(38, '978-953-239-129-9', '978-953-239-129-9', 0),
(39, 'Turizam', 'turizam', 0),
(40, 'Hrvatska', 'hrvatska', 0),
(41, '320', '320', 0),
(42, 'MZOS', 'mzos', 0),
(43, '978-953-6198-96-2', '978-953-6198-96-2', 0),
(44, '578', '578', 0),
(45, '934-214-1241-144', '934-214-1241-144', 0),
(46, 'Informatika', 'informatika', 0),
(47, 'Poslovanje', 'poslovanje', 0),
(48, '490', '490', 0),
(49, '834-124-444-2133', '834-124-444-2133', 0),
(50, 'Eleketrotehnika', 'eleketrotehnika', 0),
(51, 'Eleketronika', 'eleketronika', 0),
(52, '624', '624', 0),
(53, 'Visoka škola za menadžment u turizmu i informatici', 'visoka-skola-za-menadzment-u-turizmu-i-informatici', 0),
(54, 'Fakultet elektrotehnike i računarstva', 'fakultet-elektrotehnike-i-racunarstva', 0),
(55, 'Pavlaković Goran', 'pavlakovic-goran', 0),
(56, '891-20-5', '891-20-5', 0),
(57, 'Elektrotehnika', 'elektrotehnika', 0),
(58, '243', '243', 0),
(59, 'Antikvarijat', 'antikvarijat', 0),
(60, '9789530303905', '9789530303905', 0),
(61, 'Digitalizacija', 'digitalizacija', 0),
(62, '538', '538', 0),
(63, '3434242153', '3434242153', 0),
(64, 'Operativni sustavi', 'operativni-sustavi', 0),
(65, '647', '647', 0),
(66, 'Sams', 'sams', 0),
(67, '953-212-149-8', '953-212-149-8', 0),
(68, 'Matematika', 'matematika', 0),
(69, '487', '487', 0),
(70, 'Veda', 'veda', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(27, 2, 0),
(29, 2, 0),
(33, 2, 0),
(35, 2, 0),
(96, 2, 0),
(120, 2, 0),
(134, 1, 0),
(137, 1, 0),
(141, 1, 0),
(162, 17, 0),
(163, 18, 0),
(164, 19, 0),
(164, 54, 0),
(164, 55, 0),
(169, 11, 0),
(169, 20, 0),
(169, 21, 0),
(169, 22, 0),
(169, 23, 0),
(169, 24, 0),
(174, 25, 0),
(174, 26, 0),
(174, 27, 0),
(174, 28, 0),
(174, 29, 0),
(174, 30, 0),
(177, 11, 0),
(177, 24, 0),
(177, 27, 0),
(177, 31, 0),
(177, 32, 0),
(177, 33, 0),
(188, 27, 0),
(188, 29, 0),
(188, 34, 0),
(188, 35, 0),
(188, 36, 0),
(188, 37, 0),
(193, 21, 0),
(193, 24, 0),
(193, 38, 0),
(193, 39, 0),
(193, 40, 0),
(193, 41, 0),
(193, 42, 0),
(198, 22, 0),
(198, 39, 0),
(198, 42, 0),
(198, 43, 0),
(198, 44, 0),
(201, 21, 0),
(201, 29, 0),
(201, 42, 0),
(201, 45, 0),
(201, 46, 0),
(201, 47, 0),
(201, 48, 0),
(208, 11, 0),
(208, 29, 0),
(208, 49, 0),
(208, 50, 0),
(208, 51, 0),
(208, 52, 0),
(227, 12, 0),
(227, 56, 0),
(227, 57, 0),
(227, 58, 0),
(227, 59, 0),
(230, 11, 0),
(230, 29, 0),
(230, 51, 0),
(230, 57, 0),
(230, 60, 0),
(230, 61, 0),
(230, 62, 0),
(235, 27, 0),
(235, 29, 0),
(235, 63, 0),
(235, 64, 0),
(235, 65, 0),
(235, 66, 0),
(240, 12, 0),
(240, 67, 0),
(240, 68, 0),
(240, 69, 0),
(240, 70, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3),
(2, 2, 'nav_menu', '', 0, 6),
(3, 3, 'kata_broj', '', 0, 0),
(4, 4, 'kategorija', '', 0, 0),
(5, 5, 'kategorija', '', 0, 0),
(6, 6, 'kata_broj', '', 0, 0),
(7, 7, 'kategorija', '', 0, 0),
(8, 8, 'kata_broj', '', 0, 0),
(9, 9, 'kata_broj', '', 0, 0),
(10, 10, 'broj_stranica', '', 0, 0),
(11, 11, 'izdavac', '', 0, 4),
(12, 12, 'dostupno', '', 0, 2),
(13, 13, 'dostupno', '', 0, 0),
(14, 14, 'dostupno', '', 0, 0),
(15, 15, 'dostupno', '', 0, 0),
(16, 16, 'dostupno', '', 0, 0),
(17, 17, 'vrsta_rada', '', 0, 1),
(18, 18, 'vrsta_rada', '', 0, 1),
(19, 19, 'vrsta_rada', '', 0, 1),
(20, 20, 'kata_broj', '', 0, 1),
(21, 21, 'kategorija', '', 0, 3),
(22, 22, 'kategorija', '', 0, 2),
(23, 23, 'broj_stranica', '', 0, 1),
(24, 24, 'dostupno', '', 0, 3),
(25, 25, 'kata_broj', '', 0, 1),
(26, 26, 'kategorija', '', 0, 1),
(27, 27, 'kategorija', '', 0, 4),
(28, 28, 'broj_stranica', '', 0, 1),
(29, 29, 'dostupno', '', 0, 6),
(30, 30, 'izdavac', '', 0, 1),
(31, 31, 'kata_broj', '', 0, 1),
(32, 32, 'kategorija', '', 0, 1),
(33, 33, 'broj_stranica', '', 0, 1),
(34, 34, 'kata_broj', '', 0, 1),
(35, 35, 'kategorija', '', 0, 1),
(36, 36, 'broj_stranica', '', 0, 1),
(37, 37, 'izdavac', '', 0, 1),
(38, 38, 'kata_broj', '', 0, 1),
(39, 39, 'kategorija', '', 0, 2),
(40, 40, 'kategorija', '', 0, 1),
(41, 41, 'broj_stranica', '', 0, 1),
(42, 42, 'izdavac', '', 0, 3),
(43, 43, 'kata_broj', '', 0, 1),
(44, 44, 'broj_stranica', '', 0, 1),
(45, 45, 'kata_broj', '', 0, 1),
(46, 46, 'kategorija', '', 0, 1),
(47, 47, 'kategorija', '', 0, 1),
(48, 48, 'broj_stranica', '', 0, 1),
(49, 49, 'kata_broj', '', 0, 1),
(50, 50, 'kategorija', '', 0, 1),
(51, 51, 'kategorija', '', 0, 2),
(52, 52, 'broj_stranica', '', 0, 1),
(53, 53, 'ustanova', '', 0, 0),
(54, 54, 'ustanova', '', 0, 1),
(55, 55, 'autor_rada', '', 0, 1),
(56, 56, 'kata_broj', '', 0, 1),
(57, 57, 'kategorija', '', 0, 2),
(58, 58, 'broj_stranica', '', 0, 1),
(59, 59, 'izdavac', '', 0, 1),
(60, 60, 'kata_broj', '', 0, 1),
(61, 61, 'kategorija', '', 0, 1),
(62, 62, 'broj_stranica', '', 0, 1),
(63, 63, 'kata_broj', '', 0, 1),
(64, 64, 'kategorija', '', 0, 1),
(65, 65, 'broj_stranica', '', 0, 1),
(66, 66, 'izdavac', '', 0, 1),
(67, 67, 'kata_broj', '', 0, 1),
(68, 68, 'kategorija', '', 0, 1),
(69, 69, 'broj_stranica', '', 0, 1),
(70, 70, 'izdavac', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'marijan.bebek'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,text_widget_custom_html'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"7a78cc1e7a0b5ac0d5fb6534a6bbba4a1169d4ddcd2a302163266db74e613b53\";a:4:{s:10:\"expiration\";i:1612618078;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:130:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56\";s:5:\"login\";i:1612445278;}}'),
(17, 1, 'wp_user-settings', 'libraryContent=browse&editor=html&hidetb=0&mfold=o'),
(18, 1, 'wp_user-settings-time', '1610202130'),
(19, 1, 'wp_dashboard_quick_press_last_post_id', '243'),
(20, 1, 'closedpostboxes_page', 'a:0:{}'),
(21, 1, 'metaboxhidden_page', 'a:4:{i:0;s:10:\"postcustom\";i:1;s:16:\"commentstatusdiv\";i:2;s:7:\"slugdiv\";i:3;s:9:\"authordiv\";}'),
(22, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:11:\"css-classes\";i:3;s:3:\"xfn\";i:4;s:11:\"description\";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(24, 1, 'nav_menu_recently_edited', '2'),
(25, 1, 'meta-box-order_knjiga', 'a:3:{s:4:\"side\";s:59:\"submitdiv,postimagediv,tagsdiv-kata_broj,tagsdiv-kategorija\";s:6:\"normal\";s:27:\"vsmti_knjige_autori,slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(26, 1, 'screen_layout_knjiga', '2'),
(27, 1, 'closedpostboxes_knjiga', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(28, 1, 'metaboxhidden_knjiga', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(29, 1, 'meta-box-order_page', 'a:3:{s:4:\"side\";s:36:\"postimagediv,submitdiv,pageparentdiv\";s:6:\"normal\";s:57:\"postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
(30, 1, 'screen_layout_page', '2'),
(31, 1, 'closedpostboxes_popupbuilder', 'a:0:{}'),
(32, 1, 'metaboxhidden_popupbuilder', 'a:1:{i:0;s:7:\"slugdiv\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'marijan.bebek', '$P$BhiosJOV5IIRKJsA/3ySd2XwO/W6mF0', 'marijan-bebek', 'marijan.bebek@mail.com', 'http://localhost/wordpress', '2020-12-13 15:01:29', '', 0, 'marijan.bebek');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
