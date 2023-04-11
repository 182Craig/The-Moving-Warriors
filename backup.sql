-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: uvrmhbydpw
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB-1:10.4.20+maria~buster-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounting`
--

DROP TABLE IF EXISTS `accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `meeting_time_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `tax` tinyint(1) NOT NULL DEFAULT 0,
  `amount` decimal(13,2) DEFAULT NULL,
  `type` enum('addiction','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_account` enum('income','asset','subscribe','promotion','registration_package') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_type` enum('automatic','manual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'automatic',
  `referred_user_id` int(10) unsigned DEFAULT NULL,
  `is_affiliate_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_affiliate_commission` tinyint(1) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`) USING BTREE,
  KEY `meeting_time_id` (`meeting_time_id`) USING BTREE,
  KEY `subscribe_id` (`subscribe_id`) USING BTREE,
  KEY `promotion_id` (`promotion_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting`
--

LOCK TABLES `accounting` WRITE;
/*!40000 ALTER TABLE `accounting` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertising_banners`
--

DROP TABLE IF EXISTS `advertising_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertising_banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` enum('home1','home2','course','course_sidebar','product_show','bundle','bundle_sidebar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL DEFAULT 12,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_banners`
--

LOCK TABLES `advertising_banners` WRITE;
/*!40000 ALTER TABLE `advertising_banners` DISABLE KEYS */;
INSERT INTO `advertising_banners` VALUES (1,'home1',12,'https://paystack.com/buy/budokon-yoga-for-all-levels?fbclid=PAAabUM8TWadRXje_LdncSeFzC0poxXfkgA5hxQVMkMr42qFfEGsp_DkgsE9k',1,1675931331),(2,'home2',6,'https://paystack.com/buy/budokon-yoga-for-all-levels?fbclid=PAAabUM8TWadRXje_LdncSeFzC0poxXfkgA5hxQVMkMr42qFfEGsp_DkgsE9k',1,1677513566),(3,'home2',4,'https://paystack.com/buy/budokon-yoga-for-all-levels?fbclid=PAAabUM8TWadRXje_LdncSeFzC0poxXfkgA5hxQVMkMr42qFfEGsp_DkgsE9k',1,1677514441);
/*!40000 ALTER TABLE `advertising_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertising_banners_translations`
--

DROP TABLE IF EXISTS `advertising_banners_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertising_banners_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `advertising_banner_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertising_banners_translations_advertising_banner_id_foreign` (`advertising_banner_id`),
  KEY `advertising_banners_translations_locale_index` (`locale`),
  CONSTRAINT `advertising_banners_translations_advertising_banner_id_foreign` FOREIGN KEY (`advertising_banner_id`) REFERENCES `advertising_banners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertising_banners_translations`
--

LOCK TABLES `advertising_banners_translations` WRITE;
/*!40000 ALTER TABLE `advertising_banners_translations` DISABLE KEYS */;
INSERT INTO `advertising_banners_translations` VALUES (1,1,'en','Budokon Yoga For All Levels','/store/1/Events/Minimalist and Elegant Yoga Class Banner Landscape (Facebook Cover) (2).png'),(2,2,'en','Budokon Mobility For All Levels','/store/1/254133083_187190956935756_7361478487256596703_n.jpg'),(3,3,'en','Title','/store/1/327552734_865394208047175_838457104771053500_n.jpg');
/*!40000 ALTER TABLE `advertising_banners_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates`
--

DROP TABLE IF EXISTS `affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int(10) unsigned NOT NULL,
  `referred_user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliates_affiliate_user_id_foreign` (`affiliate_user_id`),
  KEY `affiliates_referred_user_id_foreign` (`referred_user_id`),
  CONSTRAINT `affiliates_affiliate_user_id_foreign` FOREIGN KEY (`affiliate_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `affiliates_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates`
--

LOCK TABLES `affiliates` WRITE;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliates_codes`
--

DROP TABLE IF EXISTS `affiliates_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliates_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliates_codes_code_unique` (`code`),
  KEY `affiliates_codes_user_id_foreign` (`user_id`),
  CONSTRAINT `affiliates_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliates_codes`
--

LOCK TABLES `affiliates_codes` WRITE;
/*!40000 ALTER TABLE `affiliates_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliates_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agora_history`
--

DROP TABLE IF EXISTS `agora_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agora_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `start_at` int(10) unsigned NOT NULL,
  `end_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agora_history_session_id_foreign` (`session_id`),
  CONSTRAINT `agora_history_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agora_history`
--

LOCK TABLES `agora_history` WRITE;
/*!40000 ALTER TABLE `agora_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `agora_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_translations`
--

DROP TABLE IF EXISTS `badge_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badge_translations_badge_id_foreign` (`badge_id`),
  KEY `badge_translations_locale_index` (`locale`),
  CONSTRAINT `badge_translations_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_translations`
--

LOCK TABLES `badge_translations` WRITE;
/*!40000 ALTER TABLE `badge_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('register_date','course_count','course_rate','sale_count','support_rate','product_sale_count','make_topic','send_post_in_topic','instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `badges_type_index` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `become_instructors`
--

DROP TABLE IF EXISTS `become_instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `become_instructors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role` enum('teacher','organization') COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','accept','reject') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `become_instructors_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `become_instructors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `become_instructors`
--

LOCK TABLES `become_instructors` WRITE;
/*!40000 ALTER TABLE `become_instructors` DISABLE KEYS */;
/*!40000 ALTER TABLE `become_instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_count` int(10) unsigned DEFAULT 0,
  `enable_comment` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('pending','publish') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `blog_category_id_foreign` (`category_id`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE,
  CONSTRAINT `blog_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,1,1,'An-Introduction-to-Budokon-A-Fusion-of-Martial-Arts-and-Yoga','/store/1/Blog/Introduction to Budokon.jpg',64,1,'publish',1675849945,1675849945),(2,3,1,'The-Physical-and-Mental-Health-Benefits-of-Practicing-Budokon','/store/1/Blog/The Physical and Mental Health Benefits of Practicing Budokon.jpg',69,1,'publish',1675850158,1675850158);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'Introduction to Budokon','Introduction-to-Budokon'),(2,'The Philosophy of Budokon','The-Philosophy-of-Budokon'),(3,'Benefits of Budokon for Physical and Mental Health','Benefits-of-Budokon-for-Physical-and-Mental-Health'),(4,'Techniques and Movements in Budokon','Techniques-and-Movements-in-Budokon'),(5,'Diet and Nutrition for Optimal Wellness','Diet-and-Nutrition-for-Optimal-Wellness'),(6,'Mindfulness and Meditation in Budokon','Mindfulness-and-Meditation-in-Budokon'),(7,'Incorporating Budokon into a Daily Wellness Routine','Incorporating-Budokon-into-a-Daily-Wellness-Routine'),(8,'Inspirational Stories and Testimonials','Inspirational-Stories-and-Testimonials'),(9,'Upcoming Events and Workshops','Upcoming-Events-and-Workshops'),(10,'Q&A with Experts in the Budokon Community.','Q-A-with-Experts-in-the-Budokon-Community');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_translations`
--

DROP TABLE IF EXISTS `blog_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_translations_blog_id_locale_unique` (`blog_id`,`locale`),
  KEY `blog_translations_locale_index` (`locale`),
  CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_translations`
--

LOCK TABLES `blog_translations` WRITE;
/*!40000 ALTER TABLE `blog_translations` DISABLE KEYS */;
INSERT INTO `blog_translations` VALUES (1,1,'en','An Introduction to Budokon: A Fusion of Martial Arts and Yoga','<p><span style=\"color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space: pre-wrap; background-color: rgb(247, 247, 248);\">Budokon is a unique blend of martial arts, yoga, and meditation that emphasizes physical, mental, and spiritual wellness. Originating in the late 1990s, Budokon has been gaining popularity as a holistic approach to fitness and wellness. In this post, we will explore what Budokon is, its benefits, and why it has become so popular in recent years.</span></p>','<p>An Introduction to Budokon: A Fusion of Martial Arts and Yoga</p><p><br></p><p>Budokon is a unique blend of martial arts, yoga, and meditation that emphasizes physical, mental, and spiritual wellness. Originating in the late 1990s, Budokon has been gaining popularity as a holistic approach to fitness and wellness. This unique practice was created by Cameron Shayne, a martial arts expert and yoga enthusiast, who wanted to combine the best of both worlds.</p><p><br></p><p>In Budokon, practitioners move through a series of martial arts-inspired postures, known as \"transitions,\" while incorporating elements of yoga, such as breath work and mindfulness. The movements are designed to be fluid and seamless, promoting strength, flexibility, and balance. At the same time, the practice encourages spiritual growth and self-discovery through meditation and mindfulness.</p><p><br></p><p>One of the key benefits of Budokon is its ability to improve physical fitness in a fun and engaging way. By incorporating martial arts movements, practitioners are able to build strength, improve coordination, and increase cardiovascular endurance. At the same time, the yoga elements of the practice promote flexibility and balance, helping to prevent injury and improve overall physical health.</p><p><br></p><p>In addition to physical benefits, Budokon also has a strong focus on mental and spiritual well-being. The practice encourages mindfulness and meditation, helping practitioners to reduce stress and improve their overall mental health. The focus on self-discovery and personal growth can also lead to increased feelings of self-awareness and inner peace.</p><p><br></p><p>Despite its relative newness, Budokon has gained popularity around the world, with a growing number of practitioners seeking to incorporate its holistic approach to wellness into their lives. Whether you\'re looking to improve your physical fitness, reduce stress, or simply seek a more meaningful and fulfilling life, Budokon may be the right practice for you.</p><p><br></p><p>In conclusion, Budokon is a unique blend of martial arts, yoga, and meditation that offers a fun and engaging way to improve physical, mental, and spiritual wellness. With its focus on mindfulness, self-discovery, and personal growth, it has become an increasingly popular choice for those seeking a holistic approach to fitness and wellness. If you\'re interested in learning more about Budokon, consider seeking out a local teacher or workshop, or exploring the wealth of resources available online.</p>','Learn about Budokon, a fusion of martial arts, yoga, and meditation that emphasizes holistic wellness. Discover the benefits of this popular practice and why it\'s gaining popularity.'),(2,2,'en','The Physical and Mental Health Benefits of Practicing Budokon','<p><span style=\"color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space: pre-wrap; background-color: rgb(247, 247, 248);\">Budokon is a unique blend of martial arts, yoga, and meditation that emphasizes physical, mental, and spiritual wellness. In this post, we will explore the various health benefits that come with practicing Budokon, from improved physical fitness to reduced stress and anxiety. Whether you\'re a seasoned practitioner or just getting started, understanding the benefits of Budokon can help you to make the most of your practice.</span></p>','<p>The Physical and Mental Health Benefits of Practicing Budokon</p><p><br></p><p>Budokon is a unique blend of martial arts, yoga, and meditation that emphasizes physical, mental, and spiritual wellness. This unique practice was created by Cameron Shayne, a martial arts expert and yoga enthusiast, who wanted to combine the best of both worlds. With its focus on mindfulness, self-discovery, and personal growth, Budokon has become an increasingly popular choice for those seeking a holistic approach to fitness and wellness.</p><p><br></p><p>So, what exactly are the benefits of practicing Budokon? Let\'s take a look at some of the most notable physical and mental health benefits of this dynamic practice.</p><p><br></p><p>Physical Health Benefits:</p><p><br></p><p>Improved Physical Fitness: Budokon is designed to be a full-body workout, incorporating elements of martial arts, yoga, and meditation. As a result, practitioners can expect to see improvements in strength, flexibility, coordination, and cardiovascular endurance.</p><p><br></p><p>Reduced Injury Risk: By focusing on balance and stability, Budokon helps to prevent injury and reduce the risk of injury during other physical activities. This is especially important for older adults, who may be more susceptible to injury.</p><p><br></p><p>Increased Flexibility: One of the key elements of Budokon is the emphasis on fluid and seamless movement. This focus on flexibility helps to improve range of motion, reduce stiffness, and prevent injury.</p><p><br></p><p>Mental Health Benefits:</p><p><br></p><p>Reduced Stress and Anxiety: With its focus on mindfulness and meditation, Budokon can help to reduce stress and anxiety levels, improving overall mental well-being.</p><p><br></p><p>Improved Focus and Concentration: By practicing mindfulness and meditation techniques, practitioners can improve their ability to focus and concentrate, leading to increased productivity and improved performance in all areas of life.</p><p><br></p><p>Increased Self-Awareness: The focus on self-discovery and personal growth in Budokon can help practitioners to gain a deeper understanding of themselves and their own thoughts, feelings, and motivations. This increased self-awareness can lead to improved relationships, better decision-making, and a more fulfilling life.</p><p><br></p><p>In conclusion, Budokon offers a wide range of physical and mental health benefits, making it an ideal choice for anyone looking to improve their overall well-being. Whether you\'re looking to build strength, reduce stress, or simply seek a more meaningful and fulfilling life, Budokon may be the right practice for you. To learn more about the benefits of Budokon and how to get started, consider seeking out a local teacher or workshop, or exploring the wealth of resources available online.</p>','Discover the physical and mental health benefits of practicing Budokon, a fusion of martial arts, yoga, and meditation. Learn how this holistic approach to fitness can improve your overall well-being, from reducing stress to boosting physical fitness.');
/*!40000 ALTER TABLE `blog_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_filter_option`
--

DROP TABLE IF EXISTS `bundle_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_filter_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_filter_option_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_filter_option_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `bundle_filter_option_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_filter_option`
--

LOCK TABLES `bundle_filter_option` WRITE;
/*!40000 ALTER TABLE `bundle_filter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_translations`
--

DROP TABLE IF EXISTS `bundle_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_translations_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_translations_locale_index` (`locale`),
  CONSTRAINT `bundle_translations_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_translations`
--

LOCK TABLES `bundle_translations` WRITE;
/*!40000 ALTER TABLE `bundle_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_webinars`
--

DROP TABLE IF EXISTS `bundle_webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `bundle_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_webinars_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_webinars_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `bundle_webinars_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_webinars`
--

LOCK TABLES `bundle_webinars` WRITE;
/*!40000 ALTER TABLE `bundle_webinars` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_webinars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles`
--

DROP TABLE IF EXISTS `bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL DEFAULT 0,
  `access_days` int(10) unsigned DEFAULT NULL COMMENT 'Number of days to access the bundle',
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  `updated_at` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundles_creator_id_foreign` (`creator_id`),
  KEY `bundles_teacher_id_foreign` (`teacher_id`),
  KEY `bundles_category_id_foreign` (`category_id`),
  KEY `bundles_slug_index` (`slug`),
  CONSTRAINT `bundles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles`
--

LOCK TABLES `bundles` WRITE;
/*!40000 ALTER TABLE `bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `reserve_meeting_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `special_offer_id` int(10) unsigned DEFAULT NULL,
  `product_discount_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cart_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `cart_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `cart_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `cart_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `cart_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `cart_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `cart_special_offer_id_foreign` (`special_offer_id`),
  KEY `cart_product_order_id_foreign` (`product_order_id`),
  KEY `cart_product_discount_id_foreign` (`product_discount_id`),
  KEY `cart_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `cart_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_product_discount_id_foreign` FOREIGN KEY (`product_discount_id`) REFERENCES `product_discounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cart_product_order_id_foreign` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_special_offer_id_foreign` FOREIGN KEY (`special_offer_id`) REFERENCES `special_offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (6,NULL,'/store/1/favicon.png',NULL),(7,NULL,'/store/1/favicon.png',NULL),(8,NULL,'/store/1/favicon.png',NULL),(9,NULL,'/store/1/favicon.png',NULL),(10,NULL,'/store/1/favicon.png',NULL),(11,NULL,'/store/1/favicon.png',NULL),(12,NULL,'/store/1/favicon.png',NULL),(13,12,'/store/1/favicon.png',1),(14,12,'/store/1/favicon.png',2),(15,12,'/store/1/favicon.png',3),(16,12,'/store/1/favicon.png',4),(17,12,'/store/1/favicon.png',5),(18,12,'/store/1/favicon.png',6),(19,8,NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_translations_category_id_foreign` (`category_id`),
  KEY `category_translations_locale_index` (`locale`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (6,6,'en','Budokon Yoga'),(7,7,'en','Budokon Mixed Movement Art'),(8,8,'en','Budokon Mobility'),(9,9,'en','Budokon Primary Series'),(10,10,'en','Budokon Flow Arts'),(11,11,'en','Budokon Calisthenics'),(12,12,'en','Budokon Mindset'),(13,13,'en','Mindfulness'),(14,14,'en','Self-awarness'),(15,15,'en','Self-expression'),(16,16,'en','Personal Growth'),(17,17,'en','Positive psychology'),(18,18,'en','Mind-body connection'),(19,19,'en','Animal Locomotion');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_template_translations`
--

DROP TABLE IF EXISTS `certificate_template_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_template_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_template_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtl` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_template_id` (`certificate_template_id`),
  KEY `certificate_template_translations_locale_index` (`locale`),
  CONSTRAINT `certificate_template_id` FOREIGN KEY (`certificate_template_id`) REFERENCES `certificates_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_template_translations`
--

LOCK TABLES `certificate_template_translations` WRITE;
/*!40000 ALTER TABLE `certificate_template_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate_template_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned DEFAULT NULL,
  `quiz_result_id` int(10) unsigned DEFAULT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `user_grade` int(10) unsigned DEFAULT NULL,
  `type` enum('quiz','course') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `certificates_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `certificates_quiz_result_id_foreign` (`quiz_result_id`) USING BTREE,
  KEY `certificates_student_id_foreign` (`student_id`) USING BTREE,
  KEY `certificates_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `certificates_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_quiz_result_id_foreign` FOREIGN KEY (`quiz_result_id`) REFERENCES `quizzes_results` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_templates`
--

DROP TABLE IF EXISTS `certificates_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `type` enum('quiz','course') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_x` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `position_y` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `font_size` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` enum('draft','publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_templates`
--

LOCK TABLES `certificates_templates` WRITE;
/*!40000 ALTER TABLE `certificates_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `review_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_review_id` int(10) unsigned DEFAULT NULL,
  `reply_id` int(10) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `viewed_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `comments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `comments_review_id_foreign` (`review_id`) USING BTREE,
  KEY `comments_reply_id_foreign` (`reply_id`) USING BTREE,
  KEY `comments_product_id_foreign` (`product_id`),
  KEY `comments_bundle_id_foreign` (`bundle_id`),
  KEY `blog_id` (`blog_id`) USING BTREE,
  CONSTRAINT `comments_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `webinar_reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_reports`
--

DROP TABLE IF EXISTS `comments_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_reports_comment_id_foreign` (`comment_id`) USING BTREE,
  KEY `comments_reports_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_reports_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reports_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_reports`
--

LOCK TABLES `comments_reports` WRITE;
/*!40000 ALTER TABLE `comments_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_forum_answers`
--

DROP TABLE IF EXISTS `course_forum_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_forum_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `resolved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forum_answers_user_id_foreign` (`user_id`),
  KEY `course_forum_answers_forum_id_foreign` (`forum_id`),
  CONSTRAINT `course_forum_answers_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `course_forums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forum_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_forum_answers`
--

LOCK TABLES `course_forum_answers` WRITE;
/*!40000 ALTER TABLE `course_forum_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_forum_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_forums`
--

DROP TABLE IF EXISTS `course_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forums_webinar_id_foreign` (`webinar_id`),
  KEY `course_forums_user_id_foreign` (`user_id`),
  CONSTRAINT `course_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forums_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_forums`
--

LOCK TABLES `course_forums` WRITE;
/*!40000 ALTER TABLE `course_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_learning`
--

DROP TABLE IF EXISTS `course_learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_learning` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `text_lesson_id` int(10) unsigned DEFAULT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `session_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_learning_user_id_foreign` (`user_id`),
  KEY `course_learning_text_lesson_id_foreign` (`text_lesson_id`),
  KEY `course_learning_file_id_foreign` (`file_id`),
  KEY `course_learning_session_id_foreign` (`session_id`),
  CONSTRAINT `course_learning_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_learning`
--

LOCK TABLES `course_learning` WRITE;
/*!40000 ALTER TABLE `course_learning` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_noticeboard_status`
--

DROP TABLE IF EXISTS `course_noticeboard_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_noticeboard_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `noticeboard_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboard_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `course_noticeboard_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `course_noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_noticeboard_status`
--

LOCK TABLES `course_noticeboard_status` WRITE;
/*!40000 ALTER TABLE `course_noticeboard_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_noticeboard_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_noticeboards`
--

DROP TABLE IF EXISTS `course_noticeboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_noticeboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `color` enum('warning','danger','neutral','info','success') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboards_creator_id_foreign` (`creator_id`),
  KEY `course_noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `course_noticeboards_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_noticeboards`
--

LOCK TABLES `course_noticeboards` WRITE;
/*!40000 ALTER TABLE `course_noticeboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_noticeboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delete_account_requests`
--

DROP TABLE IF EXISTS `delete_account_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delete_account_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delete_account_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `delete_account_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delete_account_requests`
--

LOCK TABLES `delete_account_requests` WRITE;
/*!40000 ALTER TABLE `delete_account_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `delete_account_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_categories`
--

DROP TABLE IF EXISTS `discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_categories_discount_id_foreign` (`discount_id`),
  KEY `discount_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `discount_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_categories_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_categories`
--

LOCK TABLES `discount_categories` WRITE;
/*!40000 ALTER TABLE `discount_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_courses`
--

DROP TABLE IF EXISTS `discount_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_courses_discount_id_foreign` (`discount_id`),
  KEY `discount_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `discount_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_courses_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_courses`
--

LOCK TABLES `discount_courses` WRITE;
/*!40000 ALTER TABLE `discount_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_groups`
--

DROP TABLE IF EXISTS `discount_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_groups_discount_id_foreign` (`discount_id`),
  KEY `discount_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `discount_groups_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_groups`
--

LOCK TABLES `discount_groups` WRITE;
/*!40000 ALTER TABLE `discount_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_users`
--

DROP TABLE IF EXISTS `discount_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `discount_users_discount_id_foreign` (`discount_id`) USING BTREE,
  KEY `discount_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `discount_users_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_users`
--

LOCK TABLES `discount_users` WRITE;
/*!40000 ALTER TABLE `discount_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` enum('percentage','fixed_amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` enum('all','course','category','meeting','product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `max_amount` int(10) unsigned DEFAULT NULL,
  `minimum_order` int(10) unsigned DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `user_type` enum('all_users','special_users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` enum('all','physical','virtual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for_first_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `expired_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `discounts_code_unique` (`code`),
  KEY `discounts_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_translations`
--

DROP TABLE IF EXISTS `faq_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_translations_faq_id_foreign` (`faq_id`),
  KEY `faq_translations_locale_index` (`locale`),
  CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_translations`
--

LOCK TABLES `faq_translations` WRITE;
/*!40000 ALTER TABLE `faq_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `faqs_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `faqs_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `faqs_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `faqs_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `favorites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `favorites_user_id_foreign` (`user_id`) USING BTREE,
  KEY `favorites_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `favorites_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_webinar_translations`
--

DROP TABLE IF EXISTS `feature_webinar_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_webinar_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feature_webinar_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_webinar_translations_feature_webinar_id_foreign` (`feature_webinar_id`),
  KEY `feature_webinar_translations_locale_index` (`locale`),
  CONSTRAINT `feature_webinar_translations_feature_webinar_id_foreign` FOREIGN KEY (`feature_webinar_id`) REFERENCES `feature_webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_webinar_translations`
--

LOCK TABLES `feature_webinar_translations` WRITE;
/*!40000 ALTER TABLE `feature_webinar_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_webinar_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_webinars`
--

DROP TABLE IF EXISTS `feature_webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `page` enum('categories','home','home_categories') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `feature_webinars_webinar_id_index` (`webinar_id`) USING BTREE,
  CONSTRAINT `feature_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_webinars`
--

LOCK TABLES `feature_webinars` WRITE;
/*!40000 ALTER TABLE `feature_webinars` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_webinars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_translations`
--

DROP TABLE IF EXISTS `file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_translations_file_id_foreign` (`file_id`),
  KEY `file_translations_locale_index` (`locale`),
  CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_translations`
--

LOCK TABLES `file_translations` WRITE;
/*!40000 ALTER TABLE `file_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `downloadable` tinyint(1) DEFAULT 0,
  `storage` enum('upload','youtube','vimeo','external_link','google_drive','dropbox','iframe','s3','upload_archive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interactive_type` enum('adobe_captivate','i_spring','custom') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interactive_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interactive_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `files_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `files_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `files_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `files_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_option_translations`
--

DROP TABLE IF EXISTS `filter_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_option_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_option_translations_filter_option_id_foreign` (`filter_option_id`),
  KEY `filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `filter_option_translations_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_option_translations`
--

LOCK TABLES `filter_option_translations` WRITE;
/*!40000 ALTER TABLE `filter_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_options`
--

DROP TABLE IF EXISTS `filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filter_options_filter_id_foreign` (`filter_id`) USING BTREE,
  CONSTRAINT `filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_options`
--

LOCK TABLES `filter_options` WRITE;
/*!40000 ALTER TABLE `filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_translations`
--

DROP TABLE IF EXISTS `filter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_translations_filter_id_foreign` (`filter_id`),
  KEY `filter_translations_locale_index` (`locale`),
  CONSTRAINT `filter_translations_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_translations`
--

LOCK TABLES `filter_translations` WRITE;
/*!40000 ALTER TABLE `filter_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filters_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('requested','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `follows_follower_foreign` (`follower`) USING BTREE,
  KEY `follows_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `follows_follower_foreign` FOREIGN KEY (`follower`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_featured_topics`
--

DROP TABLE IF EXISTS `forum_featured_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_featured_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_featured_topics_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_featured_topics_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_featured_topics`
--

LOCK TABLES `forum_featured_topics` WRITE;
/*!40000 ALTER TABLE `forum_featured_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_featured_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_recommended_topic_items`
--

DROP TABLE IF EXISTS `forum_recommended_topic_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_recommended_topic_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recommended_topic_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_recommended_topic_items_recommended_topic_id_foreign` (`recommended_topic_id`),
  KEY `forum_recommended_topic_items_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_recommended_topic_items_recommended_topic_id_foreign` FOREIGN KEY (`recommended_topic_id`) REFERENCES `forum_recommended_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_recommended_topic_items_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_recommended_topic_items`
--

LOCK TABLES `forum_recommended_topic_items` WRITE;
/*!40000 ALTER TABLE `forum_recommended_topic_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_recommended_topic_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_recommended_topics`
--

DROP TABLE IF EXISTS `forum_recommended_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_recommended_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_recommended_topics`
--

LOCK TABLES `forum_recommended_topics` WRITE;
/*!40000 ALTER TABLE `forum_recommended_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_recommended_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_attachments`
--

DROP TABLE IF EXISTS `forum_topic_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_attachments_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_attachments_creator_id_foreign` (`creator_id`),
  CONSTRAINT `forum_topic_attachments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_attachments_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_attachments`
--

LOCK TABLES `forum_topic_attachments` WRITE;
/*!40000 ALTER TABLE `forum_topic_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_bookmarks`
--

DROP TABLE IF EXISTS `forum_topic_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic_bookmarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_bookmarks_user_id_foreign` (`user_id`),
  KEY `forum_topic_bookmarks_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_topic_bookmarks_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_bookmarks`
--

LOCK TABLES `forum_topic_bookmarks` WRITE;
/*!40000 ALTER TABLE `forum_topic_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_likes`
--

DROP TABLE IF EXISTS `forum_topic_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `topic_post_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_likes_user_id_foreign` (`user_id`),
  KEY `forum_topic_likes_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_likes_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_likes_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_likes`
--

LOCK TABLES `forum_topic_likes` WRITE;
/*!40000 ALTER TABLE `forum_topic_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_posts`
--

DROP TABLE IF EXISTS `forum_topic_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_posts_user_id_foreign` (`user_id`),
  KEY `forum_topic_posts_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_posts_parent_id_foreign` (`parent_id`),
  CONSTRAINT `forum_topic_posts_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `forum_topic_posts_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_posts`
--

LOCK TABLES `forum_topic_posts` WRITE;
/*!40000 ALTER TABLE `forum_topic_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic_reports`
--

DROP TABLE IF EXISTS `forum_topic_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned DEFAULT NULL,
  `topic_post_id` int(10) unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_reports_user_id_foreign` (`user_id`),
  KEY `forum_topic_reports_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_reports_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_reports_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic_reports`
--

LOCK TABLES `forum_topic_reports` WRITE;
/*!40000 ALTER TABLE `forum_topic_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topic_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topics`
--

DROP TABLE IF EXISTS `forum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `forum_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 0,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_topics_slug_unique` (`slug`),
  KEY `forum_topics_creator_id_foreign` (`creator_id`),
  KEY `forum_topics_forum_id_foreign` (`forum_id`),
  CONSTRAINT `forum_topics_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topics_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topics`
--

LOCK TABLES `forum_topics` WRITE;
/*!40000 ALTER TABLE `forum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_translations`
--

DROP TABLE IF EXISTS `forum_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_translations_forum_id_foreign` (`forum_id`),
  KEY `forum_translations_locale_index` (`locale`),
  CONSTRAINT `forum_translations_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_translations`
--

LOCK TABLES `forum_translations` WRITE;
/*!40000 ALTER TABLE `forum_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forums_slug_unique` (`slug`),
  KEY `forums_role_id_foreign` (`role_id`),
  KEY `forums_group_id_foreign` (`group_id`),
  CONSTRAINT `forums_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forums_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_users_group_id_foreign` (`group_id`) USING BTREE,
  KEY `group_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groups_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_registration_packages`
--

DROP TABLE IF EXISTS `groups_registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_registration_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_registration_packages_group_id_foreign` (`group_id`),
  CONSTRAINT `groups_registration_packages_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_registration_packages`
--

LOCK TABLES `groups_registration_packages` WRITE;
/*!40000 ALTER TABLE `groups_registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_sections`
--

DROP TABLE IF EXISTS `home_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('featured_classes','latest_bundles','latest_classes','best_rates','trend_categories','full_advertising_banner','best_sellers','discount_classes','free_classes','store_products','testimonials','subscribes','find_instructors','reward_program','become_instructor','forum_section','video_or_image_section','instructors','half_advertising_banner','organizations','blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_sections_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_sections`
--

LOCK TABLES `home_sections` WRITE;
/*!40000 ALTER TABLE `home_sections` DISABLE KEYS */;
INSERT INTO `home_sections` VALUES (2,'blog',7),(3,'full_advertising_banner',1),(4,'latest_classes',4),(5,'free_classes',6),(6,'subscribes',2),(7,'half_advertising_banner',3),(8,'trend_categories',9),(9,'video_or_image_section',5),(10,'testimonials',10),(11,'store_products',8),(12,'forum_section',11);
/*!40000 ALTER TABLE `home_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jazzcash_transactions`
--

DROP TABLE IF EXISTS `jazzcash_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jazzcash_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `txn_ref_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Order data fields and values',
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Jazzcash request data fields and values',
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Jazzcash response data fields and values',
  `status` enum('pending','error','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jazzcash_transactions`
--

LOCK TABLES `jazzcash_transactions` WRITE;
/*!40000 ALTER TABLE `jazzcash_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jazzcash_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_times`
--

DROP TABLE IF EXISTS `meeting_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(10) unsigned NOT NULL,
  `meeting_type` enum('all','in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `day_label` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meeting_times_meeting_id_foreign` (`meeting_id`) USING BTREE,
  CONSTRAINT `meeting_times_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_times`
--

LOCK TABLES `meeting_times` WRITE;
/*!40000 ALTER TABLE `meeting_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `in_person` tinyint(1) NOT NULL DEFAULT 0,
  `in_person_amount` int(11) DEFAULT NULL,
  `group_meeting` tinyint(1) NOT NULL DEFAULT 0,
  `online_group_min_student` int(11) DEFAULT NULL,
  `online_group_max_student` int(11) DEFAULT NULL,
  `online_group_amount` int(11) DEFAULT NULL,
  `in_person_group_min_student` int(11) DEFAULT NULL,
  `in_person_group_max_student` int(11) DEFAULT NULL,
  `in_person_group_amount` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meetings_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `meetings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1020,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1675792482);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2020_08_09_145553_create_roles_table',1),(4,'2020_08_09_145834_create_sections_table',1),(5,'2020_08_09_145926_create_permissions_table',1),(6,'2020_08_24_163003_create_webinars_table',1),(7,'2020_08_24_164823_create_webinar_partner_teacher_table',1),(8,'2020_08_24_165658_create_tags_table',1),(9,'2020_08_24_165835_create_webinar_tag_table',1),(10,'2020_08_24_171611_create_categories_table',1),(11,'2020_08_29_052437_create_filters_table',1),(12,'2020_08_29_052900_create_filter_options_table',1),(13,'2020_08_29_054455_add_category_id_in_webinar_table',1),(14,'2020_09_01_174741_add_seo_description_and_start_end_time_in_webinar_table',1),(15,'2020_09_02_180508_create_webinar_filter_option_table',1),(16,'2020_09_02_193923_create_tickets_table',1),(17,'2020_09_02_210447_create_sessions_table',1),(18,'2020_09_02_212642_create_files_table',1),(19,'2020_09_03_175543_create_faqs_table',1),(20,'2020_09_08_175539_delete_webinar_tag_and_update_tag_table',1),(21,'2020_09_09_154522_create_quizzes_table',1),(22,'2020_09_09_174646_create_quizzes_questions_table',1),(23,'2020_09_09_182726_create_quizzes_questions_answers_table',1),(24,'2020_09_14_160028_create_prerequisites_table',1),(25,'2020_09_14_183235_nullable_item_id_in_quizzes_table',1),(26,'2020_09_14_190110_create_webinar_quizzes_table',1),(27,'2020_09_16_163835_create_quizzes_results_table',1),(28,'2020_09_24_102115_add_total_mark_in_quize_table',1),(29,'2020_09_24_132242_create_comment_table',1),(30,'2020_09_24_132639_create_favorites_table',1),(31,'2020_09_26_181200_create_certificate_table',1),(32,'2020_09_26_181444_create_certificates_templates_table',1),(33,'2020_09_30_170451_add_slug_in_webinars_table',1),(34,'2020_09_30_191202_create_purchases_table',1),(35,'2020_10_02_063828_create_rating_table',1),(36,'2020_10_02_094723_edit_table_and_add_foreign_key',1),(37,'2020_10_08_055408_add_reviwes_table',1),(38,'2020_10_08_084100_edit_status_comments_table',1),(39,'2020_10_08_121041_create_meetings_table',2),(40,'2020_10_08_121621_create_meeting_times_table',2),(41,'2020_10_08_121848_create_meeting_requests_table',2),(42,'2020_10_15_172913_add_about_and_head_line_in_users_table',2),(43,'2020_10_15_173645_create_follow_table',2),(46,'2020_10_17_100606_create_badges_table',3),(47,'2020_10_08_121848_create_reserve_meetings_table',4),(48,'2020_10_20_193013_update_users_table',5),(50,'2020_10_18_220323_convert_creatore_user_id_to_creator_id',7),(51,'2020_10_22_153502_create_cart_table',7),(52,'2020_10_22_154636_create_orders_table',7),(53,'2020_10_22_155930_create_order_items_table',7),(54,'2020_10_23_204203_create_sales_table',7),(55,'2020_10_23_211459_create_accounting_table',7),(56,'2020_10_23_213515_create_discounts_table',7),(57,'2020_10_23_213934_create_discount_users_table',7),(58,'2020_10_23_235444_create_ticket_users_table',7),(59,'2020_10_25_172331_create_groups_table',7),(60,'2020_10_25_172523_create_group_users_table',7),(62,'2020_11_02_202754_edit_email_in_users_table',8),(63,'2020_11_03_200314_edit_some_tables',9),(64,'2020_11_06_193300_create_settings_table',10),(67,'2020_11_09_202533_create_feature_webinars_table',11),(68,'2020_11_10_193459_edit_webinars_table',12),(69,'2020_11_11_203344_create_trend_categories_table',13),(72,'2020_11_11_222833_create_blog_categories_table',14),(75,'2020_11_11_231204_create_blog_table',15),(76,'2020_10_25_223247_add_sub_title_tickets_table',16),(77,'2020_10_28_001340_add_count_in_discount_users_table',16),(78,'2020_10_28_221509_create_payment_channels_table',16),(79,'2020_11_01_120909_change_class_name_enum_payment_channels_table',16),(80,'2020_11_07_233948_add_some_raw_in_order_items__table',16),(81,'2020_11_10_061350_add_discount_id_in_order_items_table',16),(82,'2020_11_10_071651_decimal_orders_order_items_sales_table',16),(83,'2020_11_11_193138_change_reference_id_type_in_orders_tabel',16),(84,'2020_11_11_222413_change_meeting_id_to_meeting_time_id_in_order_items_table',16),(85,'2020_11_11_225421_add_locked_at_and_reserved_at_and_change_request_time_to_day_in_reserve_meetings_table',17),(86,'2020_11_12_000116_add_type_in_orders_table',17),(87,'2020_11_12_001912_change_meeting_id_to_meeting_time_id_in_accounting_table',17),(88,'2020_11_12_133009_decimal_paid_amount_in_reserve_meetings_table',17),(91,'2020_11_12_170109_add_blog_id_to_comments_table',18),(98,'2020_11_14_201228_add_bio_and_ban_to_users_table',20),(99,'2020_11_14_224447_create_users_badges_table',21),(100,'2020_11_14_233319_create_payout_request_table',22),(101,'2020_11_15_010622_change_byer_id_and_add_seller_id_in_sales_table',22),(102,'2020_11_16_195009_create_supports_table',22),(103,'2020_11_16_201814_create_support_departments_table',22),(107,'2020_11_16_202254_create_supports_table',23),(109,'2020_11_17_192744_create_support_conversations_table',24),(110,'2020_11_17_072348_create_offline_payments_table',25),(111,'2020_11_19_191943_add_replied_status_to_comments_table',25),(114,'2020_11_20_215748_create_subscribes_table',26),(115,'2020_11_21_185519_create_notification_templates_table',27),(116,'2020_11_22_210832_create_promotions_table',28),(118,'2020_11_23_194153_add_status_column_to_discounts_table',29),(119,'2020_11_23_213532_create_users_occupations_table',30),(120,'2020_11_30_220855_change_amount_in_payouts_table',31),(121,'2020_11_30_231334_add_pay_date_in_offline_payments_table',31),(122,'2020_11_30_233018_add_charge_enum_in_type_in_orders_table',31),(123,'2020_12_01_193948_create_testimonials_table',32),(124,'2020_12_02_202043_edit_and_add_types_to_webinars_table',33),(128,'2020_12_04_204048_add_column_creator_id_to_some_tables',34),(129,'2020_12_05_205320_create_text_lessons_table',35),(130,'2020_12_05_210052_create_text_lessons_attachments_table',36),(131,'2020_12_06_215701_add_order_column_to_webinar_items_tables',37),(132,'2020_12_11_114844_add_column_storage_to_files_table',38),(133,'2020_12_07_211009_add_subscribe_id_in_order_items_table',39),(134,'2020_12_07_211657_nullable_payment_method_in_orders_table',39),(135,'2020_12_07_212306_add_subscribe_enum__type_in_orders_table',39),(136,'2020_12_07_223237_changes_in_sales_table',39),(137,'2020_12_07_224925_add_subscribe_id_in_accounting_table',39),(138,'2020_12_07_230200_create_subscribe_uses_table',39),(139,'2020_12_11_123209_add_subscribe_type_account_in_accounting_table',39),(140,'2020_12_11_132819_add_sale_id_in_subscribe_use_in_subscribe_uses_table',39),(141,'2020_12_11_135824_add_subscribe_payment_method_in_sales_table',39),(143,'2020_12_13_205751_create_advertising_banners_table',41),(145,'2020_12_14_204251_create_become_instructors_table',42),(146,'2020_11_12_232207_create_reports_table',43),(147,'2020_11_12_232207_create_comments_reports_table',44),(148,'2020_12_17_210822_create_webinar_reports_table',45),(150,'2020_12_18_181551_create_notifications_table',46),(151,'2020_12_18_195833_create_notifications_status_table',47),(152,'2020_12_19_195152_add_status_column_to_payment_channels_table',48),(154,'2020_12_20_231434_create_contacts_table',49),(155,'2020_12_21_210345_edit_quizzes_table',50),(156,'2020_12_24_221715_add_column_to_users_table',50),(157,'2020_12_24_084728_create_special_offers_table',51),(158,'2020_12_25_204545_add_promotion_enum_type_in_orders_table',51),(159,'2020_12_25_205139_add_promotion_id_in_order_items_table',51),(160,'2020_12_25_205811_add_promotion_id_in_accounting_table',51),(161,'2020_12_25_210341_add_promotion_id_in_sales_table',51),(162,'2020_12_25_212453_add_promotion_type_account_enum_in_accounting_table',51),(163,'2020_12_25_231005_add_promotion_type_enum_in_sales_table',51),(166,'2020_12_29_192943_add_column_reply_to_contacts_table',53),(167,'2020_12_30_225001_create_payu_transactions_table',54),(168,'2021_01_06_202649_edit_column_password_from_users_table',55),(169,'2021_01_08_134022_add_api_column_to_sessions_table',56),(170,'2021_01_10_215540_add_column_store_type_to_accounting',57),(173,'2021_01_13_214145_edit_carts_table',58),(174,'2021_01_13_230725_delete_column_type_from_orders_table',59),(175,'2021_01_20_214653_add_discount_column_to_reserve_meetings_table',60),(177,'2021_01_27_193915_add_foreign_key_to_support_conversations_table',61),(178,'2021_02_02_203821_add_viewed_at_column_to_comments_table',62),(180,'2021_02_12_134504_add_financial_approval_column_to_users_table',64),(181,'2021_02_12_131916_create_verifications_table',65),(182,'2021_02_15_221518_add_certificate_to_users_table',66),(183,'2021_02_16_194103_add_cloumn_private_to_webinars_table',66),(184,'2021_02_18_213601_edit_rates_column_webinar_reviews_table',67),(188,'2021_02_27_212131_create_noticeboards_table',68),(189,'2021_02_27_213940_create_noticeboards_status_table',68),(191,'2021_02_28_195025_edit_groups_table',69),(192,'2021_03_06_205221_create_newsletters_table',70),(193,'2021_03_12_105526_add_is_main_column_to_roles_table',71),(194,'2021_03_12_202441_add_description_column_to_feature_webinars_table',72),(195,'2021_03_18_130248_edit_status_column_from_supports_table',73),(196,'2021_03_19_113306_add_column_order_to_categories_table',74),(197,'2021_03_19_115939_add_column_order_to_filter_options_table',75),(199,'2021_03_24_100005_edit_discounts_table',76),(200,'2021_03_27_204551_create_sales_status_table',77),(202,'2021_03_28_182558_add_column_page_to_settings_table',78),(206,'2021_03_31_195835_add_new_status_in_reserve_meetings_table',79),(207,'2020_12_12_204705_create_course_learning_table',80),(208,'2021_04_19_195452_add_meta_description_column_to_blog_table',81),(209,'2021_04_21_200131_add_icon_column_to_categories_table',82),(210,'2021_04_21_203746_add_is_popular_column_to_subscribes_table',83),(211,'2021_04_25_203955_add_is_charge_account_column_to_order_items',84),(212,'2021_04_25_203955_add_is_charge_account_column_to_orders',85),(213,'2021_05_13_111720_add_moderator_secret_column_to_sessions_table',86),(214,'2021_05_13_123920_add_zoom_id_column_to_sessions_table',87),(215,'2021_05_14_182848_create_session_reminds_table',88),(217,'2021_05_25_193743_create_users_zoom_api_table',89),(218,'2021_05_25_205716_add_new_column_to_sessions_table',90),(219,'2021_05_27_095128_add_user_id_to_newsletters_table',91),(220,'2020_12_27_192459_create_pages_table',92),(221,'2021_07_03_222439_add_special_offer_id_to_cart_table',93),(222,'2021_09_02_101422_add_payment_data_to_orders_table',94),(223,'2021_09_02_110519_add_sender_id_to_notifications_table',95),(224,'2021_09_06_113524_create_webinar_chapters_table',96),(228,'2021_09_06_114459_add_chapter_id_to_files_table',97),(229,'2021_09_06_114532_add_chapter_id_to_text_lessons_table',97),(230,'2021_09_06_114547_add_chapter_id_to_sessions_table',97),(231,'2021_09_13_134659_add_chapter_id_to_quizzes_table',98),(234,'2021_09_14_122505_create_affiliates_table',100),(235,'2021_09_14_122117_create_affiliates_codes_table',101),(239,'2021_09_14_142927_add_affiliate_column_to_users_table',105),(241,'2021_09_14_142302_add_affiliate_column_to_accounting_table',106),(244,'2021_09_18_155914_create_blog_translations_table',107),(246,'2021_09_19_190400_create_page_translations_table',108),(248,'2021_09_19_203526_create_setting_translations_table',109),(250,'2021_09_20_140241_create_advertising_banners_translations_table',110),(252,'2021_09_20_175518_create_category_translations_table',111),(255,'2021_09_20_184724_create_filter_translations_table',112),(256,'2021_09_20_185132_create_filter_option_translations_table',112),(258,'2021_09_21_160650_create_subscribe_translations_table',113),(260,'2021_09_21_162922_create_promotion_translations_table',114),(262,'2021_09_21_164954_create_testimonial_translations_table',115),(264,'2021_09_21_182251_create_feature_webinar_translations_table',116),(266,'2021_09_21_184239_create_certificate_template_translations_table',117),(268,'2021_09_21_195731_create_support_department_translations_table',118),(270,'2021_09_21_201512_create_badge_translations_table',119),(272,'2021_09_22_120723_create_webinar_translations_table',120),(274,'2021_09_22_135518_create_ticket_translations_table',121),(276,'2021_09_22_144342_create_webinar_chapter_translations_table',122),(278,'2021_09_22_162502_create_session_translations_table',123),(280,'2021_09_22_172309_create_file_translations_table',124),(282,'2021_09_22_173500_create_faq_translations_table',125),(284,'2021_09_23_094903_create_text_lesson_translations_table',126),(286,'2021_09_27_194537_create_quiz_translations_table',127),(288,'2021_09_28_112529_create_quiz_question_translations_table',128),(290,'2021_09_28_122513_create_quizzes_questions_answer_translations_table',129),(291,'2021_12_03_103010_add_agora_session_api_to_sessions_table',130),(292,'2021_12_03_103558_add_agora_to_sessions_table',131),(293,'2021_12_03_114009_create_agora_history_table',132),(295,'2021_12_04_183524_create_regions_table',133),(298,'2021_12_25_151304_add_new_column_to_meetings_table',135),(299,'2021_12_26_142304_add_new_column_to_meeting_times_table',136),(302,'2022_01_01_162247_add_new_column_to_reserve_meetings_table',137),(305,'2022_01_02_142927_create_rewards_table',138),(307,'2022_01_03_153517_create_rewards_accounting_table',139),(308,'2022_01_04_161756_add_score_column_to_badges_table',140),(309,'2022_01_04_165147_add_points_column_to_webinars_table',141),(312,'2022_01_08_154504_edit_storage_column_and_add_new_value_to_files_table',142),(313,'2022_01_11_162839_add_timezone_column_to_users_table',143),(314,'2022_01_12_142238_add_timezone_column_to_webinars_table',144),(315,'2022_01_15_131828_create_registration_packages_table',145),(319,'2022_01_15_203133_edit_columns_in_accounting_table',146),(320,'2022_01_16_102825_edit_columns_in_order_items_table',147),(321,'2022_01_17_152605_add_registration_package_id_to_sales_table',148),(322,'2022_01_18_103414_create_users_registration_packages_table',149),(323,'2022_01_18_113331_create_groups_registration_packages_table',150),(325,'2022_01_20_110119_add_become_instructor_id_column_to_order_items_table',152),(326,'2022_01_18_160228_add_column_role_to_become_instructors_table',153),(327,'2022_01_26_080434_add_reserve_date_columns_to_reserve_meetings_table',154),(328,'2022_01_28_094259_edit_column_in_discounts_table',155),(329,'2022_01_28_094515_create_discount_courses_table',155),(330,'2022_01_28_094527_create_discount_groups_table',155),(331,'2022_01_31_093231_add_column_description_to_meeting_times_table',156),(332,'2022_01_31_093306_add_column_description_to_reserve_meetings_table',156),(334,'2022_02_01_092922_create_newsletters_history_table',157),(335,'2022_02_01_104529_create_discount_categories_table',158),(337,'2022_02_02_092820_add_attachment_column_to_offline_payments_table',159),(339,'2022_02_02_184235_add_column_video_demo_source_to_webinars_table',160),(340,'2021_12_05_193333_add_new_column_to_users_table',161),(341,'2022_02_27_072819_add_forign_key_for_region_to_users_table',162),(347,'2022_03_05_123830_create_product_categories_table',163),(348,'2022_03_05_125138_create_product_filters_table',163),(350,'2022_03_06_091528_create_product_filter_options_table',163),(351,'2022_03_07_081257_create_product_specifications_table',164),(353,'2022_03_07_081808_create_product_specification_categories_table',165),(357,'2022_03_05_125434_create_products_table',166),(358,'2022_03_07_093128_create_product_discounts_table',166),(362,'2022_03_08_101832_create_product_media_table',167),(363,'2022_03_09_054031_create_product_selected_filter_options_table',168),(364,'2022_03_09_083337_create_product_specification_meta_table',169),(369,'2022_03_09_084108_create_product_selected_specifications_table',170),(370,'2022_03_09_140558_create_product_faqs_table',171),(374,'2022_03_11_180436_create_product_reviews_table',174),(375,'2022_03_11_182715_add_product_id_to_comments_reports_table',175),(376,'2022_03_08_094452_create_product_files_table',176),(377,'2022_03_11_180746_add_product_id_to_comments_table',177),(378,'2022_03_12_102233_add_new_position_to_advertising_banners_table',178),(383,'2022_03_13_072108_add_product_id_to_sales_table',179),(385,'2022_03_13_081212_create_product_orders_table',180),(386,'2022_03_19_171559_create_product_selected_specification_translations_table',181),(387,'2022_03_21_161055_add_create_store_column_to_users_table',182),(388,'2022_03_26_065509_add_new_type_to_rewards_table',183),(389,'2022_03_28_051949_add_product_count_column_to_registration_packages_table',184),(391,'2022_03_28_054322_add_product_type_column_to_discounts_table',185),(392,'2022_03_28_062248_edit_type_column_of_rewards_accounting_table',186),(393,'2022_03_28_083906_edit_type_column_to_badges_table',187),(394,'2022_04_02_051515_create_webinar_chapter_items_table',188),(395,'2022_04_02_085059_remove_type_column_from_webinar_chapters_table',189),(396,'2022_04_02_131352_add_check_sequence_content_fields_to_contents_tables',190),(399,'2022_04_04_075541_add_assignment_type_to_webinar_chapter_items_table',192),(400,'2022_04_04_071203_create_webinar_assignments_table',193),(401,'2022_04_04_071303_create_webinar_assignment_attachments_table',193),(405,'2022_04_05_053308_create_webinar_assignment_history_table',194),(406,'2022_04_05_060030_create_webinar_assignment_history_messages_table',194),(407,'2022_04_06_121240_add_new_type_passed_assignment_to_rewards_table',195),(408,'2022_04_09_064609_add_access_content_column_to_users_table',196),(409,'2022_04_10_073822_create_bundles_table',197),(410,'2022_04_10_092348_create_bundle_filter_option_table',198),(413,'2022_04_10_130733_create_bundle_webinars_table',200),(421,'2022_04_10_093457_add_bundle_id_to_needle_tables',201),(422,'2022_04_12_153052_add_access_time_to_webinars_table',202),(423,'2022_04_13_053947_create_course_noticeboards_table',203),(424,'2022_04_13_054536_create_course_noticeboard_status_table',203),(425,'2022_04_13_130155_add_column_forum_to_webinars_table',204),(427,'2022_04_14_060606_create_course_forums_table',205),(428,'2022_04_14_063316_create_course_forum_answers_table',206),(447,'2022_04_21_133513_add_new_type_in_rewards_table',216),(448,'2022_04_21_135212_add_new_type_in_badges_table',217),(449,'2022_04_24_081637_add_new_type_instructor_blog_in_rewards_table',218),(450,'2022_04_24_082515_add_new_type_instructor_blog_in_badges_table',219),(452,'2022_04_25_043945_create_users_cookie_security_table',220),(453,'2022_04_25_143142_add_organization_price__column_to_webinars_table',221),(454,'2022_04_25_165256_add_image_and_video_to_quizzes_questions_table',222),(456,'2022_04_26_060018_edit_certificates_templates_table',223),(458,'2022_04_26_082017_edit_certificates_table',224),(459,'2022_04_26_155421_create_subscribe_reminds_table',225),(460,'2022_04_26_163428_add_instructor_id_to_noticeboards_table',226),(461,'2022_04_27_133655_add_unlimited_download_to_subscribes_table',227),(462,'2022_04_27_133655_add_infinite_use_to_subscribes_table',228),(463,'2022_04_27_140844_add_extra_time_to_join_to_sessions_table',229),(464,'2022_04_28_052318_create_webinar_extra_description_table',230),(466,'2022_05_09_125820_create_navbar_buttons_table',232),(467,'2021_06_07_000000_create_payku_transactions_table',233),(468,'2021_06_07_000001_create_payku_payments_table',233),(469,'2021_11_30_122831_create_jazzcash_transactions_table',233),(470,'2021_12_15_000000_add_new_columns_to_tables',233),(471,'2022_05_23_081324_create_product_specification_multi_values_table',234),(472,'2022_05_23_091527_create_product_selected_specification_multi_values_table',235),(475,'2022_05_23_151601_add_product_delivery_fee_column_to_sales_table',236),(476,'2022_04_18_103856_create_forums_table',237),(477,'2022_04_18_152201_create_forum_topics_table',237),(478,'2022_04_18_152845_create_forum_topic_attachments_table',237),(479,'2022_04_19_071911_create_forum_topic_posts_table',237),(480,'2022_04_19_123745_create_forum_topic_reports_table',237),(481,'2022_04_19_135314_create_forum_topic_bookmarks_table',237),(482,'2022_04_19_152929_create_forum_topic_likes_table',237),(483,'2022_04_20_152756_create_forum_featured_topics_table',237),(484,'2022_04_21_054043_create_forum_recommended_topics_table',237),(485,'2022_04_21_054815_create_forum_recommended_topic_items_table',237),(486,'2022_05_26_085212_change_some_column_varchar_to_text',238),(487,'2022_05_27_142612_add_avarat_settings_to_users_table',239),(489,'2022_05_01_151107_add_manual_added_column_to_sales_table',240),(490,'2022_05_29_162315_create_delete_account_requests_table',241),(491,'2020_10_20_211927_create_users_metas_table',242),(492,'2022_05_31_133347_add_certificate_column_to_webinars_table',243),(494,'2022_05_31_165839_add_online_viewer_column_to_files_table',244),(495,'2022_06_08_071712_create_home_sections_table',245);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbar_button_translations`
--

DROP TABLE IF EXISTS `navbar_button_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navbar_button_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navbar_button_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `navbar_button_translations_navbar_button_id_foreign` (`navbar_button_id`),
  KEY `navbar_button_translations_locale_index` (`locale`),
  CONSTRAINT `navbar_button_translations_navbar_button_id_foreign` FOREIGN KEY (`navbar_button_id`) REFERENCES `navbar_buttons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbar_button_translations`
--

LOCK TABLES `navbar_button_translations` WRITE;
/*!40000 ALTER TABLE `navbar_button_translations` DISABLE KEYS */;
INSERT INTO `navbar_button_translations` VALUES (4,4,'en','Get The App','https://play.google.com/store/games');
/*!40000 ALTER TABLE `navbar_button_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbar_buttons`
--

DROP TABLE IF EXISTS `navbar_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navbar_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `navbar_buttons_role_id_foreign` (`role_id`),
  CONSTRAINT `navbar_buttons_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbar_buttons`
--

LOCK TABLES `navbar_buttons` WRITE;
/*!40000 ALTER TABLE `navbar_buttons` DISABLE KEYS */;
INSERT INTO `navbar_buttons` VALUES (4,1);
/*!40000 ALTER TABLE `navbar_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
INSERT INTO `newsletters` VALUES (1,NULL,'182craig@gmail.com',1675850691),(2,NULL,'qKeJ_generic_fd07695d_themovingwarriors.com@data-backup-store.com',1677411540),(3,NULL,'310Q_generic_fd07695d_themovingwarriors.com@data-backup-store.com',1679145635);
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters_history`
--

DROP TABLE IF EXISTS `newsletters_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_method` enum('send_to_all','send_to_bcc','send_to_excel') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_count` int(11) DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters_history`
--

LOCK TABLES `newsletters_history` WRITE;
/*!40000 ALTER TABLE `newsletters_history` DISABLE KEYS */;
INSERT INTO `newsletters_history` VALUES (1,'Tester','<p><img src=\"/store/1/254133083_187190956935756_7361478487256596703_n.jpg\" style=\"width: 50%;\"></p><h2><font style=\"\" color=\"#a816c5\">GET READY FOR SOMETHING BIG</font></h2><h5><font color=\"#000000\">This&nbsp;Februay we will be launching my Brand New<br></font><font color=\"#000000\">APP!!</font></h5><h5><font color=\"#000000\"><br></font></h5><h6><font color=\"#000000\">Stay Tuned</font></h6>','send_to_all',NULL,1,1675959991);
/*!40000 ALTER TABLE `newsletters_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboards`
--

DROP TABLE IF EXISTS `noticeboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticeboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organ_id` int(10) unsigned DEFAULT NULL,
  `instructor_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` enum('all','organizations','students','instructors','students_and_instructors') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_organ_id_foreign` (`organ_id`),
  KEY `noticeboards_user_id_foreign` (`user_id`),
  KEY `noticeboards_instructor_id_foreign` (`instructor_id`),
  KEY `noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `noticeboards_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_organ_id_foreign` FOREIGN KEY (`organ_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboards`
--

LOCK TABLES `noticeboards` WRITE;
/*!40000 ALTER TABLE `noticeboards` DISABLE KEYS */;
INSERT INTO `noticeboards` VALUES (1,NULL,1020,NULL,NULL,'students','Skye Mallon','New Notice','<blockquote class=\"blockquote\"><span style=\"font-family: &quot;Arial Black&quot;;\">To All Students! Good Luck</span></blockquote>',1675793341);
/*!40000 ALTER TABLE `noticeboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboards_status`
--

DROP TABLE IF EXISTS `noticeboards_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticeboards_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `noticeboard_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `noticeboards_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboards_status`
--

LOCK TABLES `noticeboards_status` WRITE;
/*!40000 ALTER TABLE `noticeboards_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticeboards_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES (2,'new badge','<p>You received [u.b.title]&nbsp;badge</p>'),(3,'Change user group','<p>your group change to [u.g.title]</p>'),(4,'Course created','<p>you create new course&nbsp;with Title [c.title]</p>'),(5,'Course approve','<p>your course with title [c.title] approved</p>'),(6,'Course rejection','<p>Your course with title [c.title] rejected</p>'),(7,'New comment','<p>user [u.name] add new comment fro course with title [c.title]</p>'),(8,'New support message','<p>user [u.name] send new support message for course with title [c.title]</p>'),(9,'support message replied','<p>support message replied fro course [c.title]</p>'),(10,'New support for admin','<p>send new support&nbsp; ticket with title&nbsp;[s.t.title]</p>'),(11,'support ticket replied for admin','<p>replied support&nbsp; ticket with title&nbsp;[s.t.title]</p>'),(12,'New financial document','<p>&nbsp;New financial document for course [c.title] with type [f.d.type] with price [amount]</p>'),(13,'Payout request','<p>payout request with amount&nbsp; [payout.amount]</p>'),(14,'Payout proceed','Payout with amount [payout.amount]&nbsp;&nbsp;proceed by account [payout.account]'),(15,'New sales','<p>new sale for course with title [c.title]</p>'),(16,'New purchase','<p>new purchase for course with title [c.title]</p>'),(17,'Rating (Feedback)','<p>new feedback submitted for course with title [c.title] bu student [student.name] and rate [rate.count]</p>'),(18,'Offline payment request','<p>Offline payment request with amount [amount]</p>'),(19,'Offline payment approved','<p>Offline payment request with amount [amount]&nbsp;approved</p>'),(20,'Offline payment rejected','<p>Offline payment request with amount [amount]&nbsp;rejected</p>'),(21,'New subscribe plan','<p>New subscribe plan activated by user [u.name] for plan [s.p.name]</p>'),(22,'New appointment','<p>New appointment booked by user [u.name] in time [time.date] with price&nbsp;[amount]</p>'),(23,'New appointment link','<p>appointment&nbsp; link defined by the [instructor.name]. time [time.date] and link is [link]</p>'),(24,'Appointment reminder','<p>You have an appointment on [time.date]</p>'),(25,'Meeting finished','<p>meeting finished instructor : [instructor.name] and student :&nbsp; [student.name] and time : [time.date]</p>'),(26,'New contact message','<p>New contact message with title [c.u.title] and user name [u.name] recived</p>'),(27,'Webinar reminder','<p>Webinar reminder time [time.date] webinar title [c.title]</p>'),(28,'Promotion plan','<p>plan [p.p.name]&nbsp;&nbsp;activated for course [c.title]</p>'),(29,'Promotion plan for admin','<p>new request promotion plan [p.p.name] for course [c.title]</p>'),(30,'Certificate','<p>certificate recived for course [c.title]</p>'),(31,'Waiting quiz','<p>student [student.name]&nbsp; waiting for quiz [q.title] for course [c.title]</p>'),(32,'Waiting quiz result','<p>course [c.title]&nbsp;calculated quiz [q.title] result [q.result] by instructor</p>'),(33,'product new sale','<p>new sale for product with title [p.title]</p>'),(34,'Product New purchase','<p>new purchase for product with title [p.title]</p>'),(35,'Product New comment','<p>user [u.name] add new comment fro product with title [p.title]</p>'),(36,'Product tracking code','<p>user [u.name] add tracking code for product with title [p.title]</p>'),(37,'Product Rating (Feedback)','<p>new feedback submitted for product with title [p.title] by user [u.name] and rate [rate.count]</p>'),(38,'Product receive shipment','<p>user [u.name] received product with title [p.title]</p>'),(39,'Product out of stock','<p>The product inventory ended with the title [p.title]</p>'),(40,'Send assignment by the student to the instructor','<p>[student.name] send assignment for course by title [c.title]</p>'),(41,'when the instructor sends a message for assignment','<p>[instructor.name] send message for course by title [c.title]</p>'),(42,'assignment grade','<p>The [instructor.name]&nbsp;gave you a grade of [assignment_grade]&nbsp;for course by title [c.title]</p>'),(43,'user access to content','<p>Your access to content is enabled.</p>'),(44,'Send post in topic','<p>[u.name] send post in your topic with title [topic_title]&nbsp;</p>'),(45,'publish instructor blog post','<p>your post with title [blog_title] published.</p>'),(46,'new comment for instructor blog','<p>user [u.name] add new comment for your blog with title [blog_title]</p>'),(47,'Meeting reminder','<p>Meeting reminder time [time.date] with instructor by name [instructor.name]</p>'),(48,'subscribe expire reminder','<p>Your subscribe has been expired in&nbsp;[time.date]</p>'),(49,'Course Forum new Question','<p>[u.name] registered a question in the [c.title]&nbsp;course forum.</p>'),(50,'New answer in course forum','<p>[u.name] registered a answer in the [c.title]&nbsp;course forum.</p>');
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` enum('system','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `type` enum('single','all_users','students','instructors','organizations','group','course_students') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_user_id_foreign` (`user_id`) USING BTREE,
  KEY `notifications_group_id_foreign` (`group_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`) USING BTREE,
  CONSTRAINT `notifications_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1016,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Sample Course</p>','system','single',1656669533),(2,1016,NULL,NULL,NULL,'Course approve','<p>your course with title Sample Course approved</p>','system','single',1656669564),(3,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675866260),(4,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675867088),(5,1020,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Introduction to Budokon</p>','system','single',1675867733),(6,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675867993),(7,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675919996),(8,1020,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Introduction to Budokon</p>','system','single',1675925112),(9,1020,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Introduction to Budokon</p>','system','single',1675925500),(10,1020,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Introduction to Budokon</p>','system','single',1675925796),(11,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675925859),(12,1020,NULL,NULL,NULL,'Course created','<p>you create new course&nbsp;with Title Introduction to Budokon</p>','system','single',1675930137),(13,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675930183),(14,1020,NULL,NULL,NULL,'Course approve','<p>your course with title Introduction to Budokon approved</p>','system','single',1675952242);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_status`
--

DROP TABLE IF EXISTS `notifications_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `seen_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_status_notification_id_foreign` (`notification_id`) USING BTREE,
  CONSTRAINT `notifications_status_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_status`
--

LOCK TABLES `notifications_status` WRITE;
/*!40000 ALTER TABLE `notifications_status` DISABLE KEYS */;
INSERT INTO `notifications_status` VALUES (1,1020,4,1675867276),(2,1020,3,1675867281),(3,1020,5,1675867890),(4,1020,7,1675920382);
/*!40000 ALTER TABLE `notifications_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payments`
--

DROP TABLE IF EXISTS `offline_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `bank` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('waiting','approved','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_date` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `offline_payments_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `offline_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payments`
--

LOCK TABLES `offline_payments` WRITE;
/*!40000 ALTER TABLE `offline_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `reserve_meeting_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `become_instructor_id` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `tax_price` decimal(13,2) DEFAULT NULL,
  `commission` int(10) unsigned DEFAULT NULL,
  `commission_price` decimal(13,2) DEFAULT NULL,
  `discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_items_order_id_foreign` (`order_id`) USING BTREE,
  KEY `order_items_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `order_items_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `order_items_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `order_items_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `order_items_promotion_id_foreign` (`promotion_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1023,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,10,10.00,20,20.00,0.00,110.00,0.00,1675919814),(2,1023,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500,10,50.00,0,0.00,NULL,550.00,NULL,1675953046),(3,1023,3,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,500,10,50.00,0,0.00,NULL,550.00,NULL,1675953585),(4,1,4,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,170,10,17.00,20,34.00,0.00,187.00,0.00,1677513022);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` enum('pending','paying','paid','fail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('credit','payment_channel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_charge_account` tinyint(1) NOT NULL DEFAULT 0,
  `amount` int(10) unsigned NOT NULL,
  `tax` decimal(13,2) DEFAULT NULL,
  `total_discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) DEFAULT NULL,
  `reference_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orders_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1023,'pending','payment_channel',0,100,10.00,0.00,110.00,0.00,NULL,NULL,1675919814),(2,1023,'pending',NULL,0,500,50.00,NULL,550.00,NULL,NULL,NULL,1675953046),(3,1023,'pending','payment_channel',0,500,50.00,NULL,550.00,NULL,NULL,NULL,1675953585),(4,1,'pending','payment_channel',0,170,17.00,0.00,187.00,0.00,NULL,NULL,1677513022);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_translations`
--

DROP TABLE IF EXISTS `page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_translations_page_id_foreign` (`page_id`),
  KEY `page_translations_locale_index` (`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translations`
--

LOCK TABLES `page_translations` WRITE;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
INSERT INTO `page_translations` VALUES (1,5,'en','Terms and Conditions',NULL,'<meta charset=\"utf-8\">\r\n      <meta name=\"viewport\" content=\"width=device-width\">\r\n      <title>Terms &amp; Conditions</title>\r\n      <style> body { font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; padding:1em; } </style>\r\n    \r\n    \r\n    <strong>Terms &amp; Conditions</strong> <p>\r\n                  By downloading or using the app, these terms will\r\n                  automatically apply to you – you should make sure therefore\r\n                  that you read them carefully before using the app. You’re not\r\n                  allowed to copy or modify the app, any part of the app, or\r\n                  our trademarks in any way. You’re not allowed to attempt to\r\n                  extract the source code of the app, and you also shouldn’t try\r\n                  to translate the app into other languages or make derivative\r\n                  versions. The app itself, and all the trademarks, copyright,\r\n                  database rights, and other intellectual property rights related\r\n                  to it, still belong to The Moving Warriors.\r\n                </p> <p>\r\n                  The Moving Warriors is committed to ensuring that the app is\r\n                  as useful and efficient as possible. For that reason, we\r\n                  reserve the right to make changes to the app or to charge for\r\n                  its services, at any time and for any reason. We will never\r\n                  charge you for the app or its services without making it very\r\n                  clear to you exactly what you’re paying for.\r\n                </p> <p>\r\n                  The Moving Warriors app stores and processes personal data that\r\n                  you have provided to us, to provide our\r\n                  Service. It’s your responsibility to keep your phone and\r\n                  access to the app secure. We therefore recommend that you do\r\n                  not jailbreak or root your phone, which is the process of\r\n                  removing software restrictions and limitations imposed by the\r\n                  official operating system of your device. It could make your\r\n                  phone vulnerable to malware/viruses/malicious programs,\r\n                  compromise your phone’s security features and it could mean\r\n                  that the Moving Warriors app won’t work properly or at all.\r\n                </p> <div><p>\r\n                    The app does use third-party services that declare their\r\n                    Terms and Conditions.\r\n                  </p> <p>\r\n                    Link to Terms and Conditions of third-party service\r\n                    providers used by the app\r\n                  </p> <ul><li><a href=\"https://policies.google.com/terms\" target=\"_blank\" rel=\"noopener noreferrer\">Google Play Services</a></li><li><a href=\"https://developers.google.com/admob/terms\" target=\"_blank\" rel=\"noopener noreferrer\">AdMob</a></li><li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\" rel=\"noopener noreferrer\">Google Analytics for Firebase</a></li><li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\" rel=\"noopener noreferrer\">Firebase Crashlytics</a></li><li><a href=\"https://www.facebook.com/legal/terms/plain_text_terms\" target=\"_blank\" rel=\"noopener noreferrer\">Facebook</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p>\r\n                  You should be aware that there are certain things that\r\n                  The Moving Warriors will not take responsibility for. Certain\r\n                  functions of the app will require the app to have an active\r\n                  internet connection. The connection can be Wi-Fi or provided\r\n                  by your mobile network provider, but The Moving Warriors\r\n                  cannot take responsibility for the app not working at full\r\n                  functionality if you don’t have access to Wi-Fi, and you don’t\r\n                  have any of your data allowance left.\r\n                </p> <p></p> <p>\r\n                  If you’re using the app outside of an area with Wi-Fi, you\r\n                  should remember that the terms of the agreement with your\r\n                  mobile network provider will still apply. As a result, you may\r\n                  be charged by your mobile provider for the cost of data for\r\n                  the duration of the connection while accessing the app, or\r\n                  other third-party charges. In using the app, you’re accepting\r\n                  responsibility for any such charges, including roaming data\r\n                  charges if you use the app outside of your home territory\r\n                  (i.e. region or country) without turning off data roaming. If\r\n                  you are not the bill payer for the device on which you’re\r\n                  using the app, please be aware that we assume that you have\r\n                  received permission from the bill payer for using the app.\r\n                </p> <p>\r\n                  Along the same lines, The Moving Warriors cannot always take\r\n                  responsibility for the way you use the app i.e. You need to\r\n                  make sure that your device stays charged – if it runs out of\r\n                  battery and you can’t turn it on to avail the Service,\r\n                  The Moving Warriors cannot accept responsibility.\r\n                </p> <p>\r\n                  With respect to The Moving Warriors’s responsibility for your\r\n                  use of the app, when you’re using the app, it’s important to\r\n                  bear in mind that although we endeavor to ensure that it is\r\n                  updated and correct at all times, we do rely on third parties\r\n                  to provide information to us so that we can make it available\r\n                  to you. The Moving Warriors accepts no liability for any\r\n                  loss, direct or indirect, you experience as a result of\r\n                  relying wholly on this functionality of the app.\r\n                </p> <p>\r\n                  At some point, we may wish to update the app. The app is\r\n                  currently available on Android &amp; iOS – the requirements for the \r\n                  both systems(and for any additional systems we\r\n                  decide to extend the availability of the app to) may change,\r\n                  and you’ll need to download the updates if you want to keep\r\n                  using the app. The Moving Warriors does not promise that it\r\n                  will always update the app so that it is relevant to you\r\n                  and/or works with the Android &amp; iOS version that you have\r\n                  installed on your device. However, you promise to always\r\n                  accept updates to the application when offered to you, We may\r\n                  also wish to stop providing the app, and may terminate use of\r\n                  it at any time without giving notice of termination to you.\r\n                  Unless we tell you otherwise, upon any termination, (a) the\r\n                  rights and licenses granted to you in these terms will end;\r\n                  (b) you must stop using the app, and (if needed) delete it\r\n                  from your device.\r\n                </p> <p><strong>Changes to This Terms and Conditions</strong></p> <p>\r\n                  We may update our Terms and Conditions\r\n                  from time to time. Thus, you are advised to review this page\r\n                  periodically for any changes. We will\r\n                  notify you of any changes by posting the new Terms and\r\n                  Conditions on this page.\r\n                </p> <p>\r\n                  These terms and conditions are effective as of 2023-02-18\r\n                </p> <p><strong>Contact Us</strong></p> <p>\r\n                  If you have any questions or suggestions about our\r\n                  Terms and Conditions, do not hesitate to contact us\r\n                  at info@themovingwarriors.com</p>'),(2,7,'en','Privacy Policy',NULL,'<meta charset=\"utf-8\">\r\n      <meta name=\"viewport\" content=\"width=device-width\">\r\n      <title>Privacy Policy</title>\r\n      <style> body { font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; padding:1em; } </style>\r\n    \r\n    \r\n    <strong>Privacy Policy</strong> <p>\r\n                  The Moving Warriors built the Moving Warriors app as\r\n                  a Free app. This SERVICE is provided by\r\n                  The Moving Warriors at no cost and is intended for use as\r\n                  is.\r\n                </p> <p>\r\n                  This page is used to inform visitors regarding our\r\n                  policies with the collection, use, and disclosure of Personal\r\n                  Information if anyone decided to use our Service.\r\n                </p> <p>\r\n                  If you choose to use our Service, then you agree to\r\n                  the collection and use of information in relation to this\r\n                  policy. The Personal Information that we collect is\r\n                  used for providing and improving the Service. We will not use or share your information with\r\n                  anyone except as described in this Privacy Policy.\r\n                </p> <p>\r\n                  The terms used in this Privacy Policy have the same meanings\r\n                  as in our Terms and Conditions, which are accessible at\r\n                  Moving Warriors unless otherwise defined in this Privacy Policy.\r\n                </p> <p><strong>Information Collection and Use</strong></p> <p>\r\n                  For a better experience, while using our Service, we\r\n                  may require you to provide us with certain personally\r\n                  identifiable information. The information that\r\n                  we request will be retained by us and used as described in this privacy policy.\r\n                </p> <div><p>\r\n                    The app does use third-party services that may collect\r\n                    information used to identify you.\r\n                  </p> <p>\r\n                    Link to the privacy policy of third-party service providers used\r\n                    by the app\r\n                  </p> <ul><li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\" rel=\"noopener noreferrer\">Google Play Services</a></li><li><a href=\"https://support.google.com/admob/answer/6128543?hl=en\" target=\"_blank\" rel=\"noopener noreferrer\">AdMob</a></li><li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\" rel=\"noopener noreferrer\">Google Analytics for Firebase</a></li><li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\" rel=\"noopener noreferrer\">Firebase Crashlytics</a></li><li><a href=\"https://www.facebook.com/about/privacy/update/printable\" target=\"_blank\" rel=\"noopener noreferrer\">Facebook</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong>Log Data</strong></p> <p>\r\n                  We want to inform you that whenever you\r\n                  use our Service, in a case of an error in the app\r\n                  we collect data and information (through third-party\r\n                  products) on your phone called Log Data. This Log Data may\r\n                  include information such as your device Internet Protocol\r\n                  (“IP”) address, device name, operating system version, the\r\n                  configuration of the app when utilizing our Service,\r\n                  the time and date of your use of the Service, and other\r\n                  statistics.\r\n                </p> <p><strong>Cookies</strong></p> <p>\r\n                  Cookies are files with a small amount of data that are\r\n                  commonly used as anonymous unique identifiers. These are sent\r\n                  to your browser from the websites that you visit and are\r\n                  stored on your device\'s internal memory.\r\n                </p> <p>\r\n                  This Service does not use these “cookies” explicitly. However,\r\n                  the app may use third-party code and libraries that use\r\n                  “cookies” to collect information and improve their services.\r\n                  You have the option to either accept or refuse these cookies\r\n                  and know when a cookie is being sent to your device. If you\r\n                  choose to refuse our cookies, you may not be able to use some\r\n                  portions of this Service.\r\n                </p> <p><strong>Service Providers</strong></p> <p>\r\n                  We may employ third-party companies and\r\n                  individuals due to the following reasons:\r\n                </p> <ul><li>To facilitate our Service;</li> <li>To provide the Service on our behalf;</li> <li>To perform Service-related services; or</li> <li>To assist us in analyzing how our Service is used.</li></ul> <p>\r\n                  We want to inform users of this Service\r\n                  that these third parties have access to their Personal\r\n                  Information. The reason is to perform the tasks assigned to\r\n                  them on our behalf. However, they are obligated not to\r\n                  disclose or use the information for any other purpose.\r\n                </p> <p><strong>Security</strong></p> <p>\r\n                  We value your trust in providing us your\r\n                  Personal Information, thus we are striving to use commercially\r\n                  acceptable means of protecting it. But remember that no method\r\n                  of transmission over the internet, or method of electronic\r\n                  storage is 100% secure and reliable, and we cannot\r\n                  guarantee its absolute security.\r\n                </p> <p><strong>Links to Other Sites</strong></p> <p>\r\n                  This Service may contain links to other sites. If you click on\r\n                  a third-party link, you will be directed to that site. Note\r\n                  that these external sites are not operated by us.\r\n                  Therefore, we strongly advise you to review the\r\n                  Privacy Policy of these websites. We have\r\n                  no control over and assume no responsibility for the content,\r\n                  privacy policies, or practices of any third-party sites or\r\n                  services.\r\n                </p> <p><strong>Children’s Privacy</strong></p> <div><p>\r\n                    These Services do not address anyone under the age of 13.\r\n                    We do not knowingly collect personally\r\n                    identifiable information from children under 13 years of age. In the case\r\n                    we discover that a child under 13 has provided\r\n                    us with personal information, we immediately\r\n                    delete this from our servers. If you are a parent or guardian\r\n                    and you are aware that your child has provided us with\r\n                    personal information, please contact us so that\r\n                    we will be able to do the necessary actions.\r\n                  </p></div> <!----> <p><strong>Changes to This Privacy Policy</strong></p> <p>\r\n                  We may update our Privacy Policy from\r\n                  time to time. Thus, you are advised to review this page\r\n                  periodically for any changes. We will\r\n                  notify you of any changes by posting the new Privacy Policy on\r\n                  this page.\r\n                </p> <p>This policy is effective as of 2023-02-18</p> <p><strong>Contact Us</strong></p> <p>\r\n                  If you have any questions or suggestions about our\r\n                  Privacy Policy, do not hesitate to contact us at info@themovingwarriors.com\r\n    \r\n    \r\n      </p>'),(3,8,'en','Events',NULL,'<script src=\"https://apps.elfsight.com/p/platform.js\" defer=\"\"></script>\r\n<div class=\"elfsight-app-a16857dd-03a3-4171-b420-577750305d78\"></div>');
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `robot` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('publish','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_link_unique` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (3,'/about','About',1,'publish',1609088468),(5,'/terms','Terms and Conditions',1,'publish',1676690397),(6,'/reward_points_system','Reward Points System',1,'publish',1646398467),(7,'/privacy','Privacy Policy',1,'publish',1676690470),(8,'/events','Events',1,'publish',1678964290);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('craig@nl4yb.co.za','l0Z1cuZcejamD3vTjaK5bYapCtOi6IiNK2OHO8VM03Rm8AxWsHzk99wOFdbh','2023-03-16 09:37:49');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payku_payments`
--

DROP TABLE IF EXISTS `payku_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payku_payments` (
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_4_digits` int(10) unsigned DEFAULT NULL,
  `installments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_parameters` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  UNIQUE KEY `payku_payments_transaction_id_unique` (`transaction_id`),
  CONSTRAINT `payku_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `payku_transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payku_payments`
--

LOCK TABLES `payku_payments` WRITE;
/*!40000 ALTER TABLE `payku_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payku_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payku_transactions`
--

DROP TABLE IF EXISTS `payku_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payku_transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `notified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `payku_transactions_id_unique` (`id`),
  UNIQUE KEY `payku_transactions_order_unique` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payku_transactions`
--

LOCK TABLES `payku_transactions` WRITE;
/*!40000 ALTER TABLE `payku_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payku_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_channels`
--

DROP TABLE IF EXISTS `payment_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_channels`
--

LOCK TABLES `payment_channels` WRITE;
/*!40000 ALTER TABLE `payment_channels` DISABLE KEYS */;
INSERT INTO `payment_channels` VALUES (1,'Alipay','Alipay','inactive','/store/1/default_images/payment gateways/alipay.png','','1654755044'),(2,'Authorize.net','Authorizenet','inactive','/store/1/default_images/payment gateways/authirizenet.png','','1654755044'),(3,'Bitpay','Bitpay','inactive','/store/1/default_images/payment gateways/bitpay.png','','1654755044'),(4,'Braintree','Braintree','inactive','/store/1/default_images/payment gateways/braintree.png','','1654755044'),(5,'Cashu','Cashu','inactive','/store/1/default_images/payment gateways/cashu.png','','1654755044'),(6,'Flutterwave','Flutterwave','inactive','/store/1/default_images/payment gateways/flutterwave.png','','1654755044'),(7,'Instamojo','Instamojo','inactive','/store/1/default_images/payment gateways/instamojo.png','','1654755044'),(8,'Iyzipay','Iyzipay','inactive','/store/1/default_images/payment gateways/iyzico.png','','1654755044'),(9,'Izipay','Izipay','inactive','/store/1/default_images/payment gateways/izipay.png','','1654755044'),(10,'KlarnaCheckout','KlarnaCheckout','inactive','/store/1/default_images/payment gateways/klarna.png','','1654755044'),(11,'MercadoPago','MercadoPago','inactive','/store/1/default_images/payment gateways/mercadopago.png','','1654755044'),(12,'Midtrans','Midtrans','inactive','/store/1/default_images/payment gateways/midtrans.png','','1654755044'),(13,'Mollie','Mollie','inactive','/store/1/default_images/payment gateways/mollie.png','','1654755044'),(14,'N-genius','Ngenius','inactive','/store/1/default_images/payment gateways/ngenius.png','','1654755044'),(15,'Payfort','Payfort','inactive','/store/1/default_images/payment gateways/payfort.png','','1654755044'),(16,'Payhere','Payhere','inactive','/store/1/default_images/payment gateways/payhere.png','','1654755044'),(17,'Payku','Payku','inactive','/store/1/default_images/payment gateways/payku.png','','1654755044'),(18,'Paylink','Paylink','inactive','/store/1/default_images/payment gateways/paylink.png','','1654755044'),(19,'Paypal','Paypal','inactive','/store/1/default_images/payment gateways/paypal.png','','1654755044'),(20,'Paysera','Paysera','inactive','/store/1/default_images/payment gateways/paysera.png','','1654755044'),(21,'Paystack','Paystack','active','/store/1/default_images/payment gateways/paystack.png','','1654755044'),(22,'Paytm','Paytm','inactive','/store/1/default_images/payment gateways/paytm.png','','1654755044'),(23,'Payu','Payu','inactive','/store/1/default_images/payment gateways/payu.png','','1654755044'),(24,'Razorpay','Razorpay','inactive','/store/1/default_images/payment gateways/razorpay.png','','1654755044'),(25,'Robokassa','Robokassa','inactive','/store/1/default_images/payment gateways/robokassa.png','','1654755044'),(26,'Sslcommerz','Sslcommerz','inactive','/store/1/default_images/payment gateways/sslcommerz.png','','1654755044'),(27,'Stripe','Stripe','inactive','/store/1/default_images/payment gateways/stripe.png','','1654755044'),(28,'Toyyibpay','Toyyibpay','inactive','/store/1/default_images/payment gateways/toyyibpay.png','','1654755044'),(29,'Voguepay','Voguepay','inactive','/store/1/default_images/payment gateways/voguepay.png','','1654755044'),(31,'Zarinpal','Zarinpal','inactive','/store/1/default_images/payment gateways/zarinpal.png','','1654755044'),(32,'JazzCash','JazzCash','inactive','/store/1/default_images/payment gateways/jazzcash.png','','1654755044');
/*!40000 ALTER TABLE `payment_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payouts`
--

DROP TABLE IF EXISTS `payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `account_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_bank_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('waiting','done','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payouts_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payouts`
--

LOCK TABLES `payouts` WRITE;
/*!40000 ALTER TABLE `payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payu_transactions`
--

DROP TABLE IF EXISTS `payu_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payu_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `paid_for_id` bigint(20) unsigned DEFAULT NULL,
  `paid_for_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','failed','successful','invalid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payu_transactions_transaction_id_unique` (`transaction_id`) USING BTREE,
  KEY `payu_transactions_status_index` (`status`) USING BTREE,
  KEY `payu_transactions_verified_at_index` (`verified_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payu_transactions`
--

LOCK TABLES `payu_transactions` WRITE;
/*!40000 ALTER TABLE `payu_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payu_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `section_id` int(10) unsigned DEFAULT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `permissions_role_id_index` (`role_id`) USING BTREE,
  KEY `permissions_section_id_index` (`section_id`) USING BTREE,
  CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (11950,2,1,1),(11951,2,2,1),(11952,2,3,1),(11953,2,4,1),(11954,2,5,1),(11955,2,6,1),(11956,2,7,1),(11957,2,8,1),(11958,2,9,1),(11959,2,10,1),(11960,2,11,1),(11961,2,12,1),(11962,2,13,1),(11963,2,14,1),(11964,2,15,1),(11965,2,16,1),(11966,2,17,1),(11967,2,25,1),(11968,2,26,1),(11969,2,50,1),(11970,2,51,1),(11971,2,52,1),(11972,2,53,1),(11973,2,54,1),(11974,2,100,1),(11975,2,101,1),(11976,2,102,1),(11977,2,103,1),(11978,2,104,1),(11979,2,105,1),(11980,2,106,1),(11981,2,107,1),(11982,2,108,1),(11983,2,109,1),(11984,2,110,1),(11985,2,111,1),(11986,2,112,1),(11987,2,113,1),(11988,2,114,1),(11989,2,115,1),(11990,2,116,1),(11991,2,117,1),(11992,2,150,1),(11993,2,151,1),(11994,2,152,1),(11995,2,153,1),(11996,2,154,1),(11997,2,155,1),(11998,2,156,1),(11999,2,157,1),(12000,2,158,1),(12001,2,159,1),(12002,2,160,1),(12003,2,161,1),(12004,2,162,1),(12005,2,163,1),(12006,2,164,1),(12007,2,165,1),(12008,2,200,1),(12009,2,201,1),(12010,2,202,1),(12011,2,203,1),(12012,2,204,1),(12013,2,205,1),(12014,2,206,1),(12015,2,207,1),(12016,2,208,1),(12017,2,250,1),(12018,2,251,1),(12019,2,252,1),(12020,2,253,1),(12021,2,254,1),(12022,2,300,1),(12023,2,301,1),(12024,2,302,1),(12025,2,303,1),(12026,2,304,1),(12027,2,350,1),(12028,2,351,1),(12029,2,352,1),(12030,2,353,1),(12031,2,354,1),(12032,2,355,1),(12033,2,356,1),(12034,2,357,1),(12035,2,400,1),(12036,2,401,1),(12037,2,402,1),(12038,2,403,1),(12039,2,404,1),(12040,2,405,1),(12041,2,450,1),(12042,2,451,1),(12043,2,452,1),(12044,2,453,1),(12045,2,454,1),(12046,2,455,1),(12047,2,456,1),(12048,2,457,1),(12049,2,458,1),(12050,2,459,1),(12051,2,460,1),(12052,2,500,1),(12053,2,501,1),(12054,2,502,1),(12055,2,503,1),(12056,2,504,1),(12057,2,505,1),(12058,2,550,1),(12059,2,551,1),(12060,2,552,1),(12061,2,553,1),(12062,2,554,1),(12063,2,555,1),(12064,2,600,1),(12065,2,601,1),(12066,2,602,1),(12067,2,603,1),(12068,2,650,1),(12069,2,651,1),(12070,2,652,1),(12071,2,653,1),(12072,2,654,1),(12073,2,655,1),(12074,2,656,1),(12075,2,657,1),(12076,2,658,1),(12077,2,700,1),(12078,2,701,1),(12079,2,702,1),(12080,2,703,1),(12081,2,704,1),(12082,2,705,1),(12083,2,706,1),(12084,2,707,1),(12085,2,708,1),(12086,2,750,1),(12087,2,751,1),(12088,2,752,1),(12089,2,753,1),(12090,2,754,1),(12091,2,800,1),(12092,2,801,1),(12093,2,802,1),(12094,2,803,1),(12095,2,850,1),(12096,2,851,1),(12097,2,852,1),(12098,2,853,1),(12099,2,854,1),(12100,2,900,1),(12101,2,901,1),(12102,2,902,1),(12103,2,903,1),(12104,2,904,1),(12105,2,950,1),(12106,2,951,1),(12107,2,952,1),(12108,2,953,1),(12109,2,954,1),(12110,2,955,1),(12111,2,956,1),(12112,2,957,1),(12113,2,958,1),(12114,2,959,1),(12115,2,1000,1),(12116,2,1001,1),(12117,2,1002,1),(12118,2,1003,1),(12119,2,1004,1),(12120,2,1050,1),(12121,2,1051,1),(12122,2,1052,1),(12123,2,1053,1),(12124,2,1054,1),(12125,2,1055,1),(12126,2,1056,1),(12127,2,1057,1),(12128,2,1058,1),(12129,2,1059,1),(12130,2,1060,1),(12131,2,1075,1),(12132,2,1076,1),(12133,2,1077,1),(12134,2,1078,1),(12135,2,1079,1),(12136,2,1080,1),(12137,2,1081,1),(12138,2,1082,1),(12139,2,1083,1),(12140,2,1100,1),(12141,2,1101,1),(12142,2,1102,1),(12143,2,1103,1),(12144,2,1104,1),(12145,2,1150,1),(12146,2,1151,1),(12147,2,1152,1),(12148,2,1153,1),(12149,2,1154,1),(12150,2,1200,1),(12151,2,1201,1),(12152,2,1202,1),(12153,2,1203,1),(12154,2,1204,1),(12155,2,1230,1),(12156,2,1231,1),(12157,2,1232,1),(12158,2,1233,1),(12159,2,1234,1),(12160,2,1235,1),(12161,2,1250,1),(12162,2,1251,1),(12163,2,1252,1),(12164,2,1253,1),(12165,2,1300,1),(12166,2,1301,1),(12167,2,1302,1),(12168,2,1303,1),(12169,2,1304,1),(12170,2,1305,1),(12171,2,1350,1),(12172,2,1351,1),(12173,2,1352,1),(12174,2,1353,1),(12175,2,1354,1),(12176,2,1355,1),(12177,2,1400,1),(12178,2,1401,1),(12179,2,1402,1),(12180,2,1403,1),(12181,2,1404,1),(12182,2,1405,1),(12183,2,1406,1),(12184,2,1407,1),(12185,2,1408,1),(12186,2,1409,1),(12187,2,1410,1),(12188,2,1411,1),(12189,2,1412,1),(12190,2,1413,1),(12191,2,1414,1),(12192,2,1415,1),(12193,2,1450,1),(12194,2,1451,1),(12195,2,1452,1),(12196,2,1453,1),(12197,2,1454,1),(12198,2,1455,1),(12199,2,1456,1),(12200,2,1457,1),(12201,2,1500,1),(12202,2,1501,1),(12203,2,1502,1),(12204,2,1503,1),(12205,2,1504,1),(12206,2,1550,1),(12207,2,1551,1),(12208,2,1552,1),(12209,2,1553,1),(12210,2,1554,1),(12211,2,1600,1),(12212,2,1601,1),(12213,2,1602,1),(12214,2,1603,1),(12215,2,1604,1),(12216,2,1650,1),(12217,2,1651,1),(12218,2,1652,1),(12219,2,1675,1),(12220,2,1676,1),(12221,2,1677,1),(12222,2,1678,1),(12223,2,1725,1),(12224,2,1726,1),(12225,2,1727,1),(12226,2,1728,1),(12227,2,1729,1),(12228,2,1730,1),(12229,2,1731,1),(12230,2,1732,1),(12231,2,1750,1),(12232,2,1751,1),(12233,2,1752,1),(12234,2,1753,1),(12235,2,1754,1),(12236,2,1775,1),(12237,2,1776,1),(12238,2,1777,1),(12239,2,1778,1),(12240,2,1779,1),(12241,2,1780,1),(12242,2,1781,1),(12243,2,1800,1),(12244,2,1801,1),(12245,2,1802,1),(12246,2,1803,1),(12247,2,1804,1),(12248,2,1805,1),(12249,2,1806,1),(12250,2,1807,1),(12251,2,1808,1),(12252,2,1809,1),(12253,2,1810,1),(12254,2,1811,1),(12255,2,1812,1),(12256,2,1813,1),(12257,2,1814,1),(12258,2,1815,1),(12259,2,1816,1),(12260,2,1817,1),(12261,2,1818,1),(12262,2,1819,1),(12263,2,1820,1),(12264,2,1821,1),(12265,2,1822,1),(12266,2,1823,1),(12267,2,1824,1),(12268,2,1825,1),(12269,2,1826,1),(12270,2,1827,1),(12271,2,1828,1),(12272,2,1829,1),(12273,2,1830,1),(12274,2,1831,1),(12275,2,1832,1),(12276,2,1833,1),(12277,2,1834,1),(12278,2,1835,1),(12279,2,1836,1),(12280,2,1837,1),(12281,2,1838,1),(12282,2,1850,1),(12283,2,1851,1),(12284,2,1852,1),(12285,2,1853,1),(12286,2,1875,1),(12287,2,1876,1),(12288,2,1877,1),(12289,2,1900,1),(12290,2,1901,1),(12291,2,1902,1),(12292,2,1903,1),(12293,2,1904,1),(12294,2,1905,1),(12295,2,1925,1),(12296,2,1926,1),(12297,2,1927,1),(12298,2,1928,1),(12299,2,1929,1),(12300,2,1930,1),(12301,2,1931,1),(12302,2,1932,1),(12303,2,1933,1),(12304,2,1934,1),(12305,2,1950,1),(12306,2,1951,1),(12307,2,1952,1),(12308,2,1953,1),(12309,2,1954,1),(12310,2,1975,1),(12311,2,1976,1),(12312,2,1977,1),(12313,2,1978,1),(12314,2,1979,1),(12315,2,2000,1),(12316,2,2001,1),(12317,2,2015,1),(12318,2,2016,1),(12319,2,2017,1),(12320,2,2018,1),(12321,2,2019,1),(12322,2,2020,1),(12323,2,2021,1),(12324,2,2030,1),(12325,2,2031,1),(12326,2,2032,1),(12327,6,1,1),(12328,6,2,1),(12329,6,3,1),(12330,6,4,1),(12331,6,5,1),(12332,6,6,1),(12333,6,7,1),(12334,6,8,1),(12335,6,9,1),(12336,6,10,1),(12337,6,11,1),(12338,6,12,1),(12339,6,13,1),(12340,6,14,1),(12341,6,15,1),(12342,6,16,1),(12343,6,17,1),(12344,6,700,1),(12345,6,701,1),(12346,6,702,1),(12347,6,703,1),(12348,6,704,1),(12349,6,705,1),(12350,6,706,1),(12351,6,707,1),(12352,6,708,1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `prerequisite_id` int(10) unsigned NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `prerequisites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `prerequisite_id` (`prerequisite_id`),
  CONSTRAINT `prerequisite_id` FOREIGN KEY (`prerequisite_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prerequisites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,NULL,'/store/1/default_images/categories_icons/calendar.png',NULL),(2,1,NULL,1),(3,1,NULL,2);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_translations`
--

DROP TABLE IF EXISTS `product_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `product_category_translations_locale_index` (`locale`),
  CONSTRAINT `product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_translations`
--

LOCK TABLES `product_category_translations` WRITE;
/*!40000 ALTER TABLE `product_category_translations` DISABLE KEYS */;
INSERT INTO `product_category_translations` VALUES (1,1,'en','Events'),(2,2,'en','Workshops'),(3,3,'en','Classes');
/*!40000 ALTER TABLE `product_category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discounts`
--

DROP TABLE IF EXISTS `product_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(10) unsigned NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` int(10) unsigned NOT NULL,
  `end_date` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_discounts_creator_id_foreign` (`creator_id`),
  KEY `product_discounts_product_id_foreign` (`product_id`),
  CONSTRAINT `product_discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discounts`
--

LOCK TABLES `product_discounts` WRITE;
/*!40000 ALTER TABLE `product_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_faq_translations`
--

DROP TABLE IF EXISTS `product_faq_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_faq_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faq_id` (`product_faq_id`),
  KEY `product_faq_translations_locale_index` (`locale`),
  CONSTRAINT `product_faq_id` FOREIGN KEY (`product_faq_id`) REFERENCES `product_faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_faq_translations`
--

LOCK TABLES `product_faq_translations` WRITE;
/*!40000 ALTER TABLE `product_faq_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_faq_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_faqs`
--

DROP TABLE IF EXISTS `product_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faqs_product_id_foreign` (`product_id`),
  KEY `product_faqs_creator_id_foreign` (`creator_id`),
  CONSTRAINT `product_faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_faqs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_faqs`
--

LOCK TABLES `product_faqs` WRITE;
/*!40000 ALTER TABLE `product_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_file_translations`
--

DROP TABLE IF EXISTS `product_file_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_file_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_file_id` (`product_file_id`),
  KEY `product_file_translations_locale_index` (`locale`),
  CONSTRAINT `product_file_id` FOREIGN KEY (`product_file_id`) REFERENCES `product_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_file_translations`
--

LOCK TABLES `product_file_translations` WRITE;
/*!40000 ALTER TABLE `product_file_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_file_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_files`
--

DROP TABLE IF EXISTS `product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_product_id` (`product_id`),
  KEY `file_creator_id` (`creator_id`),
  CONSTRAINT `file_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_files`
--

LOCK TABLES `product_files` WRITE;
/*!40000 ALTER TABLE `product_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_option_translations`
--

DROP TABLE IF EXISTS `product_filter_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_filter_option_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_option_id` (`product_filter_option_id`),
  KEY `product_filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_option_id` FOREIGN KEY (`product_filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_option_translations`
--

LOCK TABLES `product_filter_option_translations` WRITE;
/*!40000 ALTER TABLE `product_filter_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_options`
--

DROP TABLE IF EXISTS `product_filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_options_filter_id_foreign` (`filter_id`),
  CONSTRAINT `product_filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_options`
--

LOCK TABLES `product_filter_options` WRITE;
/*!40000 ALTER TABLE `product_filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filter_translations`
--

DROP TABLE IF EXISTS `product_filter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_filter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_id` (`product_filter_id`),
  KEY `product_filter_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_id` FOREIGN KEY (`product_filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filter_translations`
--

LOCK TABLES `product_filter_translations` WRITE;
/*!40000 ALTER TABLE `product_filter_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_filters`
--

DROP TABLE IF EXISTS `product_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filters_category_id_foreign` (`category_id`),
  CONSTRAINT `product_filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_filters`
--

LOCK TABLES `product_filters` WRITE;
/*!40000 ALTER TABLE `product_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_media`
--

DROP TABLE IF EXISTS `product_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `type` enum('thumbnail','image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_product_id` (`product_id`),
  KEY `media_creator_id` (`creator_id`),
  CONSTRAINT `media_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_media`
--

LOCK TABLES `product_media` WRITE;
/*!40000 ALTER TABLE `product_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `seller_id` int(10) unsigned NOT NULL,
  `buyer_id` int(10) unsigned NOT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `discount_id` int(10) unsigned DEFAULT NULL,
  `message_to_seller` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','waiting_delivery','shipped','success','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (1,1,1020,1,NULL,'{\"Specification_Here\":\"Multi_Value_2\"}',1,NULL,NULL,NULL,'pending',1677512994);
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `product_quality` int(10) unsigned NOT NULL,
  `purchase_worth` int(10) unsigned NOT NULL,
  `delivery_quality` int(10) unsigned NOT NULL,
  `seller_quality` int(10) unsigned NOT NULL,
  `rates` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_creator_id_foreign` (`creator_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_filter_options`
--

DROP TABLE IF EXISTS `product_selected_filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_selected_filter_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_filter_options_product_id_foreign` (`product_id`),
  KEY `product_selected_filter_options_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `product_selected_filter_options_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_filter_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_filter_options`
--

LOCK TABLES `product_selected_filter_options` WRITE;
/*!40000 ALTER TABLE `product_selected_filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specification_multi_values`
--

DROP TABLE IF EXISTS `product_selected_specification_multi_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_selected_specification_multi_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `selected_specification_id` int(10) unsigned NOT NULL,
  `specification_multi_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_specification_id` (`selected_specification_id`),
  KEY `specification_multi_value_id` (`specification_multi_value_id`),
  CONSTRAINT `selected_specification_id` FOREIGN KEY (`selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `specification_multi_value_id` FOREIGN KEY (`specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specification_multi_values`
--

LOCK TABLES `product_selected_specification_multi_values` WRITE;
/*!40000 ALTER TABLE `product_selected_specification_multi_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specification_multi_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specification_translations`
--

DROP TABLE IF EXISTS `product_selected_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_selected_specification_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_selected_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specification_id_translations` (`product_selected_specification_id`),
  KEY `product_selected_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_selected_specification_id_translations` FOREIGN KEY (`product_selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specification_translations`
--

LOCK TABLES `product_selected_specification_translations` WRITE;
/*!40000 ALTER TABLE `product_selected_specification_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_selected_specifications`
--

DROP TABLE IF EXISTS `product_selected_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_selected_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_specification_id` int(10) unsigned NOT NULL,
  `type` enum('textarea','multi_value') COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_selection` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specifications_creator_id_foreign` (`creator_id`),
  KEY `product_selected_specifications_product_id_foreign` (`product_id`),
  KEY `product_selected_specifications_product_specification_id_foreign` (`product_specification_id`),
  CONSTRAINT `product_selected_specifications_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_specification_id_foreign` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_selected_specifications`
--

LOCK TABLES `product_selected_specifications` WRITE;
/*!40000 ALTER TABLE `product_selected_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_selected_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_categories`
--

DROP TABLE IF EXISTS `product_specification_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specification_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_categories_specification_id_foreign` (`specification_id`),
  KEY `product_specification_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_specification_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_specification_categories_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_categories`
--

LOCK TABLES `product_specification_categories` WRITE;
/*!40000 ALTER TABLE `product_specification_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_multi_value_translations`
--

DROP TABLE IF EXISTS `product_specification_multi_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specification_multi_value_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_multi_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_value_id` (`product_specification_multi_value_id`),
  KEY `product_specification_multi_value_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_multi_value_id` FOREIGN KEY (`product_specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_multi_value_translations`
--

LOCK TABLES `product_specification_multi_value_translations` WRITE;
/*!40000 ALTER TABLE `product_specification_multi_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_multi_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_multi_values`
--

DROP TABLE IF EXISTS `product_specification_multi_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specification_multi_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_values_specification_id_foreign` (`specification_id`),
  CONSTRAINT `product_specification_multi_values_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_multi_values`
--

LOCK TABLES `product_specification_multi_values` WRITE;
/*!40000 ALTER TABLE `product_specification_multi_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_multi_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specification_translations`
--

DROP TABLE IF EXISTS `product_specification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specification_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_id` (`product_specification_id`),
  KEY `product_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_id` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specification_translations`
--

LOCK TABLES `product_specification_translations` WRITE;
/*!40000 ALTER TABLE `product_specification_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specification_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_specifications`
--

DROP TABLE IF EXISTS `product_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `input_type` enum('textarea','multi_value') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_specifications`
--

LOCK TABLES `product_specifications` WRITE;
/*!40000 ALTER TABLE `product_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translations`
--

DROP TABLE IF EXISTS `product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_translations_locale_index` (`locale`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translations`
--

LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `type` enum('virtual','physical') COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `price` bigint(20) unsigned DEFAULT NULL,
  `point` bigint(20) unsigned DEFAULT NULL,
  `unlimited_inventory` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` tinyint(1) NOT NULL DEFAULT 0,
  `inventory` int(10) unsigned DEFAULT NULL,
  `inventory_warning` int(10) unsigned DEFAULT NULL,
  `inventory_updated_at` bigint(20) unsigned DEFAULT NULL,
  `delivery_fee` bigint(20) unsigned DEFAULT NULL,
  `delivery_estimated_time` int(10) unsigned DEFAULT NULL,
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `commission` int(10) unsigned DEFAULT NULL,
  `status` enum('active','pending','draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` bigint(20) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_creator_id_foreign` (`creator_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  KEY `products_slug_index` (`slug`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_translations`
--

DROP TABLE IF EXISTS `promotion_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_translations_promotion_id_foreign` (`promotion_id`),
  KEY `promotion_translations_locale_index` (`locale`),
  CONSTRAINT `promotion_translations_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_translations`
--

LOCK TABLES `promotion_translations` WRITE;
/*!40000 ALTER TABLE `promotion_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchases_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `purchases_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question_translations`
--

DROP TABLE IF EXISTS `quiz_question_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_question_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_question_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_translations_quiz_question_id_foreign` (`quizzes_question_id`),
  KEY `quiz_question_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_question_translations_quiz_question_id_foreign` FOREIGN KEY (`quizzes_question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question_translations`
--

LOCK TABLES `quiz_question_translations` WRITE;
/*!40000 ALTER TABLE `quiz_question_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_translations`
--

DROP TABLE IF EXISTS `quiz_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_translations_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_translations_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_translations`
--

LOCK TABLES `quiz_translations` WRITE;
/*!40000 ALTER TABLE `quiz_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `webinar_title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT 0,
  `attempt` int(11) DEFAULT NULL,
  `pass_mark` int(11) NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_mark` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `quizzes_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `quizzes_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `quizzes_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions`
--

DROP TABLE IF EXISTS `quizzes_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('multiple','descriptive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_questions_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions`
--

LOCK TABLES `quizzes_questions` WRITE;
/*!40000 ALTER TABLE `quizzes_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions_answer_translations`
--

DROP TABLE IF EXISTS `quizzes_questions_answer_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes_questions_answer_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_questions_answer_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_questions_answer_id` (`quizzes_questions_answer_id`),
  KEY `quizzes_questions_answer_translations_locale_index` (`locale`),
  CONSTRAINT `quizzes_questions_answer_id` FOREIGN KEY (`quizzes_questions_answer_id`) REFERENCES `quizzes_questions_answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions_answer_translations`
--

LOCK TABLES `quizzes_questions_answer_translations` WRITE;
/*!40000 ALTER TABLE `quizzes_questions_answer_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions_answer_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_questions_answers`
--

DROP TABLE IF EXISTS `quizzes_questions_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes_questions_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_answers_question_id_foreign` (`question_id`) USING BTREE,
  KEY `quizzes_questions_answers_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_answers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_questions_answers`
--

LOCK TABLES `quizzes_questions_answers` WRITE;
/*!40000 ALTER TABLE `quizzes_questions_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_questions_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_results`
--

DROP TABLE IF EXISTS `quizzes_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `results` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_grade` int(11) DEFAULT NULL,
  `status` enum('passed','failed','waiting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_results_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_results_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `quizzes_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_results`
--

LOCK TABLES `quizzes_results` WRITE;
/*!40000 ALTER TABLE `quizzes_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `quizzes_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `rate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rating_user_id_foreign` (`user_id`) USING BTREE,
  KEY `rating_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `rating_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `rating_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `province_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `geo_center` point DEFAULT NULL,
  `type` enum('country','province','city','district') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regions_country_id_foreign` (`country_id`),
  KEY `regions_province_id_foreign` (`province_id`),
  KEY `regions_city_id_foreign` (`city_id`),
  CONSTRAINT `regions_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_packages`
--

DROP TABLE IF EXISTS `registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('instructors','organizations') COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `product_count` int(10) unsigned DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_packages_role_index` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_packages`
--

LOCK TABLES `registration_packages` WRITE;
/*!40000 ALTER TABLE `registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_packages_translations`
--

DROP TABLE IF EXISTS `registration_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_packages_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_package_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_package` (`registration_package_id`),
  KEY `registration_packages_translations_locale_index` (`locale`),
  CONSTRAINT `registration_package` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_packages_translations`
--

LOCK TABLES `registration_packages_translations` WRITE;
/*!40000 ALTER TABLE `registration_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_meetings`
--

DROP TABLE IF EXISTS `reserve_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `sale_id` int(10) unsigned DEFAULT NULL,
  `meeting_time_id` int(10) unsigned NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `start_at` bigint(20) unsigned NOT NULL,
  `end_at` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `meeting_type` enum('in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `student_count` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','open','finished','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `locked_at` int(11) DEFAULT NULL,
  `reserved_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `reserve_meetings_meeting_time_id_foreign` (`meeting_time_id`) USING BTREE,
  KEY `reserve_meetings_user_id_foreign` (`user_id`) USING BTREE,
  KEY `reserve_meetings_sale_id_foreign` (`sale_id`),
  CONSTRAINT `reserve_meetings_meeting_time_id_foreign` FOREIGN KEY (`meeting_time_id`) REFERENCES `meeting_times` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_meetings`
--

LOCK TABLES `reserve_meetings` WRITE;
/*!40000 ALTER TABLE `reserve_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards`
--

LOCK TABLES `rewards` WRITE;
/*!40000 ALTER TABLE `rewards` DISABLE KEYS */;
INSERT INTO `rewards` VALUES (3,'charge_wallet',50,'150','active',1641205067),(4,'account_charge',50,'100','active',1641369989),(5,'badge',NULL,NULL,'active',1676283323),(6,'create_classes',50,NULL,'active',1641369921),(7,'buy',50,'10','active',1641369938),(8,'pass_the_quiz',50,NULL,'active',1641369947),(9,'certificate',30,NULL,'active',1641369955),(10,'comment',5,NULL,'active',1641369968),(11,'register',5,NULL,'active',1641370008),(12,'review_courses',15,NULL,'active',1641370016),(13,'instructor_meeting_reserve',30,NULL,'active',1641370026),(14,'student_meeting_reserve',30,NULL,'active',1641370036),(15,'newsletters',10,NULL,'active',1641370050),(16,'referral',5,NULL,'active',1641370059),(18,'learning_progress_100',20,NULL,'active',1641372957),(19,'buy_store_product',50,'26','active',1648277874),(20,'pass_assignment',50,NULL,'active',1649247227),(21,'make_topic',1,NULL,'active',1650548269),(22,'send_post_in_topic',1,NULL,'active',1650548278),(23,'create_blog_by_instructor',5,NULL,'active',1650788324),(24,'comment_for_instructor_blog',3,NULL,'active',1650788336);
/*!40000 ALTER TABLE `rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards_accounting`
--

DROP TABLE IF EXISTS `rewards_accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewards_accounting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','withdraw','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `status` enum('addiction','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rewards_accounting_user_id_foreign` (`user_id`),
  CONSTRAINT `rewards_accounting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards_accounting`
--

LOCK TABLES `rewards_accounting` WRITE;
/*!40000 ALTER TABLE `rewards_accounting` DISABLE KEYS */;
INSERT INTO `rewards_accounting` VALUES (1,1016,1,'create_classes',50,'addiction',1656669565),(2,1020,2,'create_classes',50,'addiction',1675866260),(3,1020,3,'create_classes',50,'addiction',1675925862);
/*!40000 ALTER TABLE `rewards_accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_count` int(10) unsigned NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','Student role',0,0,1604418504),(2,'admin','Admin role',0,1,1604418504),(3,'organization','Organization role',0,0,1604418504),(4,'teacher','Instructor role',0,0,1604418504),(6,'education','Author',0,1,1613370817),(7,'Basic','Basic User',0,0,1675930480);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `buyer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `meeting_id` int(10) unsigned DEFAULT NULL,
  `subscribe_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `promotion_id` int(10) unsigned DEFAULT NULL,
  `product_order_id` int(10) unsigned DEFAULT NULL,
  `registration_package_id` int(10) unsigned DEFAULT NULL,
  `type` enum('webinar','meeting','subscribe','promotion','registration_package','product','bundle') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('credit','payment_channel','subscribe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(10) unsigned NOT NULL,
  `tax` decimal(13,2) DEFAULT NULL,
  `commission` decimal(13,2) DEFAULT NULL,
  `discount` decimal(13,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) DEFAULT NULL,
  `manual_added` tinyint(1) NOT NULL DEFAULT 0,
  `access_to_purchased_item` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` int(10) unsigned NOT NULL,
  `refund_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sales_order_id_foreign` (`order_id`) USING BTREE,
  KEY `sales_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sales_meeting_id_foreign` (`meeting_id`) USING BTREE,
  KEY `sales_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `sales_buyer_id_foreign` (`buyer_id`) USING BTREE,
  KEY `sales_seller_id_foreign` (`seller_id`) USING BTREE,
  KEY `sales_promotion_id_foreign` (`promotion_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1020,1023,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'webinar','credit',0,NULL,NULL,NULL,0.00,NULL,0,1,1675920011,NULL),(2,1020,1023,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'webinar','credit',0,NULL,NULL,NULL,0.00,NULL,0,1,1675926304,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_log`
--

DROP TABLE IF EXISTS `sales_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) unsigned NOT NULL,
  `viewed_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_status_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sales_status_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_log`
--

LOCK TABLES `sales_log` WRITE;
/*!40000 ALTER TABLE `sales_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_group_id` int(10) unsigned DEFAULT NULL,
  `caption` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'admin_general_dashboard',NULL,'General Dashboard'),(2,'admin_general_dashboard_show',1,'General Dashboard page'),(3,'admin_general_dashboard_quick_access_links',1,'Quick access links in General Dashboard'),(4,'admin_general_dashboard_daily_sales_statistics',1,'Daily Sales Type Statistics Section'),(5,'admin_general_dashboard_income_statistics',1,'Income Statistics Section'),(6,'admin_general_dashboard_total_sales_statistics',1,'Total Sales Statistics Section'),(7,'admin_general_dashboard_new_sales',1,'New Sales Section'),(8,'admin_general_dashboard_new_comments',1,'New Comments Section'),(9,'admin_general_dashboard_new_tickets',1,'New Tickets Section'),(10,'admin_general_dashboard_new_reviews',1,'New Reviews Section'),(11,'admin_general_dashboard_sales_statistics_chart',1,'Sales Statistics Chart'),(12,'admin_general_dashboard_recent_comments',1,'Recent comments Section'),(13,'admin_general_dashboard_recent_tickets',1,'Recent tickets Section'),(14,'admin_general_dashboard_recent_webinars',1,'Recent webinars Section'),(15,'admin_general_dashboard_recent_courses',1,'Recent courses Section'),(16,'admin_general_dashboard_users_statistics_chart',1,'Users Statistics Chart'),(17,'admin_clear_cache',1,'Clear cache'),(25,'admin_marketing_dashboard',NULL,'Marketing Dashboard'),(26,'admin_marketing_dashboard_show',25,'Marketing Dashboard page'),(50,'admin_roles',NULL,'Roles'),(51,'admin_roles_list',50,'Roles List'),(52,'admin_roles_create',50,'Roles Create'),(53,'admin_roles_edit',50,'Roles Edit'),(54,'admin_roles_delete',50,'Roles Delete'),(100,'admin_users',NULL,'Users'),(101,'admin_staffs_list',100,'Staffs list'),(102,'admin_users_list',100,'Students list'),(103,'admin_instructors_list',100,'Instructors list'),(104,'admin_organizations_list',100,'Organizations list'),(105,'admin_users_create',100,'Users Create'),(106,'admin_users_edit',100,'Users Edit'),(107,'admin_users_delete',100,'Users Delete'),(108,'admin_users_export_excel',100,'List Export excel'),(109,'admin_users_badges',100,'Users Badges'),(110,'admin_users_badges_edit',100,'Badges edit'),(111,'admin_users_badges_delete',100,'Badges delete'),(112,'admin_users_impersonate',100,'users impersonate (login by users)'),(113,'admin_become_instructors_list',100,'Lists of requests for become instructors'),(114,'admin_become_instructors_reject',100,'Reject requests for become instructors'),(115,'admin_become_instructors_delete',100,'Delete requests for become instructors'),(116,'admin_update_user_registration_package',100,'Edit user registration package'),(117,'admin_update_user_meeting_settings',100,'Edit user meeting settings'),(150,'admin_webinars',NULL,'Webinars'),(151,'admin_webinars_list',150,'Webinars List'),(152,'admin_webinars_create',150,'Webinars Create'),(153,'admin_webinars_edit',150,'Webinars Edit'),(154,'admin_webinars_delete',150,'Webinars Delete'),(155,'admin_webinars_export_excel',150,'Export excel webinars list'),(156,'admin_feature_webinars',150,'Feature webinars list'),(157,'admin_feature_webinars_create',150,'create feature webinar'),(158,'admin_feature_webinars_export_excel',150,'Feature webinar export excel'),(159,'admin_webinar_students_lists',150,'Webinar students Lists'),(160,'admin_webinar_notification_to_students',150,'Send notification to course students'),(161,'admin_webinar_statistics',150,'Course statistics'),(162,'admin_agora_history_list',150,'Agora history lists'),(163,'admin_agora_history_export',150,'Agora history export'),(164,'admin_course_question_forum_list',150,'Forum Question Lists'),(165,'admin_course_question_forum_answers',150,'Forum Answers Lists'),(200,'admin_categories',NULL,'Categories'),(201,'admin_categories_list',200,'Categories List'),(202,'admin_categories_create',200,'Categories Create'),(203,'admin_categories_edit',200,'Categories Edit'),(204,'admin_categories_delete',200,'Categories Delete'),(205,'admin_trending_categories',200,'Trends Categories List'),(206,'admin_create_trending_categories',200,'Create Trend Categories'),(207,'admin_edit_trending_categories',200,'Edit Trend Categories'),(208,'admin_delete_trending_categories',200,'Delete Trend Categories'),(250,'admin_tags',NULL,'Tags'),(251,'admin_tags_list',250,'Tags List'),(252,'admin_tags_create',250,'Tags Create'),(253,'admin_tags_edit',250,'Tags Edit'),(254,'admin_tags_delete',250,'Tags Delete'),(300,'admin_filters',NULL,'Filters'),(301,'admin_filters_list',300,'Filters List'),(302,'admin_filters_create',300,'Filters Create'),(303,'admin_filters_edit',300,'Filters Edit'),(304,'admin_filters_delete',300,'Filters Delete'),(350,'admin_quizzes',NULL,'Quizzes'),(351,'admin_quizzes_list',350,'Quizzes List'),(352,'admin_quizzes_create',350,'Create Quiz'),(353,'admin_quizzes_edit',350,'Edit Quiz'),(354,'admin_quizzes_delete',350,'Delete Quiz'),(355,'admin_quizzes_results',350,'Quizzes results'),(356,'admin_quizzes_results_delete',350,'Quizzes results delete'),(357,'admin_quizzes_lists_excel',350,'Quizzes export excel'),(400,'admin_quiz_result',NULL,'Quiz Result'),(401,'admin_quiz_result_list',400,'Quiz Result List'),(402,'admin_quiz_result_create',400,'Quiz Result Create'),(403,'admin_quiz_result_edit',400,'Quiz Result Edit'),(404,'admin_quiz_result_delete',400,'Quiz Result Delete'),(405,'admin_quiz_result_export_excel',400,'quiz result export excel'),(450,'admin_certificate',NULL,'Certificate'),(451,'admin_certificate_list',450,'Certificate List'),(452,'admin_certificate_create',450,'Certificate Create'),(453,'admin_certificate_edit',450,'Certificate Edit'),(454,'admin_certificate_delete',450,'Certificate Delete'),(455,'admin_certificate_template_list',450,'Certificate template lists'),(456,'admin_certificate_template_create',450,'Certificate template create'),(457,'admin_certificate_template_edit',450,'Certificate template edit'),(458,'admin_certificate_template_delete',450,'Certificate template delete'),(459,'admin_certificate_export_excel',450,'Certificates export excel'),(460,'admin_course_certificate_list',450,'Course Competition Certificates'),(500,'admin_discount_codes',NULL,'Discount codes'),(501,'admin_discount_codes_list',500,'Discount codes list'),(502,'admin_discount_codes_create',500,'Discount codes create'),(503,'admin_discount_codes_edit',500,'Discount codes edit'),(504,'admin_discount_codes_delete',500,'Discount codes delete'),(505,'admin_discount_codes_export',500,'Discount codes export excel'),(550,'admin_group',NULL,'Groups'),(551,'admin_group_list',550,'Groups List'),(552,'admin_group_create',550,'Groups Create'),(553,'admin_group_edit',550,'Groups Edit'),(554,'admin_group_delete',550,'Groups Delete'),(555,'admin_update_group_registration_package',550,'Update group registration package'),(600,'admin_payment_channel',NULL,'Payment Channels'),(601,'admin_payment_channel_list',600,'Payment Channels List'),(602,'admin_payment_channel_toggle_status',600,'active or inactive channel'),(603,'admin_payment_channel_edit',600,'Payment Channels Edit'),(650,'admin_settings',NULL,'settings'),(651,'admin_settings_general',650,'General settings'),(652,'admin_settings_financial',650,'Financial settings'),(653,'admin_settings_personalization',650,'Personalization settings'),(654,'admin_settings_notifications',650,'Notifications settings'),(655,'admin_settings_seo',650,'Seo settings'),(656,'admin_settings_customization',650,'Customization settings'),(657,'admin_settings_notifications',650,'Notifications settings'),(658,'admin_settings_home_sections',650,'Home sections settings'),(700,'admin_blog',NULL,'Blog'),(701,'admin_blog_lists',700,'Blog lists'),(702,'admin_blog_create',700,'Blog create'),(703,'admin_blog_edit',700,'Blog edit'),(704,'admin_blog_delete',700,'Blog delete'),(705,'admin_blog_categories',700,'Blog categories list'),(706,'admin_blog_categories_create',700,'Blog categories create'),(707,'admin_blog_categories_edit',700,'Blog categories edit'),(708,'admin_blog_categories_delete',700,'Blog categories delete'),(750,'admin_sales',NULL,'Sales'),(751,'admin_sales_list',750,'Sales List'),(752,'admin_sales_refund',750,'Sales Refund'),(753,'admin_sales_invoice',750,'Sales invoice'),(754,'admin_sales_export',750,'Sales Export Excel'),(800,'admin_documents',NULL,'Balances'),(801,'admin_documents_list',800,'Balances List'),(802,'admin_documents_create',800,'Balances Create'),(803,'admin_documents_print',800,'Balances print'),(850,'admin_payouts',NULL,'Payout'),(851,'admin_payouts_list',850,'Payout List'),(852,'admin_payouts_reject',850,'Payout Reject'),(853,'admin_payouts_payout',850,'Payout accept'),(854,'admin_payouts_export_excel',850,'Payout export excel'),(900,'admin_offline_payments',NULL,'Offline Payments'),(901,'admin_offline_payments_list',900,'Offline Payments List'),(902,'admin_offline_payments_reject',900,'Offline Payments Reject'),(903,'admin_offline_payments_approved',900,'Offline Payments Approved'),(904,'admin_offline_payments_export_excel',900,'Offline Payments export excel'),(950,'admin_supports',NULL,'Supports'),(951,'admin_supports_list',950,'Supports List'),(952,'admin_support_send',950,'Send Support'),(953,'admin_supports_reply',950,'Supports reply'),(954,'admin_supports_delete',950,'Supports delete'),(955,'admin_support_departments',950,'Support departments lists'),(956,'admin_support_department_create',950,'Create support department'),(957,'admin_support_departments_edit',950,'Edit support departments'),(958,'admin_support_departments_delete',950,'Delete support department'),(959,'admin_support_course_conversations',950,'Course conversations'),(1000,'admin_subscribe',NULL,'Subscribes'),(1001,'admin_subscribe_list',1000,'Subscribes list'),(1002,'admin_subscribe_create',1000,'Subscribes create'),(1003,'admin_subscribe_edit',1000,'Subscribes edit'),(1004,'admin_subscribe_delete',1000,'Subscribes delete'),(1050,'admin_notifications',NULL,'Notifications'),(1051,'admin_notifications_list',1050,'Notifications list'),(1052,'admin_notifications_send',1050,'Send Notifications'),(1053,'admin_notifications_edit',1050,'Edit and details Notifications'),(1054,'admin_notifications_delete',1050,'Delete Notifications'),(1055,'admin_notifications_markAllRead',1050,'Mark All Read Notifications'),(1056,'admin_notifications_templates',1050,'Notifications templates'),(1057,'admin_notifications_template_create',1050,'Create notification template'),(1058,'admin_notifications_template_edit',1050,'Edit notification template'),(1059,'admin_notifications_template_delete',1050,'Delete notification template'),(1060,'admin_notifications_posted_list',1050,'Notifications Posted list'),(1075,'admin_noticeboards',NULL,'Noticeboards'),(1076,'admin_noticeboards_list',1075,'Noticeboards list'),(1077,'admin_noticeboards_send',1075,'Send Noticeboards'),(1078,'admin_noticeboards_edit',1075,'Edit Noticeboards'),(1079,'admin_noticeboards_delete',1075,'Delete Noticeboards'),(1080,'admin_course_noticeboards_list',1075,'Course Noticeboards list'),(1081,'admin_course_noticeboards_send',1075,'Send Course Noticeboards'),(1082,'admin_course_noticeboards_edit',1075,'Edit Course Noticeboards'),(1083,'admin_course_noticeboards_delete',1075,'Delete Course Noticeboards'),(1100,'admin_promotion',NULL,'Promotions'),(1101,'admin_promotion_list',1100,'Promotions list'),(1102,'admin_promotion_create',1100,'Promotion create'),(1103,'admin_promotion_edit',1100,'Promotion edit'),(1104,'admin_promotion_delete',1100,'Promotion delete'),(1150,'admin_testimonials',NULL,'testimonials'),(1151,'admin_testimonials_list',1150,'testimonials list'),(1152,'admin_testimonials_create',1150,'testimonials create'),(1153,'admin_testimonials_edit',1150,'testimonials edit'),(1154,'admin_testimonials_delete',1150,'testimonials delete'),(1200,'admin_advertising',NULL,'advertising'),(1201,'admin_advertising_banners',1200,'advertising banners list'),(1202,'admin_advertising_banners_create',1200,'create advertising banner'),(1203,'admin_advertising_banners_edit',1200,'edit advertising banner'),(1204,'admin_advertising_banners_delete',1200,'delete advertising banner'),(1230,'admin_newsletters',NULL,'Newsletters'),(1231,'admin_newsletters_lists',1230,'Newsletters lists'),(1232,'admin_newsletters_send',1230,'Send Newsletters'),(1233,'admin_newsletters_history',1230,'Newsletters histories'),(1234,'admin_newsletters_delete',1230,'Delete newsletters item'),(1235,'admin_newsletters_export_excel',1230,'Export excel newsletters item'),(1250,'admin_contacts',NULL,'Contacts'),(1251,'admin_contacts_lists',1250,'Contacts lists'),(1252,'admin_contacts_reply',1250,'Contacts reply'),(1253,'admin_contacts_delete',1250,'Contacts delete'),(1300,'admin_product_discount',NULL,'product discount'),(1301,'admin_product_discount_list',1300,'product discount list'),(1302,'admin_product_discount_create',1300,'create product discount'),(1303,'admin_product_discount_edit',1300,'edit product discount'),(1304,'admin_product_discount_delete',1300,'delete product discount'),(1305,'admin_product_discount_export',1300,'delete product export excel'),(1350,'admin_pages',NULL,'pages'),(1351,'admin_pages_list',1350,'pages list'),(1352,'admin_pages_create',1350,'pages create'),(1353,'admin_pages_edit',1350,'pages edit'),(1354,'admin_pages_toggle',1350,'pages toggle publish/draft'),(1355,'admin_pages_delete',1350,'pages delete'),(1400,'admin_comments',NULL,'Comments'),(1401,'admin_webinar_comments',1400,'Classes comments'),(1402,'admin_webinar_comments_edit',1400,'Classes comments edit'),(1403,'admin_webinar_comments_reply',1400,'Classes comments reply'),(1404,'admin_webinar_comments_delete',1400,'Classes comments delete'),(1405,'admin_webinar_comments_status',1400,'Classes comments status (active or pending)'),(1406,'admin_blog_comments',1400,'Blog comments'),(1407,'admin_blog_comments_edit',1400,'Blog comments edit'),(1408,'admin_blog_comments_reply',1400,'Blog comments reply'),(1409,'admin_blog_comments_delete',1400,'Blog comments delete'),(1410,'admin_blog_comments_status',1400,'Blog comments status (active or pending)'),(1411,'admin_product_comments',1400,'Product comments'),(1412,'admin_product_comments_edit',1400,'Product comments edit'),(1413,'admin_product_comments_reply',1400,'Product comments reply'),(1414,'admin_product_comments_delete',1400,'Product comments delete'),(1415,'admin_product_comments_status',1400,'Product comments status (active or pending)'),(1450,'admin_reports',NULL,'Reports'),(1451,'admin_webinar_reports',1450,'Classes reports'),(1452,'admin_webinar_comments_reports',1450,'Classes Comments reports'),(1453,'admin_webinar_reports_delete',1450,'Classes reports delete'),(1454,'admin_blog_comments_reports',1450,'Blog Comments reports'),(1455,'admin_report_reasons',1450,'Reports reasons'),(1456,'admin_product_comments_reports',1450,'Products Comments reports'),(1457,'admin_forum_topic_post_reports',1450,'Forum Topic Posts Reports'),(1500,'admin_additional_pages',NULL,'Additional Pages'),(1501,'admin_additional_pages_404',1500,'404 error page settings'),(1502,'admin_additional_pages_contact_us',1500,'Contact page settings'),(1503,'admin_additional_pages_footer',1500,'Footer settings'),(1504,'admin_additional_pages_navbar_links',1500,'Top Navbar links settings'),(1550,'admin_appointments',NULL,'Appointments'),(1551,'admin_appointments_lists',1550,'Appointments lists'),(1552,'admin_appointments_join',1550,'Appointments join'),(1553,'admin_appointments_send_reminder',1550,'Appointments send reminder'),(1554,'admin_appointments_cancel',1550,'Appointments cancel'),(1600,'admin_reviews',NULL,'Reviews'),(1601,'admin_reviews_lists',1600,'Reviews lists'),(1602,'admin_reviews_status_toggle',1600,'Reviews status toggle (publish or hidden)'),(1603,'admin_reviews_detail_show',1600,'Review details page'),(1604,'admin_reviews_delete',1600,'Review delete'),(1650,'admin_consultants',NULL,'Consultants'),(1651,'admin_consultants_lists',1650,'Consultants lists'),(1652,'admin_consultants_export_excel',1650,'Consultants export excel'),(1675,'admin_referrals',NULL,'Referrals'),(1676,'admin_referrals_history',1675,'Referrals History'),(1677,'admin_referrals_users',1675,'Referrals users'),(1678,'admin_referrals_export',1675,'Export Referrals'),(1725,'admin_regions',NULL,'Regions'),(1726,'admin_regions_countries',1725,'countries lists'),(1727,'admin_regions_provinces',1725,'provinces lists'),(1728,'admin_regions_cities',1725,'cities lists'),(1729,'admin_regions_districts',1725,'districts lists'),(1730,'admin_regions_create',1725,'create item'),(1731,'admin_regions_edit',1725,'edit item'),(1732,'admin_regions_delete',1725,'delete item'),(1750,'admin_rewards',NULL,'Rewards'),(1751,'admin_rewards_history',1750,'Rewards history'),(1752,'admin_rewards_settings',1750,'Rewards settings'),(1753,'admin_rewards_items',1750,'Rewards items'),(1754,'admin_rewards_item_delete',1750,'Reward item delete'),(1775,'admin_registration_packages',NULL,'Registration packages'),(1776,'admin_registration_packages_lists',1775,'packages lists'),(1777,'admin_registration_packages_new',1775,'New package'),(1778,'admin_registration_packages_edit',1775,'Edit package'),(1779,'admin_registration_packages_delete',1775,'Delete package'),(1780,'admin_registration_packages_reports',1775,'Reports'),(1781,'admin_registration_packages_settings',1775,'Settings'),(1800,'admin_store',NULL,'Store'),(1801,'admin_store_products',1800,'Products lists'),(1802,'admin_store_new_product',1800,'Create New Product'),(1803,'admin_store_edit_product',1800,'Edit Product'),(1804,'admin_store_delete_product',1800,'Delete Product'),(1805,'admin_store_export_products',1800,'Export excel Products'),(1806,'admin_store_categories_list',1800,'Store Categories Lists'),(1807,'admin_store_categories_create',1800,'Create Store Category'),(1808,'admin_store_categories_edit',1800,'Edit Store Category'),(1809,'admin_store_categories_delete',1800,'Delete Store Category'),(1810,'admin_store_filters_list',1800,'Store Filters Lists'),(1811,'admin_store_filters_create',1800,'Create Store Filter'),(1812,'admin_store_filters_edit',1800,'Edit Store Filter'),(1813,'admin_store_filters_delete',1800,'Delete Store Filter'),(1814,'admin_store_specifications',1800,'Store Specifications'),(1815,'admin_store_specifications_create',1800,'Create New Store Specification'),(1816,'admin_store_specifications_edit',1800,'Edit Store Specification'),(1817,'admin_store_specifications_delete',1800,'Delete Store Specification'),(1818,'admin_store_discounts',1800,'Store Discounts Lists'),(1819,'admin_store_discounts_create',1800,'Create New Store discount'),(1820,'admin_store_discounts_edit',1800,'Edit Store discount'),(1821,'admin_store_discounts_delete',1800,'Delete Store discount'),(1822,'admin_store_products_orders',1800,'Products Orders'),(1823,'admin_store_products_orders_refund',1800,'Products Orders Refund'),(1824,'admin_store_products_orders_invoice',1800,'Products Orders View Invoice'),(1825,'admin_store_products_orders_export',1800,'Products Orders Export Excel'),(1826,'admin_store_products_orders_tracking_code',1800,'Products Orders Tracking code'),(1827,'admin_store_products_reviews',1800,'Reviews lists'),(1828,'admin_store_products_reviews_status_toggle',1800,'Reviews status toggle (publish or hidden)'),(1829,'admin_store_products_reviews_detail_show',1800,'Review details page'),(1830,'admin_store_products_reviews_delete',1800,'Review delete'),(1831,'admin_store_settings',1800,'Store settings'),(1832,'admin_store_in_house_products',1800,'In-house products'),(1833,'admin_store_in_house_orders',1800,'In-house Products Orders'),(1834,'admin_store_products_sellers',1800,'Products Sellers'),(1835,'admin_store_in_house_products_delete',1800,'In-house Products Delete'),(1836,'admin_store_in_house_products_export',1800,'In-house Products Export Excel'),(1837,'admin_store_in_house_orders',1800,'In-house Products Orders'),(1838,'admin_store_products_sellers',1800,'Products Sellers'),(1850,'admin_webinar_assignments',NULL,'Webinar assignments'),(1851,'admin_webinar_assignments_lists',1850,'Assignments lists'),(1852,'admin_webinar_assignments_students',1850,'Assignment students'),(1853,'admin_webinar_assignments_conversations',1850,'Assignment students conversations'),(1875,'admin_users_not_access_content',NULL,'Users do not have access to the content'),(1876,'admin_users_not_access_content_lists',1875,'Users lists'),(1877,'admin_users_not_access_content_toggle',1875,'Toggle active/inactive users to view content'),(1900,'admin_bundles',NULL,'Bundles'),(1901,'admin_bundles_list',1900,'Bundles Lists'),(1902,'admin_bundles_create',1900,'Create new Bundle'),(1903,'admin_bundles_edit',1900,'Edit bundle'),(1904,'admin_bundles_delete',1900,'Delete bundle'),(1905,'admin_bundles_export_excel',1900,'Export excel'),(1925,'admin_forum',NULL,'Forums'),(1926,'admin_forum_list',1925,'Forums Lists'),(1927,'admin_forum_create',1925,'Forums create'),(1928,'admin_forum_edit',1925,'Forums edit'),(1929,'admin_forum_delete',1925,'Forums delete'),(1930,'admin_forum_topics_lists',1925,'Forums topics lists'),(1931,'admin_forum_topics_create',1925,'Forums topics create'),(1932,'admin_forum_topics_delete',1925,'Forums topics delete'),(1933,'admin_forum_topics_posts',1925,'Forums topic posts'),(1934,'admin_forum_topics_create_posts',1925,'Forums topic store posts'),(1950,'admin_featured_topics',NULL,'Featured topics'),(1951,'admin_featured_topics_list',1950,'Featured topics Lists'),(1952,'admin_featured_topics_create',1950,'Featured topics create'),(1953,'admin_featured_topics_edit',1950,'Featured topics edit'),(1954,'admin_featured_topics_delete',1950,'Featured topics delete'),(1975,'admin_recommended_topics',NULL,'Recommended topics'),(1976,'admin_recommended_topics_list',1975,'Recommended topics Lists'),(1977,'admin_recommended_topics_create',1975,'Recommended topics create'),(1978,'admin_recommended_topics_edit',1975,'Recommended topics edit'),(1979,'admin_recommended_topics_delete',1975,'Recommended topics delete'),(2000,'admin_advertising_modal',NULL,'Advertising modal'),(2001,'admin_advertising_modal_config',2000,'Set Advertising modal'),(2015,'admin_enrollment',NULL,'Enrollment'),(2016,'admin_enrollment_history',2015,'Enrollment History'),(2017,'admin_enrollment_add_student_to_items',2015,'Enrollment Add Student To Items'),(2018,'admin_enrollment_block_access',2015,'Enrollment Block Access'),(2019,'admin_enrollment_enable_access',2015,'Enrollment Enable Access'),(2020,'admin_enrollment_export',2015,'Enrollment Export History'),(2021,'admin_enrollment_export',2015,'Enrollment Export History'),(2030,'admin_delete_account_requests',NULL,'Delete Account Requests'),(2031,'admin_delete_account_requests_lists',2030,'Delete Account Requests Lists'),(2032,'admin_delete_account_requests_confirm',2030,'Delete Account Requests Confirm');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_reminds`
--

DROP TABLE IF EXISTS `session_reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_reminds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_reminds_session_id_foreign` (`session_id`),
  KEY `session_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `session_reminds_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `session_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_reminds`
--

LOCK TABLES `session_reminds` WRITE;
/*!40000 ALTER TABLE `session_reminds` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_translations`
--

DROP TABLE IF EXISTS `session_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_translations_session_id_foreign` (`session_id`),
  KEY `session_translations_locale_index` (`locale`),
  CONSTRAINT `session_translations_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_translations`
--

LOCK TABLES `session_translations` WRITE;
/*!40000 ALTER TABLE `session_translations` DISABLE KEYS */;
INSERT INTO `session_translations` VALUES (2,2,'en','Zoom Title Here','Zoom Description Here');
/*!40000 ALTER TABLE `session_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `date` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_time_to_join` int(10) unsigned DEFAULT NULL COMMENT 'Specifies that the user can see the join button up to a few minutes after the start time of the webinar.',
  `zoom_start_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zoom_id` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `session_api` enum('local','big_blue_button','zoom','agora') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moderator_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agora_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessions_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sessions_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `sessions_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `sessions_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (2,1020,3,5,1675927800,60,'https://us04web.zoom.us/j/74115648876?pwd=k6ntYeDRo33CDtbbGvfCd5mBK4EroE.1',20,'https://us04web.zoom.us/s/74115648876?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6Ilc0SHZ1NEV6U1B1WGpMcTdpTWp2WHciLCJpc3MiOiJ3ZWIiLCJzayI6IjAiLCJzdHkiOjEwMCwid2NkIjoidXMwNCIsImNsdCI6MCwibW51bSI6Ijc0MTE1NjQ4ODc2IiwiZXhwIjoxNjc1OTMyOTg3LCJpYXQiOjE2NzU5MjU3ODcsImFpZCI6Ilpxd0thOU50UXV5RWE4eGRqTGhsSGciLCJjaWQiOiIifQ.AGeeXu-00kD2q12M1ch3NVEroXyyr8CFpBSo8_-ufb4',NULL,'zoom',NULL,NULL,NULL,0,NULL,NULL,'active',1675925786,1675931719,NULL);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_translations`
--

DROP TABLE IF EXISTS `setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_translations_setting_id_foreign` (`setting_id`),
  KEY `setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_translations`
--

LOCK TABLES `setting_translations` WRITE;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` VALUES (1,1,'en','{\"home\":{\"title\":\"Home\",\"description\":\"home page Description\",\"robot\":\"index\"},\"search\":{\"title\":\"Search\",\"description\":\"search page Description\",\"robot\":\"index\"},\"categories\":{\"title\":\"Category\",\"description\":\"categories page Description\",\"robot\":\"index\"},\"login\":{\"title\":\"Login\",\"description\":\"login page description\",\"robot\":\"index\"},\"register\":{\"title\":\"Register\",\"description\":\"register page Description\",\"robot\":\"index\"},\"about\":{\"title\":\"about page title\",\"description\":\"about page Description\"},\"contact\":{\"title\":\"Contact\",\"description\":\"contact page Description\",\"robot\":\"index\"},\"certificate_validation\":{\"title\":\"Certificate validation\",\"description\":\"Certificate validation description\",\"robot\":\"index\"},\"classes\":{\"title\":\"Courses\",\"description\":\"Courses page Description\",\"robot\":\"index\"},\"blog\":{\"title\":\"Blog\",\"description\":\"Blog page description\",\"robot\":\"index\"},\"instructors\":{\"title\":\"Instructors\",\"description\":\"instructors page Description\",\"robot\":\"index\"},\"organizations\":{\"title\":\"Organizations\",\"description\":\"Organizations page description\",\"robot\":\"index\"},\"instructor_finder_wizard\":{\"title\":\"Instructor finder wizard\",\"description\":\"Instructor finder wizard description\",\"robot\":\"noindex\"},\"instructor_finder\":{\"title\":\"Instructor finder\",\"description\":\"Instructor finder description\",\"robot\":\"index\"},\"reward_courses\":{\"title\":\"Reward courses\",\"description\":\"Reward courses description\",\"robot\":\"index\"},\"products_lists\":{\"title\":\"Store Products\",\"description\":\"Store Products Description\",\"robot\":\"noindex\"},\"reward_products\":{\"title\":\"Reward Products\",\"description\":\"Reward Products Description\",\"robot\":\"noindex\"},\"forum\":{\"title\":\"Forums\",\"description\":\"Forums Description\",\"robot\":\"noindex\"}}'),(2,2,'en','{\"Instagram\":{\"title\":\"Instagram\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/instagram.svg\",\"link\":\"https:\\/\\/www.instagram.com\\/skyezee_movingwarriors_\\/?fbclid=IwAR135EdU_qCVmfdFijKiNjBXyb3708fYsMpudatJn3SrKZs8FRk0CA1aItc\",\"order\":\"1\"},\"Whatsapp\":{\"title\":\"Whatsapp\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/whatsapp.svg\",\"link\":\"https:\\/\\/wa.me\\/+27742841378\",\"order\":\"2\"},\"Facebook\":{\"title\":\"Facebook\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/facebook.svg\",\"link\":\"https:\\/\\/www.facebook.com\\/mixedmovementcoaching\",\"order\":\"4\"}}'),(3,4,'fa','{\"first_column\":{\"title\":\"\\u0633\\u062a\\u0648\\u0646 \\u0627\\u0648\\u0644\",\"value\":\"<p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f1<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f2<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f3<\\/p>\"},\"second_column\":{\"title\":\"\\u0633\\u062a\\u0648\\u0646 \\u062f\\u0648\\u0645\",\"value\":\"<p>\\u0644\\u06cc\\u0646\\u06a9 1<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 2<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 3<\\/p>\"},\"third_column\":{\"title\":\"\\u0633\\u062a\\u0648\\u0646 \\u0633\\u0648\\u0645\",\"value\":\"<p>\\u0644\\u06cc\\u0646\\u06a9 1<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f2<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f3<\\/p>\"},\"forth_column\":{\"title\":\"\\u0633\\u062a\\u0648\\u0646 \\u0686\\u0647\\u0627\\u0631\",\"value\":\"<p>\\u0644\\u06cc\\u0646\\u06a9 1<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f2<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f3<\\/p><p>\\u0644\\u06cc\\u0646\\u06a9 \\u06f4<\\/p>\"}}'),(4,5,'en','{\"register_method\":\"email\",\"default_time_zone\":\"Africa\\/Johannesburg\",\"date_format\":\"textual\",\"time_format\":\"24_hours\",\"fav_icon\":\"\\/store\\/1\\/default_images\\/Logo\\/MOVING WARRIORS Favicon.png\",\"logo\":\"\\/store\\/1\\/default_images\\/Logo\\/MOVING WARRIORS BECOME A WARRIOR OF YOUR MIND-01.jpg\",\"footer_logo\":\"\\/store\\/1\\/default_images\\/Logo\\/Logo Footer.png\",\"hero_section1\":\"1\",\"content_translate\":false}'),(5,6,'en','{\"commission\":\"20\",\"tax\":\"10\",\"minimum_payout\":\"50\",\"currency\":\"ZAR\",\"currency_position\":\"left\",\"price_display\":\"only_price\"}'),(6,8,'en','{\"title\":\"Become a Warrior of your Mind.\",\"description\":\"A warrior embraces uncertainty and faces the unknown with strength and wisdom, embracing discomfort and being present in every moment.\",\"hero_background\":\"\\/store\\/1\\/327552734_865394208047175_838457104771053500_n.jpg\"}'),(7,12,'en','{\"css\":null,\"js\":null}'),(8,14,'en','{\"admin_login\":\"\\/store\\/1\\/default_images\\/admin_login_new.jpg\",\"admin_dashboard\":\"\\/store\\/1\\/default_images\\/admin_dashboard_new.jpeg\",\"login\":\"\\/store\\/1\\/default_images\\/front_login_new.jpg\",\"register\":\"\\/store\\/1\\/default_images\\/front_register_new.jpeg\",\"remember_pass\":\"\\/store\\/1\\/default_images\\/password_recovery_new.jpeg\",\"verification\":\"\\/store\\/1\\/default_images\\/verification.jpg\",\"search\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"categories\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"become_instructor\":\"\\/store\\/1\\/default_images\\/become_instructor.jpg\",\"certificate_validation\":\"\\/store\\/1\\/default_images\\/certificate_validation.jpg\",\"blog\":\"\\/store\\/1\\/default_images\\/blogs_cover_new.jpg\",\"instructors\":\"\\/store\\/1\\/default_images\\/instructors_cover.png\",\"organizations\":\"\\/store\\/1\\/default_images\\/organizations_cover.png\",\"dashboard\":\"\\/store\\/1\\/dashboard.png\",\"user_avatar\":\"\\/store\\/1\\/default_images\\/default_profile.jpg\",\"user_cover\":\"\\/store\\/1\\/default_images\\/default_cover.jpg\",\"instructor_finder_wizard\":\"\\/store\\/1\\/default_images\\/instructor_finder_wizard.jpg\",\"products_lists\":\"\\/store\\/1\\/default_images\\/category_cover.png\"}'),(9,15,'en','{\"title\":\"Become a Warrior of your Mind.\",\"description\":\"A true warrior understands to not avoid uncertainty and the unknown. A true warrior understands that we cannot control nor know what will happen in the future. A true warrior knows though, that wherever they go, THEY will BE. A true warrior has the wisdom of the strength and softness to be in discomfort, to sit with what is, to fight what could be.\",\"hero_background\":\"\\/store\\/1\\/277672432_272325965097195_8613072582246396567_n.jpg\",\"hero_vector\":\"\\/store\\/1\\/326199268_545732764192387_7144003390775845229_n.jpg\",\"has_lottie\":\"1\"}'),(10,20,'en','[\"Inappropriate Course Content\",\"Inappropriate Behavior\",\"Policy Violation\",\"Spammy Content\",\"Other\"]'),(11,22,'en','{\"new_comment_admin\":\"7\",\"support_message_admin\":\"10\",\"support_message_replied_admin\":\"11\",\"promotion_plan_admin\":\"29\",\"new_contact_message\":\"26\",\"new_badge\":\"2\",\"change_user_group\":\"3\",\"course_created\":\"4\",\"course_approve\":\"5\",\"course_reject\":\"6\",\"new_comment\":\"7\",\"support_message\":\"8\",\"support_message_replied\":\"9\",\"new_rating\":\"17\",\"webinar_reminder\":\"27\",\"new_financial_document\":\"12\",\"payout_request\":\"13\",\"payout_proceed\":\"14\",\"offline_payment_request\":\"18\",\"offline_payment_approved\":\"19\",\"offline_payment_rejected\":\"20\",\"new_sales\":\"15\",\"new_purchase\":\"16\",\"new_subscribe_plan\":\"21\",\"promotion_plan\":\"28\",\"new_appointment\":\"22\",\"new_appointment_link\":\"23\",\"appointment_reminder\":\"24\",\"meeting_finished\":\"25\",\"new_certificate\":\"30\",\"waiting_quiz\":\"31\",\"waiting_quiz_result\":\"32\",\"payout_request_admin\":\"13\",\"product_new_sale\":\"33\",\"product_new_purchase\":\"34\",\"product_new_comment\":\"35\",\"product_tracking_code\":\"36\",\"product_new_rating\":\"37\",\"product_receive_shipment\":\"38\",\"product_out_of_stock\":\"39\",\"student_send_message\":\"40\",\"instructor_send_message\":\"41\",\"instructor_set_grade\":\"42\",\"send_post_in_topic\":\"44\",\"publish_instructor_blog_post\":\"45\",\"new_comment_for_instructor_blog_post\":\"46\",\"meeting_reserve_reminder\":\"47\",\"subscribe_reminder\":\"48\"}'),(12,23,'en','{\"540\":{\"title\":\"Qatar National Bank\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/Qatar National Bank.png\",\"card_id\":\"2578-4910-3682-6288\",\"account_id\":\"38152294372\",\"iban\":\"QA66QUWW934528129454345775226\"},\"334\":{\"title\":\"State Bank of India\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/State Bank of India.png\",\"card_id\":\"6282-4518-1237-7641\",\"account_id\":\"56238341127\",\"iban\":\"IN37ABNA2422193788\"},\"jhgDW\":{\"title\":\"JPMorgan\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/jpmorgan.png\",\"card_id\":\"5012-4518-1772-8911\",\"account_id\":\"46237751125\",\"iban\":\"NL37ABNA2423554788\"}}'),(13,24,'en','{\"background\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"latitude\":\"43.45905\",\"longitude\":\"11.87300\",\"map_zoom\":\"16\",\"phones\":\"415-716-1166 , 415-716-1167\",\"emails\":\"mail@lms.rocket-soft.org , info@lms.rocket-soft.org\",\"address\":\"4193 Roosevelt Street\\r\\nSan Francisco, CA 94103\"}'),(14,25,'en','{\"latest_classes\":\"1\",\"best_sellers\":\"1\",\"free_classes\":\"1\",\"discount_classes\":\"1\",\"best_rates\":\"1\",\"trend_categories\":\"1\",\"testimonials\":\"1\",\"subscribes\":\"1\",\"blog\":\"1\",\"organizations\":\"1\",\"instructors\":\"1\",\"video_or_image_section\":\"1\",\"find_instructors\":\"1\",\"reward_program\":\"1\"}'),(15,26,'en','{\"02nh9a\":{\"title\":\"Home\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Courses\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructors\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"Store\",\"link\":\"\\/products\",\"order\":\"5\"},\"Wnq5Qb\":{\"title\":\"Forums\",\"link\":\"\\/forums\",\"order\":\"7\"},\"Xyz4mk\":{\"title\":\"Blog\",\"link\":\"https:\\/\\/themovingwarriors.com\\/blog\",\"order\":\"6\"},\"Cng9JU\":{\"title\":\"Events\",\"link\":\"https:\\/\\/themovingwarriors.com\\/pages\\/events\",\"order\":\"4\"}}'),(16,27,'en','{\"link\":\"\\/classes\",\"title\":\"Start learning anywhere, anytime...\",\"description\":\"Unlock your potential with The Moving Warriors and join our innovative online Budokon platform! You will have the flexibility to learn at your own pace and on your own schedule.\",\"background\":\"\\/store\\/1\\/271586056_228265792828272_7247400041910494328_n.jpg\"}'),(17,28,'en','{\"error_image\":\"\\/store\\/1\\/default_images\\/404.svg\",\"error_title\":\"title for error 404\",\"error_description\":\"404 Error description\"}'),(18,29,'en','[]'),(19,30,'en','{\"affiliate_user_commission\":\"5\",\"affiliate_user_amount\":\"20\",\"referred_user_amount\":\"10\",\"referral_description\":\"You can share your affiliate URL you will get the above rewards when a user uses the platform.\"}'),(20,4,'en','{\"first_column\":{\"title\":\"About\",\"value\":\"<p><font color=\\\"#ffffff\\\" style=\\\"\\\">This community is aimed to support and grow a vision for alternative ways of living and being in this world which are supportive to a more soulful existence, to foster closer relationships and community, and support a joyful and sustainable future.<\\/font><\\/p><p><br><\\/p>\"},\"second_column\":{\"title\":\"Quick Links\",\"value\":\"<p><a href=\\\"\\/login\\\"><font color=\\\"#ffffff\\\">- Login<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/register\\\"><font color=\\\"#ffffff\\\">- Register<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/blog\\\"><font color=\\\"#ffffff\\\">- Blog<\\/font><\\/a><\\/p><p><a href=\\\"\\/contact\\\"><font color=\\\"#ffffff\\\">- Contact us<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/certificate_validation\\\"><font color=\\\"#ffffff\\\">- Certificate validation<\\/font><\\/a><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/become-instructor\\\"><font color=\\\"#ffffff\\\">- Become instructor<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/pages\\/terms\\\"><font color=\\\"#ffffff\\\">- Terms &amp; rules<\\/font><\\/a><\\/p><p><a href=\\\"\\/pages\\/about\\\"><font color=\\\"#ffffff\\\">- About us<\\/font><\\/a><br><\\/p>\"},\"third_column\":{\"title\":\"Shop - * Coming Soon *\",\"value\":\"<p><font color=\\\"#ffffff\\\">ACTIVEWEAR<\\/font><\\/p><p><font color=\\\"#ffffff\\\"><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\">-&nbsp;Tops<\\/font><\\/p><p><font color=\\\"#ffffff\\\">-&nbsp;Vests<\\/font><\\/p><p><font color=\\\"#ffffff\\\">- Gym Bras<\\/font><\\/p><p><font color=\\\"#ffffff\\\">- T-shirts<\\/font><\\/p><p><font color=\\\"#ffffff\\\">- Tights<\\/font><\\/p><p><font color=\\\"#ffffff\\\">- Leggings<\\/font><\\/p><p><font color=\\\"#ffffff\\\"><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\">EQUIPMENT<\\/font><\\/p><p><font color=\\\"#ffffff\\\"><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\">- Jump Ropes<\\/font><\\/p><p><font color=\\\"#ffffff\\\">- Steel Maces<\\/font><br><\\/p>\"},\"forth_column\":{\"title\":\"Contact me\",\"value\":\"<p><font color=\\\"#ffffff\\\">Sandton, Gauteng, South Africa<\\/font><\\/p><p><font color=\\\"#ffffff\\\"><br><\\/font><\\/p><p><a href=\\\"mailto: skye@themovingwarriors.com\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">Email: skye@themovingwarriors.com<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\">Cell: +27 74 284 1378<\\/font><\\/p>\"}}'),(21,4,'de','{\"first_column\":{\"title\":\"german first\",\"value\":\"<p>german link 1<\\/p><p>german link 2<\\/p><p>german link 3<\\/p>\"}}'),(24,26,'fa','{\"About_Us\":{\"title\":\"\\u062f\\u0631\\u0628\\u0627\\u0631\\u0647 \\u0645\\u0627\",\"link\":\"\\/pages\\/about\",\"order\":\"4\"},\"Blog\":{\"title\":\"\\u0648\\u0628\\u0644\\u0627\\u06af\",\"link\":\"\\/blog\",\"order\":\"3\"},\"Contact\":{\"title\":\"\\u062a\\u0645\\u0627\\u0633 \\u0628\\u0627 \\u0645\\u0627\",\"link\":\"\\/contact\",\"order\":\"2\"},\"KfoH9Y\":{\"title\":\"\\u062e\\u0627\\u0646\\u0647\",\"link\":\"\\/\",\"order\":\"1\"}}'),(25,29,'fa','{\"link\":\"\\/pages\\/about\",\"background\":\"\\/store\\/1\\/WallpaperGram.IR_1553794510_24488.jpg\"}'),(26,8,'fa','{\"title\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0635\\u0644\\u06cc\",\"description\":\"\\u0622\\u0645\\u0648\\u0632\\u0634 \\u0622\\u0646\\u0644\\u0627\\u06cc\\u0646 \\u06cc\\u06a9\\u06cc \\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0627\\u0646\\u062a\\u062e\\u0627\\u0628 \\u0647\\u0627 \\u0628\\u0631\\u0627\\u06cc \\u0631\\u0634\\u062f \\u0627\\u0633\\u062a\\r\\n\\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0645\\u0639\\u0644\\u0645\\u0627\\u0646 \\u0633\\u0631\\u0627\\u0633\\u0631 \\u062c\\u0647\\u0627\\u0646 \\u0628\\u06cc\\u0627\\u0645\\u0648\\u0632\\u06cc\\u062f\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/slider.png\"}'),(27,15,'fa','{\"title\":\"\\u0627\\u0632 \\u0622\\u0645\\u0648\\u0632\\u0634 \\u0622\\u0646\\u0644\\u0627\\u06cc\\u0646 \\u0647\\u0645\\u06cc\\u0634\\u0647 \\u0644\\u0630\\u062a \\u0628\\u0628\\u0631\\u06cc\\u062f ...\",\"description\":\"\\u0622\\u0645\\u0648\\u0632\\u0634 \\u0622\\u0646\\u0644\\u0627\\u06cc\\u0646 \\u06cc\\u06a9\\u06cc \\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0627\\u0646\\u062a\\u062e\\u0627\\u0628 \\u0647\\u0627 \\u0628\\u0631\\u0627\\u06cc \\u0631\\u0634\\u062f \\u0627\\u0633\\u062a\\r\\n\\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0645\\u0639\\u0644\\u0645\\u0627\\u0646 \\u0633\\u0631\\u0627\\u0633\\u0631 \\u062c\\u0647\\u0627\\u0646 \\u0628\\u06cc\\u0627\\u0645\\u0648\\u0632\\u06cc\\u062f\\r\\n\\u0622\\u0645\\u0648\\u0632\\u0634 \\u0622\\u0646\\u0644\\u0627\\u06cc\\u0646 \\u06cc\\u06a9\\u06cc \\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0627\\u0646\\u062a\\u062e\\u0627\\u0628 \\u0647\\u0627 \\u0628\\u0631\\u0627\\u06cc \\u0631\\u0634\\u062f \\u0627\\u0633\\u062a\\r\\n\\u0627\\u0632 \\u0628\\u0647\\u062a\\u0631\\u06cc\\u0646 \\u0645\\u0639\\u0644\\u0645\\u0627\\u0646 \\u0633\\u0631\\u0627\\u0633\\u0631 \\u062c\\u0647\\u0627\\u0646 \\u0628\\u06cc\\u0627\\u0645\\u0648\\u0632\\u06cc\\u062f\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/assets\\/default\\/img\\/home\\/business-team.json\",\"has_lottie\":\"1\"}'),(28,27,'fa','{\"link\":\"\\/home\",\"title\":\"\\u0634\\u0631\\u0648\\u0639 \\u06a9\\u0644\\u0627\\u0633\\u0647\\u0627\\u06cc \\u0632\\u0646\\u062f\\u0647 \\u062e\\u0635\\u0648\\u0635\\u06cc \\u0648 \\u0639\\u0645\\u0648\\u0645\\u06cc\",\"description\":\"\\u0628\\u0647 \\u0631\\u0627\\u062d\\u062a\\u06cc \\u0645\\u06cc \\u062a\\u0648\\u0627\\u0646\\u06cc\\u062f \\u06a9\\u0644\\u0627\\u0633 \\u0647\\u0627\\u06cc \\u0632\\u0646\\u062f\\u0647 \\u0631\\u0627\\u06cc\\u06af\\u0627\\u0646 \\u0648 \\u067e\\u0648\\u0644\\u06cc \\u0627\\u06cc\\u062c\\u0627\\u062f \\u06a9\\u0646\\u06cc\\u062f\",\"background\":\"\\/assets\\/default\\/img\\/home\\/video-bg.png\"}'),(29,20,'fa','[\"\\u062f\\u0644\\u06cc\\u0644 \\u06f1\",\"\\u062f\\u0644\\u06cc\\u0644 \\u06f2\",\"\\u062f\\u0644\\u06cc\\u0644 \\u06f3\"]'),(31,4,'ar','{\"first_column\":{\"title\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS \\u0647\\u0648 \\u0646\\u0638\\u0627\\u0645 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u062a\\u0639\\u0644\\u0645 \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f\\u0643 \\u0639\\u0644\\u0649 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0623\\u0639\\u0645\\u0627\\u0644\\u0643 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0641\\u064a \\u0639\\u062f\\u0629 \\u0633\\u0627\\u0639\\u0627\\u062a. \\u062a\\u0633\\u0627\\u0639\\u062f \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629 \\u0648\\u062a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0645\\u0646 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"\\u0631\\u0648\\u0627\\u0628\\u0637 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0642\\u0627\\u0644\\u0627\\u062a<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u0635\\u062d\\u0629 \\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- \\u0623\\u0635\\u0628\\u062d \\u0645\\u062f\\u0631\\u0628\\u0627<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0645\\u0645\\u0627\\u062b\\u0644\\u0629\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u064a\\u0648\\u062f\\u0645\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u06a9\\u06cc\\u0644 \\u0634\\u06cc\\u0631<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0643\\u0631\\u0633 \\u0627\\u064a\\u0631\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0644\\u06cc\\u0646\\u062f\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u0643\\u064a\\u0644 \\u0633\\u0641\\u062a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0648\\u062f\\u0627\\u0633\\u064a\\u062a\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">\\u0627\\u062f\\u0643\\u0633<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0645\\u0633\\u062a\\u0631 \\u0643\\u0644\\u0633<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"\\u0642\\u0645 \\u0628\\u0634\\u0631\\u0627\\u0621 Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),(32,31,'en','{\"agora_max_bitrate\":\"2260\",\"agora_min_bitrate\":\"1130\",\"agora_frame_rate\":\"15\",\"agora_live_streaming\":\"1\",\"agora_chat\":\"1\",\"agora_in_free_courses\":\"1\",\"timezone_in_register\":\"1\",\"timezone_in_create_webinar\":\"1\",\"forums_status\":\"1\",\"direct_classes_payment_button_status\":\"1\",\"cookie_settings_status\":\"1\",\"extra_time_to_join_status\":\"1\",\"extra_time_to_join_default_value\":\"20\",\"show_other_register_method\":\"1\",\"show_certificate_additional_in_register\":\"1\"}'),(33,32,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Find the best instructor\",\"description\":\"Looking for an instructor? Find the best instructors according to different parameters like gender, skill level, price, meeting type, rating, etc.\\r\\nFind instructors on the map.\",\"button1\":{\"title\":\"Tutor Finder\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutors on Map\",\"link\":\"\\/instructor-finder\"}}'),(34,33,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Win Club Points\",\"description\":\"Use Rocket LMS and win club points according to different activities.\\r\\nYou will be able to use your club points to get free prizes and courses. Start using the system now and collect points!\",\"button1\":{\"title\":\"Rewards\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"Points Club\",\"link\":\"\\/panel\\/rewards\"}}'),(35,34,'en','{\"status\":\"0\",\"exchangeable\":\"0\",\"exchangeable_unit\":null,\"want_more_points_link\":\"\\/pages\\/reward_points_system\"}'),(38,37,'en','[]'),(39,38,'en','{\"courses_capacity\":\"20\",\"courses_count\":\"5\",\"meeting_count\":\"20\",\"product_count\":\"5\"}'),(40,39,'en','{\"instructors_count\":\"3\",\"students_count\":\"30\",\"courses_capacity\":\"30\",\"courses_count\":\"10\",\"meeting_count\":\"40\",\"product_count\":\"10\"}'),(41,40,'en','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Become an instructor\",\"description\":\"Are you interested to be a part of our community?\\r\\nYou can be a part of our community by signing up as an instructor or organization.\",\"button1\":{\"title\":\"Become an Instructor\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Registration Packages\",\"link\":\"become-instructor\\/packages\\/\"}}'),(42,8,'ar','{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),(43,8,'es','{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),(44,15,'ar','{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),(45,15,'es','{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),(46,27,'ar','{\"link\":\"\\/classes\",\"title\":\"\\u0627\\u0628\\u062f\\u0623 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0641\\u064a \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a ...\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0644\\u0644\\u0648\\u0635\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0639\\u0627\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u062f\\u0648\\u0646 \\u0623\\u064a \\u0642\\u064a\\u0648\\u062f \\u0648\\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),(47,27,'es','{\"link\":\"\\/classes\",\"title\":\"Empiece a aprender en cualquier lugar, en cualquier momento ...\",\"description\":\"Utilice Rocket LMS para acceder a materiales educativos de alta calidad sin limitaciones de la forma m\\u00e1s sencilla.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),(48,29,'ar','{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-ar.png\"}'),(49,29,'es','{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-sp.png\"}'),(50,4,'es','{\"first_column\":{\"title\":\"Sobre Nosotras\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS es un sistema de gesti\\u00f3n de aprendizaje con todas las funciones que le ayuda a gestionar su negocio educativo en varias horas. Esta plataforma ayuda a los instructores a crear materiales educativos profesionales y ayuda a los estudiantes a aprender de los mejores instructores.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"Enlaces Adicionales\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- Acceso<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- Registrarse<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- Blog<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- Contacta con nosotras<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- Validaci\\u00f3n de certificado<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- Convi\\u00e9rtete en instructor<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- T\\u00e9rminos y reglas<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- Sobre nosotras<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"Negocios Similares\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"Compra Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),(51,26,'es','{\"02nh9a\":{\"title\":\"hogar\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Cursos\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructoras\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"VBxDrB\":{\"title\":\"Blog\",\"link\":\"\\/blog\",\"order\":\"4\"},\"Uo5b2v\":{\"title\":\"Tienda\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"Foros\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),(52,26,'ar','{\"02nh9a\":{\"title\":\"\\u0627\\u0644\\u0635\\u0641\\u062d\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"\\u0627\\u0644\\u062f\\u0648\\u0631\\u0627\\u062a\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"\\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"\\u0645\\u062a\\u062c\\u0631\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"\\u0627\\u0644\\u0645\\u0646\\u062a\\u062f\\u064a\\u0627\\u062a\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),(53,32,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"\\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u062f\\u0631\\u0628\",\"description\":\"\\u062a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u061f \\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u0645\\u062b\\u0644 \\u0627\\u0644\\u062c\\u0646\\u0633 \\u0648\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0647\\u0627\\u0631\\u0629 \\u0648\\u0627\\u0644\\u0633\\u0639\\u0631 \\u0648\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639 \\u0648\\u0627\\u0644\\u062a\\u0642\\u064a\\u064a\\u0645 \\u0648\\u0645\\u0627 \\u0625\\u0644\\u0649 \\u0630\\u0644\\u0643.\\r\\n\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629.\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0628\\u0627\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"\\u0645\\u062f\\u0631\\u0633\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629\",\"link\":\"\\/instructor-finder\"}}'),(54,32,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Encuentra la mejor instructora\",\"description\":\"\\u00bfBuscas un instructor? Encuentre los mejores instructores seg\\u00fan diferentes par\\u00e1metros como g\\u00e9nero, nivel de habilidad, precio, tipo de reuni\\u00f3n, calificaci\\u00f3n, etc.\\r\\nEncuentra instructores en el mapa.\",\"button1\":{\"title\":\"Buscadora de tutores\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutores en el mapa\",\"link\":\"\\/instructor-finder\"}}'),(55,33,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0648\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0623\\u0646\\u0634\\u0637\\u0629 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629.\\r\\n\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062c\\u0648\\u0627\\u0626\\u0632 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0645\\u062c\\u0627\\u0646\\u064a\\u0629. \\u0627\\u0628\\u062f\\u0623 \\u0641\\u064a \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0627\\u062c\\u0645\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637!\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0622\\u062a\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\",\"link\":\"\\/panel\\/rewards\"}}'),(56,33,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Gana puntos del club\",\"description\":\"Utilice Rocket LMS y gane puntos del club seg\\u00fan diferentes actividades.\\r\\nPodr\\u00e1s utilizar tus puntos del club para conseguir premios y cursos gratuitos. \\u00a1Comience a usar el sistema ahora y acumule puntos!\",\"button1\":{\"title\":\"Recompensas\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"club de puntos\",\"link\":\"\\/panel\\/rewards\"}}'),(57,40,'ar','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064b\\u0627\",\"description\":\"\\u0647\\u0644 \\u0623\\u0646\\u062a \\u0645\\u0647\\u062a\\u0645 \\u0628\\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627\\u061f\\r\\n\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0643\\u0645\\u062f\\u0631\\u0628 \\u0623\\u0648 \\u0645\\u0646\\u0638\\u0645\\u0629.\",\"button1\":{\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0633\\u064b\\u0627\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"\\u062d\\u0632\\u0645 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644\",\"link\":\"become-instructor\\/packages\\/\"}}'),(58,40,'es','{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Convi\\u00e9rtete en instructora\",\"description\":\"\\u00bfEst\\u00e1s interesado en ser parte de nuestra comunidad?\\r\\nPuedes ser parte de nuestra comunidad registr\\u00e1ndote como instructor u organizaci\\u00f3n.\",\"button1\":{\"title\":\"Convi\\u00e9rtete en instructora\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Paquetes de registro\",\"link\":\"become-instructor\\/packages\\/\"}}'),(59,42,'en','{\"primary\":\"#66cef6\",\"primary-border\":\"#66cef6\",\"primary-hover\":\"#5f3393\",\"primary-border-hover\":\"#5f3393\",\"secondary\":\"#5f3393\",\"secondary-border\":\"#66cef6\",\"secondary-hover\":\"#66cef6\",\"secondary-border-hover\":\"#66cef6\",\"secondary-btn-shadow\":\"#66cef6\",\"secondary-btn-shadow-hover\":\"#66cef6\",\"secondary-btn-color\":\"#66cef6\",\"secondary-btn-color-hover\":\"#66cef6\",\"admin_primary\":\"#5f3393\"}'),(60,44,'en','{\"cookie_settings_modal_message\":\"<p>When you visit any of our websites, it may store or retrieve information on your browser, mostly in the form of cookies. This information might be about you, your preferences or your device and is mostly used to make the site work as you expect it to. The information does not usually directly identify you, but it can give you a more personalized web experience. Because we respect your right to privacy, you can choose not to allow some types of cookies. Click on the different category headings to find out more and manage your preferences. Please note, that blocking some types of cookies may impact your experience of the site and the services we are able to offer.<\\/p>\",\"cookie_settings_modal_items\":{\"dDRjfkGvQfFzQJpa\":{\"title\":\"Strictly Necessary\",\"description\":\"These cookies are necessary for our website to function properly and cannot be switched off in our systems. They are usually only set in response to actions made by you that amount to a request for services, such as setting your privacy preferences, logging in or filling in forms, or where they\\u2019re essential to providing you with a service you have requested. You cannot opt out of these cookies. You can set your browser to block or alert you about these cookies, but if you do, some parts of the site will not then work. These cookies do not store any personally identifiable information.\",\"required\":\"1\"},\"mOzJowgvTnWFlRzz\":{\"title\":\"Performance Cookies\",\"description\":\"These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site. They help us to know which pages are the most and least popular and see how visitors move around the site, which helps us optimize your experience. All information these cookies collect is aggregated and therefore anonymous. If you do not allow these cookies we will not be able to use your data in this way.\",\"required\":\"0\"},\"XBMtdYaeSrqMicTH\":{\"title\":\"Functional Cookies\",\"description\":\"These cookies enable the website to provide enhanced functionality and personalization. They may be set by us or by third-party providers whose services we have added to our pages. If you do not allow these cookies then some or all of these services may not function properly.\",\"required\":\"0\"},\"XlLqzsvNpRqdcNWP\":{\"title\":\"Targeting Cookies\",\"description\":\"These cookies may be set through our site by our advertising partners. They may be used by those companies to build a profile of your interests and show you relevant adverts on other sites. They do not store directly personal information but are based on uniquely identifying your browser and internet device. If you do not allow these cookies, you will experience less targeted advertising.\",\"required\":\"0\"}}}'),(61,41,'en','{\"status\":\"1\",\"virtual_product_commission\":null,\"physical_product_commission\":null,\"store_tax\":null,\"possibility_create_virtual_product\":\"0\",\"possibility_create_physical_product\":\"0\",\"shipping_tracking_url\":\"https:\\/\\/www.tracking.my\\/\",\"activate_comments\":\"0\"}'),(62,46,'en','{\"main\":{\"regular\":\"\\/store\\/1\\/fonts\\/montserrat-regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/montserrat-bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\"},\"rtl\":{\"regular\":\"\\/store\\/1\\/fonts\\/Vazir-Regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/Vazir-Bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\"}}'),(63,43,'en','{\"image\":\"\\/store\\/1\\/default_images\\/forums\\/forum_section.jpg\",\"title\":\"Have a Question? Ask it in forum and get answer\",\"description\":\"Our forums helps you to create your questions on different subjects and communicate with other forum users. Our users will help you to get the best answer!\",\"button1\":{\"title\":\"Create a new topic\",\"link\":\"\\/forums\\/create-topic\"},\"button2\":{\"title\":\"Browse forums\",\"link\":\"\\/forums\"}}'),(64,45,'en','{\"mobile_app_hero_image\":\"\\/store\\/1\\/default_images\\/app_only.png\",\"mobile_app_description\":\"<div>Is an amazing, modern, and clean landing page for showcasing your app or anything else.<\\/div><div><br><\\/div><div>A mobile application or app is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch. Mobile applications often stand in contrast to desktop applications which are designed to run on desktop computers, and web applications which run in mobile web browsers rather than directly on the mobile device.<\\/div>\",\"mobile_app_buttons\":{\"htQgcSjzjLJlGRyY\":{\"title\":\"Download from Play Store\",\"link\":\"https:\\/\\/play.google.com\\/store\\/games\",\"icon\":\"\\/store\\/1\\/default_images\\/google-play.png\",\"color\":\"primary\"}}}'),(65,48,'en','{\"image\":\"\\/store\\/1\\/default_images\\/ads_modal.png\",\"title\":\"Sales Campaign\",\"description\":\"We have a sales campaign on our promoted courses and products. You can purchase 150 products at a discounted price up to 50% discount.\",\"button1\":{\"title\":\"View Courses\",\"link\":\"\\/classes\"},\"button2\":{\"title\":\"View Products\",\"link\":\"\\/products\"}}'),(66,52,'en','{\"guarantee_text\":\"5 Days money back guarantee\"}'),(67,47,'en','{\"webinar_reminder_schedule\":\"1\",\"meeting_reminder_schedule\":\"1\",\"subscribe_reminder_schedule\":\"48\"}');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` enum('general','financial','personalization','notifications','seo','customization','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'seo','seo_metas',1656149218),(2,'general','socials',1676279771),(4,'other','footer',1632071275),(5,'general','general',1676623422),(6,'financial','financial',1675837956),(8,'personalization','home_hero',1675760648),(12,'customization','custom_css_js',1636119881),(14,'personalization','page_background',1677660803),(15,'personalization','home_hero2',1675760464),(20,'other','report_reasons',1656323233),(22,'notifications','notifications',1656570715),(23,'financial','site_bank_accounts',1645555160),(24,'other','contact_us',1645564086),(25,'personalization','home_sections',1641234869),(26,'other','navbar_links',1677517786),(27,'personalization','home_video_or_image_box',1676280656),(28,'other','404',1645563969),(29,'personalization','panel_sidebar',1675948816),(30,'financial','referral',1656670139),(31,'general','features',1675846634),(32,'personalization','find_instructors',1645610065),(33,'personalization','reward_program',1655132304),(34,'general','rewards_settings',1656670074),(37,'financial','registration_packages_general',1656670055),(38,'financial','registration_packages_instructors',1656670059),(39,'financial','registration_packages_organizations',1656670063),(40,'personalization','become_instructor_section',1645609839),(41,'general','store_settings',1677513267),(42,'personalization','theme_colors',1675853242),(43,'personalization','forums_section',1655973550),(44,'personalization','cookie_settings',1655700817),(45,'personalization','mobile_app',1656395706),(46,'personalization','theme_fonts',1655657642),(47,'general','reminders',1675869894),(48,'other','advertising_modal',1675959675),(52,'personalization','others_personalization',1675869911);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_offers`
--

DROP TABLE IF EXISTS `special_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(10) unsigned NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `from_date` int(10) unsigned NOT NULL,
  `to_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `special_offers_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `special_offers_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `special_offers_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `special_offers_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_offers`
--

LOCK TABLES `special_offers` WRITE;
/*!40000 ALTER TABLE `special_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_reminds`
--

DROP TABLE IF EXISTS `subscribe_reminds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe_reminds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subscribe_id` int(10) unsigned NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_reminds_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `subscribe_reminds_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_reminds`
--

LOCK TABLES `subscribe_reminds` WRITE;
/*!40000 ALTER TABLE `subscribe_reminds` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_reminds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_translations`
--

DROP TABLE IF EXISTS `subscribe_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscribe_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_translations_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_translations_locale_index` (`locale`),
  CONSTRAINT `subscribe_translations_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_translations`
--

LOCK TABLES `subscribe_translations` WRITE;
/*!40000 ALTER TABLE `subscribe_translations` DISABLE KEYS */;
INSERT INTO `subscribe_translations` VALUES (1,1,'en','Bronze','Suggested for new comers'),(2,2,'en','Silver','Suggested for Intermediate'),(3,3,'en','Gold','Suggested for Lifestyle Changers');
/*!40000 ALTER TABLE `subscribe_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe_uses`
--

DROP TABLE IF EXISTS `subscribe_uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe_uses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subscribe_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `sale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subscribe_uses_user_id_foreign` (`user_id`) USING BTREE,
  KEY `subscribe_uses_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `subscribe_uses_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `subscribe_uses_sale_id_foreign` (`sale_id`) USING BTREE,
  KEY `subscribe_uses_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `subscribe_uses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe_uses`
--

LOCK TABLES `subscribe_uses` WRITE;
/*!40000 ALTER TABLE `subscribe_uses` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribes`
--

DROP TABLE IF EXISTS `subscribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usable_count` int(10) unsigned NOT NULL,
  `days` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `infinite_use` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribes`
--

LOCK TABLES `subscribes` WRITE;
/*!40000 ALTER TABLE `subscribes` DISABLE KEYS */;
INSERT INTO `subscribes` VALUES (1,5,30,500,'/store/1/bronze.png',0,0,1676280184),(2,10,30,800,'/store/1/silver.png',0,0,1676280099),(3,30,30,1100,'/store/1/gold.png',1,1,1676280267);
/*!40000 ALTER TABLE `subscribes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_conversations`
--

DROP TABLE IF EXISTS `support_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_conversations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `support_id` int(10) unsigned NOT NULL,
  `supporter_id` int(10) unsigned DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `support_conversations_support_id_foreign` (`support_id`) USING BTREE,
  KEY `support_conversations_sender_id_foreign` (`sender_id`) USING BTREE,
  KEY `support_conversations_supporter_id_foreign` (`supporter_id`) USING BTREE,
  CONSTRAINT `support_conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_conversations_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_conversations`
--

LOCK TABLES `support_conversations` WRITE;
/*!40000 ALTER TABLE `support_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_department_translations`
--

DROP TABLE IF EXISTS `support_department_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_department_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_department_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_department_id` (`support_department_id`),
  KEY `support_department_translations_locale_index` (`locale`),
  CONSTRAINT `support_department_id` FOREIGN KEY (`support_department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_department_translations`
--

LOCK TABLES `support_department_translations` WRITE;
/*!40000 ALTER TABLE `support_department_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_department_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_departments`
--

DROP TABLE IF EXISTS `support_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_departments`
--

LOCK TABLES `support_departments` WRITE;
/*!40000 ALTER TABLE `support_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','close','replied','supporter_replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supports_user_id_foreign` (`user_id`) USING BTREE,
  KEY `supports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `supports_department_id_foreign` (`department_id`) USING BTREE,
  CONSTRAINT `supports_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tags_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tags_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `tags_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (23,'Beginners',3,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial_translations`
--

DROP TABLE IF EXISTS `testimonial_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonial_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonial_translations_testimonial_id_foreign` (`testimonial_id`),
  KEY `testimonial_translations_locale_index` (`locale`),
  CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial_translations`
--

LOCK TABLES `testimonial_translations` WRITE;
/*!40000 ALTER TABLE `testimonial_translations` DISABLE KEYS */;
INSERT INTO `testimonial_translations` VALUES (1,1,'en','Megan Hayward','Inspired Mover','<font color=\"#374151\" face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"font-size: 16px; white-space: pre-wrap;\">The Moving Warriors has changed my life for the better. Skye\'s guidance and expertise has helped me to find new levels of strength, flexibility, and grace through Budokon. I am grateful for this experience and highly recommend it to anyone looking to improve their physical and mental well-being.</span></font>'),(2,2,'en','Natasha Hope','Inspired Mover','<p>I was hesitant to try Budokon, but after just a few classes with Skye and The Moving Warriors, I was hooked. The combination of martial arts, yoga, and animal movements is unlike anything I have ever experienced. I feel stronger, more confident, and truly connected to my body.</p>'),(3,3,'en','Charles Dale','Inspired Mover','<p>I have been a student of Skye\'s for several years and have seen tremendous growth in my practice. The Moving Warriors offers a supportive and inclusive environment that has helped me to progress faster than I ever thought possible. I highly recommend this program to anyone looking to transform their life through Budokon.</p>');
/*!40000 ALTER TABLE `testimonial_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'/store/1/default_images/testimonials/profile_picture (50).jpg','5','active',1676281034),(2,'/store/1/default_images/testimonials/profile_picture (38).jpg','4','active',1676281153),(3,'/store/1/default_images/testimonials/profile_picture (52).jpg','5','active',1676281266);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lesson_translations`
--

DROP TABLE IF EXISTS `text_lesson_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_lesson_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_lesson_id` (`text_lesson_id`),
  KEY `text_lesson_translations_locale_index` (`locale`),
  CONSTRAINT `text_lesson_id` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lesson_translations`
--

LOCK TABLES `text_lesson_translations` WRITE;
/*!40000 ALTER TABLE `text_lesson_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_lesson_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lessons`
--

DROP TABLE IF EXISTS `text_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_time` int(10) unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `text_lessons_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `text_lessons_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `text_lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lessons`
--

LOCK TABLES `text_lessons` WRITE;
/*!40000 ALTER TABLE `text_lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_lessons_attachments`
--

DROP TABLE IF EXISTS `text_lessons_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_lessons_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_attachments_text_lesson_id_foreign` (`text_lesson_id`) USING BTREE,
  KEY `text_lessons_attachments_file_id_foreign` (`file_id`) USING BTREE,
  CONSTRAINT `text_lessons_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_attachments_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_lessons_attachments`
--

LOCK TABLES `text_lessons_attachments` WRITE;
/*!40000 ALTER TABLE `text_lessons_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_lessons_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_translations`
--

DROP TABLE IF EXISTS `ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_translations_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_translations_locale_index` (`locale`),
  CONSTRAINT `ticket_translations_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_translations`
--

LOCK TABLES `ticket_translations` WRITE;
/*!40000 ALTER TABLE `ticket_translations` DISABLE KEYS */;
INSERT INTO `ticket_translations` VALUES (2,2,'en','Black Friday 50% off!');
/*!40000 ALTER TABLE `ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_users`
--

DROP TABLE IF EXISTS `ticket_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ticket_users_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `ticket_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `ticket_users_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_users`
--

LOCK TABLES `ticket_users` WRITE;
/*!40000 ALTER TABLE `ticket_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `start_date` int(10) unsigned DEFAULT NULL,
  `end_date` int(10) unsigned DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tickets_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tickets_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `tickets_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `tickets_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (2,1020,3,NULL,1675900800,1676246400,50,10,NULL,1675930074,NULL,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trend_categories`
--

DROP TABLE IF EXISTS `trend_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trend_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `trend_categories_category_id_index` (`category_id`) USING BTREE,
  CONSTRAINT `trend_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trend_categories`
--

LOCK TABLES `trend_categories` WRITE;
/*!40000 ALTER TABLE `trend_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `trend_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `organ_id` int(11) DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `financial_approval` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_settings` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `province_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `district_id` int(10) unsigned DEFAULT NULL,
  `location` point DEFAULT NULL,
  `level_of_training` bit(3) DEFAULT NULL,
  `meeting_type` enum('all','in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `status` enum('active','pending','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `access_content` tinyint(1) NOT NULL DEFAULT 1,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `public_message` tinyint(1) NOT NULL DEFAULT 0,
  `account_type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_scan` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` int(10) unsigned DEFAULT NULL,
  `affiliate` tinyint(1) NOT NULL DEFAULT 1,
  `can_create_store` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Despite disabling the store feature in the settings, we can enable this feature for that user through the edit page of a user and turning on the store toggle.',
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `ban_start_at` int(10) unsigned DEFAULT NULL,
  `ban_end_at` int(10) unsigned DEFAULT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT 0,
  `offline_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `users_mobile_unique` (`mobile`) USING BTREE,
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_province_id_foreign` (`province_id`),
  KEY `users_city_id_foreign` (`city_id`),
  KEY `users_district_id_foreign` (`district_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin',2,NULL,'00000000','craig@nl4yb.co.za','Senior software developer','$2y$10$BrFL/TucvTHcVcVvUyOAWuEluC/K/D9f26byq/7SF4ZHHzQQ3dLEm',NULL,NULL,'sCAbLCqrqEcCvAF8R1T4W6aoPd3a3v7gg4QVx7setouuGavs8RUoL47tqhgW',1,0,'/store/1/default_images/logo-new.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,'EN','America/New_York',0,0,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1597826952,1597826952,NULL),(1014,'George Hamilton','Author Role',9,NULL,'6104254644','Robert@gmail.com',NULL,'$2y$10$UQtinAOPeFdgy81Mxd3z7uGdSz2gsQsh0A3osAkoOb7A6IpjnDH0a',NULL,NULL,NULL,1,0,'/store/1/default_images/testimonials/profile_picture (30).jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,NULL,'America/New_York',0,0,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,0,NULL,1624692024,NULL,NULL),(1016,'Dave','teacher',4,NULL,'+27648420105','dave@gmail.com','Steel Mace Instructor','$2y$10$9OKFOzkQdxFLMbU4d9URtu9bSNPv.fmWOXs7n8uVOq.igCJGY0ri.',NULL,NULL,NULL,0,1,'/store/1016/avatar/617a4f17c8e72.png',NULL,'/store/1016/7.jpg',NULL,'Welcome to the online home of Dave, your go-to source for expert steel mace training. Dave is a highly experienced and knowledgeable instructor with a passion for helping people achieve their fitness goals. With 5 years of experience in the industry, Dave has become one of the leading experts in steel mace training and functional fitness.','Luib, 72 Wern Ddu Lane',NULL,NULL,NULL,NULL,'\0\0\0\0\0\0\0����gH@�:Y��@','','all','active',1,NULL,'Africa/Johannesburg',0,0,'JPMorgan','GB55BARC20040182633883','456873063464','/store/1016/passport.jpg','',NULL,1,1,0,NULL,NULL,1,'I am not available for 2 days due to a business trip',1624817905,NULL,NULL),(1020,'Skye Mallon','teacher',4,NULL,'0742841378','skye@themovingwarriors.com',NULL,'$2y$10$fT0zHRrzloaKJR29Po9RSOFdaoau2zWKca.Gb1O66o4T4Sh0IR5kK',NULL,NULL,'qeAoAcBVI3QyqxDn0IJZSBLPhKpR5UKt1QAuvW8QCrwZ7wE4HN0GSmC6MRac',1,0,NULL,'{\"color\":\"000000\",\"background\":\"29b6f6\"}',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','all','active',1,'EN',NULL,0,0,'','','','','',NULL,0,0,0,NULL,NULL,0,NULL,1675750861,NULL,NULL),(1023,'Craig','user',1,NULL,'27648420105','182craig@gmail.com',NULL,'$2y$10$Tb7vdMJGNZ1KqnsyCP1ACObR6ZdbM7LYOjfwTCHKEklyGeEOkexsq',NULL,NULL,'QA8HeJuao3DmIaPsxFEphBqVEOHdxYDVivqX0NRvlGUpNjSEHltNfRBk0OBH',1,0,NULL,'{\"color\":\"000000\",\"background\":\"efebe9\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','active',1,'EN','Africa/Johannesburg',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1675869754,NULL,NULL),(1024,'gazon_hwOa','user',1,NULL,'785148471962','aidoabtnsOa@xrum.store',NULL,'$2y$10$0eJ7YdYNC1mPG0FPpmk36.hudvhnrpZG9zJ9nMwdhk8YZp.ePY6RC',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Africa/Niamey',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1676702607,NULL,NULL),(1025,'ekskursii_mxel','user',1,NULL,'781822356192','oorijqnvbel@baikcm.ru',NULL,'$2y$10$iNkS7Vz68QAgCL8sPD4ZhuChLlajOPZ/maUVjKPHknlGOxkUwXrpS',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Pacific/Auckland',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1677623369,NULL,NULL),(1026,'tehpomosch_qaMl','user',1,NULL,'783316314485','eoeefbsjsMl@xrum.store',NULL,'$2y$10$/kQEE/V/oUvrnxr7mqFBCueaSYtZkHOXwKxfMR.bg7/jdrD1XZdWi',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Indian/Cocos',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1678240145,NULL,NULL),(1027,'bankrotstv_lrOt','user',1,NULL,'786299925423','zrqaudlprOt@shush-skk.ru',NULL,'$2y$10$ReVax227EJfq633U9xkcjuik6Jvfb6ODFJIkERc0XkPFYf7kPojZK',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Africa/Bamako',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1678542978,NULL,NULL),(1028,'karkasnye_lgKr','user',1,NULL,'782516489582','dxlhicgynKr@love-best.ru',NULL,'$2y$10$D8/4XEL2vTg9cdaa5i3neOxn5yRGZhLjk.LdnzsipR48m6etwz0Ei',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Asia/Vientiane',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1678839027,NULL,NULL),(1029,'bolezni_ieOi','user',1,NULL,'789952727745','hzdexmmviOi@shush-skk.ru',NULL,'$2y$10$Cv6wvqWuuiA.B3f/ghVU2eRthNURl4nYc7a/w.xPOb4I0WJeuRU2G',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Europe/Vilnius',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679007929,NULL,NULL),(1030,'pansionat_qbpi','user',1,NULL,'787181967695','zepjxhxqspi@love-best.ru',NULL,'$2y$10$Za8awm0ruDa9Am.nsnvTH.qM8xA.q3s.flN2Uzk2avvbWtHJfklqy',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Europe/San_Marino',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679183662,NULL,NULL),(1031,'bankrotstv_diOt','user',1,NULL,'786762893698','hzqxyxfahOt@shush-skk.ru',NULL,'$2y$10$eElsAdUMG9WGlPlSWCkfeeij/KfTvXtNAkEBEGIrC0MLcHNwtCBA2',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Asia/Jayapura',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679218139,NULL,NULL),(1032,'karkasnye_kiKi','user',1,NULL,'784654296782','yrfauhdvtKi@shush-skk.ru',NULL,'$2y$10$2SK1fEZzdm/PK0n/RF4h/O0Xo8LFLRvjXYxP8VMvWLM2r4cloO9Fm',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'America/Rankin_Inlet',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679447831,NULL,NULL),(1033,'viza_qlmr','user',1,NULL,'786646551153','bhmkistbjmr@love-best.ru',NULL,'$2y$10$m9y9bPQvJKxccs6wXsst1OqAniKcfl7zw/TtQXb6TRl5GzK3J2W2m',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'America/Scoresbysund',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679612555,NULL,NULL),(1034,'pechat_kpol','user',1,NULL,'787761229484','sdjkuchjdol@shush-skk.ru',NULL,'$2y$10$MguaESpwLm2iFu6JYLK9F.C4ITlZcoRuqZUzichdOvi4X6c6QBFGi',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'America/Guyana',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679663694,NULL,NULL),(1035,'viza_shet','user',1,NULL,'789816197855','xubukduadet@shush-skk.ru',NULL,'$2y$10$13KLXKuZNqxOd6p5E3GineXTMxLo.RcyWGmpUu/iSqR0XGkXAhrCS',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Africa/Ouagadougou',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679860401,NULL,NULL),(1036,'parka_mqer','user',1,NULL,'783333373718','cfwrwkcqyer@love-best.ru',NULL,'$2y$10$Swq8.RXjkl5aOM2LhuhO3OlpyDW31m0lxUwXspO58g8s8mh23LHNu',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'Africa/Kampala',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1679954719,NULL,NULL),(1037,'shuba_edpt','user',1,NULL,'789984732738','pabtflmhspt@shush-skk.ru',NULL,'$2y$10$LifT5EH6dUYE7WF1Iz9FdOfX2DyE583bVKxm7dz2lCdtoa0E5hk0.',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'America/Bahia',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1680131666,NULL,NULL),(1038,'tvh_udSt','user',1,NULL,'789761799766','ovtqesiseSt@shush-skk.ru',NULL,'$2y$10$gr1JKJlC0HEm5Ex7bEMks.NB438kPKschRtXyaufb/xQIp1jKWa.q',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'all','pending',1,NULL,'America/Juneau',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,NULL,1680488714,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_badges`
--

DROP TABLE IF EXISTS `users_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_badges_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_badges_badge_id_foreign` (`badge_id`) USING BTREE,
  CONSTRAINT `users_badges_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_badges`
--

LOCK TABLES `users_badges` WRITE;
/*!40000 ALTER TABLE `users_badges` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_cookie_security`
--

DROP TABLE IF EXISTS `users_cookie_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_cookie_security` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('all','customize') COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cookie_security_user_id_foreign` (`user_id`),
  CONSTRAINT `users_cookie_security_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cookie_security`
--

LOCK TABLES `users_cookie_security` WRITE;
/*!40000 ALTER TABLE `users_cookie_security` DISABLE KEYS */;
INSERT INTO `users_cookie_security` VALUES (1,1,'all',NULL,1675848266),(2,1020,'all',NULL,1675867224),(3,1023,'all',NULL,1675919766);
/*!40000 ALTER TABLE `users_cookie_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_manual_purchase`
--

DROP TABLE IF EXISTS `users_manual_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_manual_purchase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_manual_purchase`
--

LOCK TABLES `users_manual_purchase` WRITE;
/*!40000 ALTER TABLE `users_manual_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_manual_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_metas`
--

DROP TABLE IF EXISTS `users_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_metas_user_id_foreign` (`user_id`),
  CONSTRAINT `users_metas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_metas`
--

LOCK TABLES `users_metas` WRITE;
/*!40000 ALTER TABLE `users_metas` DISABLE KEYS */;
INSERT INTO `users_metas` VALUES (1,1016,'address','Luib, 72 Wern Ddu Lane'),(2,1020,'gender','woman'),(3,1020,'age','26');
/*!40000 ALTER TABLE `users_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_occupations`
--

DROP TABLE IF EXISTS `users_occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_occupations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_occupations_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_occupations_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `users_occupations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_occupations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_occupations`
--

LOCK TABLES `users_occupations` WRITE;
/*!40000 ALTER TABLE `users_occupations` DISABLE KEYS */;
INSERT INTO `users_occupations` VALUES (2,1023,6),(3,1023,13),(4,1023,15),(5,1023,18);
/*!40000 ALTER TABLE `users_occupations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_registration_packages`
--

DROP TABLE IF EXISTS `users_registration_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_registration_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `instructors_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `courses_capacity` int(11) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `meeting_count` int(11) DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_registration_packages_user_id_foreign` (`user_id`),
  CONSTRAINT `users_registration_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_registration_packages`
--

LOCK TABLES `users_registration_packages` WRITE;
/*!40000 ALTER TABLE `users_registration_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_registration_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_zoom_api`
--

DROP TABLE IF EXISTS `users_zoom_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_zoom_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `jwt_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_zoom_api_user_id_foreign` (`user_id`),
  CONSTRAINT `users_zoom_api_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_zoom_api`
--

LOCK TABLES `users_zoom_api` WRITE;
/*!40000 ALTER TABLE `users_zoom_api` DISABLE KEYS */;
INSERT INTO `users_zoom_api` VALUES (1,1020,'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6InlUVklvam9YUk02RzhHQUlxOU1WdkEiLCJleHAiOjE3NzA2MjMzNDAsImlhdCI6MTY3NTkyMzU4OX0.Zla1bcyrnCeoYgPzP67ri03irqbbRRcgW6aOE1APFDc',1675923677);
/*!40000 ALTER TABLE `users_zoom_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifications`
--

DROP TABLE IF EXISTS `verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `mobile` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_at` int(10) unsigned DEFAULT NULL,
  `expired_at` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `verifications_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifications`
--

LOCK TABLES `verifications` WRITE;
/*!40000 ALTER TABLE `verifications` DISABLE KEYS */;
INSERT INTO `verifications` VALUES (3,1023,NULL,'182craig@gmail.com','88566',NULL,1675873354,1675869754),(4,1024,NULL,'aidoabtnsOa@xrum.store','53211',NULL,1676706207,1676702607),(5,1025,NULL,'oorijqnvbel@baikcm.ru','33333',NULL,1677626969,1677623369),(6,1026,NULL,'eoeefbsjsMl@xrum.store','93508',NULL,1678243745,1678240145),(7,1027,NULL,'zrqaudlprOt@shush-skk.ru','37784',NULL,1678546578,1678542978),(8,1028,NULL,'dxlhicgynKr@love-best.ru','86907',NULL,1678842627,1678839027),(9,1029,NULL,'hzdexmmviOi@shush-skk.ru','93418',NULL,1679011529,1679007929),(10,1030,NULL,'zepjxhxqspi@love-best.ru','27640',NULL,1679187262,1679183662),(11,1031,NULL,'hzqxyxfahOt@shush-skk.ru','76489',NULL,1679221739,1679218139),(12,1032,NULL,'yrfauhdvtKi@shush-skk.ru','58208',NULL,1679451431,1679447831),(13,1033,NULL,'bhmkistbjmr@love-best.ru','68176',NULL,1679616155,1679612555),(14,1034,NULL,'sdjkuchjdol@shush-skk.ru','15141',NULL,1679667294,1679663694),(15,1035,NULL,'xubukduadet@shush-skk.ru','64464',NULL,1679864001,1679860401),(16,1036,NULL,'cfwrwkcqyer@love-best.ru','63040',NULL,1679958319,1679954719),(17,1037,NULL,'pabtflmhspt@shush-skk.ru','43558',NULL,1680135266,1680131666),(18,1038,NULL,'ovtqesiseSt@shush-skk.ru','49903',NULL,1680492314,1680488714);
/*!40000 ALTER TABLE `verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_attachments`
--

DROP TABLE IF EXISTS `webinar_assignment_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_assignment_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `assignment_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_attachments_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_attachments_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_attachments`
--

LOCK TABLES `webinar_assignment_attachments` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_history`
--

DROP TABLE IF EXISTS `webinar_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_assignment_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instructor_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `assignment_id` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  `status` enum('pending','passed','not_passed','not_submitted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_instructor_id_foreign` (`instructor_id`),
  KEY `webinar_assignment_history_student_id_foreign` (`student_id`),
  KEY `webinar_assignment_history_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_history_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_history`
--

LOCK TABLES `webinar_assignment_history` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_history_messages`
--

DROP TABLE IF EXISTS `webinar_assignment_history_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_assignment_history_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assignment_history_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_id` (`assignment_history_id`),
  CONSTRAINT `webinar_assignment_history_id` FOREIGN KEY (`assignment_history_id`) REFERENCES `webinar_assignment_history` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_history_messages`
--

LOCK TABLES `webinar_assignment_history_messages` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_history_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_history_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignment_translations`
--

DROP TABLE IF EXISTS `webinar_assignment_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_assignment_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webinar_assignment_id` int(10) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_id_translate_foreign` (`webinar_assignment_id`),
  KEY `webinar_assignment_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_assignment_id_translate_foreign` FOREIGN KEY (`webinar_assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignment_translations`
--

LOCK TABLES `webinar_assignment_translations` WRITE;
/*!40000 ALTER TABLE `webinar_assignment_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignment_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_assignments`
--

DROP TABLE IF EXISTS `webinar_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  `pass_grade` int(10) unsigned DEFAULT NULL,
  `deadline` int(10) unsigned DEFAULT NULL,
  `attempts` int(10) unsigned DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT 0,
  `access_after_day` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignments_creator_id_foreign` (`creator_id`),
  KEY `webinar_assignments_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_assignments_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `webinar_assignments_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_assignments`
--

LOCK TABLES `webinar_assignments` WRITE;
/*!40000 ALTER TABLE `webinar_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapter_items`
--

DROP TABLE IF EXISTS `webinar_chapter_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_chapter_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `type` enum('file','session','text_lesson','quiz','assignment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_items_chapter_id_foreign` (`chapter_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapter_items_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapter_items`
--

LOCK TABLES `webinar_chapter_items` WRITE;
/*!40000 ALTER TABLE `webinar_chapter_items` DISABLE KEYS */;
INSERT INTO `webinar_chapter_items` VALUES (5,1020,5,2,'session',1,1675931719);
/*!40000 ALTER TABLE `webinar_chapter_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapter_translations`
--

DROP TABLE IF EXISTS `webinar_chapter_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_chapter_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_chapter_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_id` (`webinar_chapter_id`),
  KEY `webinar_chapter_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_chapter_id` FOREIGN KEY (`webinar_chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapter_translations`
--

LOCK TABLES `webinar_chapter_translations` WRITE;
/*!40000 ALTER TABLE `webinar_chapter_translations` DISABLE KEYS */;
INSERT INTO `webinar_chapter_translations` VALUES (5,5,'en','Live Class');
/*!40000 ALTER TABLE `webinar_chapter_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_chapters`
--

DROP TABLE IF EXISTS `webinar_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_chapters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `check_all_contents_pass` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 NOT NULL DEFAULT 'active',
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapters_user_id_foreign` (`user_id`),
  KEY `webinar_chapters_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `webinar_chapters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapters_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_chapters`
--

LOCK TABLES `webinar_chapters` WRITE;
/*!40000 ALTER TABLE `webinar_chapters` DISABLE KEYS */;
INSERT INTO `webinar_chapters` VALUES (5,1020,3,NULL,0,'active',1675925733);
/*!40000 ALTER TABLE `webinar_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_extra_description_translations`
--

DROP TABLE IF EXISTS `webinar_extra_description_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_extra_description_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_extra_description_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_description_id_foreign` (`webinar_extra_description_id`),
  KEY `webinar_extra_description_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_extra_description_id_foreign` FOREIGN KEY (`webinar_extra_description_id`) REFERENCES `webinar_extra_descriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_extra_description_translations`
--

LOCK TABLES `webinar_extra_description_translations` WRITE;
/*!40000 ALTER TABLE `webinar_extra_description_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_extra_description_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_extra_descriptions`
--

DROP TABLE IF EXISTS `webinar_extra_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_extra_descriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `type` enum('learning_materials','company_logos','requirements') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `created_at` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_descriptions_creator_id_foreign` (`creator_id`),
  KEY `webinar_extra_descriptions_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `webinar_extra_descriptions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_extra_descriptions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_extra_descriptions`
--

LOCK TABLES `webinar_extra_descriptions` WRITE;
/*!40000 ALTER TABLE `webinar_extra_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_extra_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_filter_option`
--

DROP TABLE IF EXISTS `webinar_filter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_filter_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `filter_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_filter_option_filter_option_id_foreign` (`filter_option_id`) USING BTREE,
  KEY `webinar_filter_option_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_filter_option_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_filter_option`
--

LOCK TABLES `webinar_filter_option` WRITE;
/*!40000 ALTER TABLE `webinar_filter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_filter_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_partner_teacher`
--

DROP TABLE IF EXISTS `webinar_partner_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_partner_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `teacher_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_partner_teacher_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_partner_teacher_teacher_id_foreign` (`teacher_id`) USING BTREE,
  CONSTRAINT `webinar_partner_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_partner_teacher_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_partner_teacher`
--

LOCK TABLES `webinar_partner_teacher` WRITE;
/*!40000 ALTER TABLE `webinar_partner_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_partner_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_reports`
--

DROP TABLE IF EXISTS `webinar_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_reports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_reports`
--

LOCK TABLES `webinar_reports` WRITE;
/*!40000 ALTER TABLE `webinar_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_reviews`
--

DROP TABLE IF EXISTS `webinar_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `webinar_id` int(10) unsigned DEFAULT NULL,
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `content_quality` int(10) unsigned NOT NULL,
  `instructor_skills` int(10) unsigned NOT NULL,
  `purchase_worth` int(10) unsigned NOT NULL,
  `support_quality` int(10) unsigned NOT NULL,
  `rates` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reviews_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_reviews_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `webinar_reviews_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `webinar_reviews_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_reviews`
--

LOCK TABLES `webinar_reviews` WRITE;
/*!40000 ALTER TABLE `webinar_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `webinar_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinar_translations`
--

DROP TABLE IF EXISTS `webinar_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinar_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_translations_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_translations_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinar_translations`
--

LOCK TABLES `webinar_translations` WRITE;
/*!40000 ALTER TABLE `webinar_translations` DISABLE KEYS */;
INSERT INTO `webinar_translations` VALUES (3,3,'en','Introduction to Budokon','Get started on your Budokon journey with this fun and dynamic Introduction to Budokon online live class. Experience the power of this unique movement practice combining yoga, martial arts, and animal locomotion. All levels welcome.','<h1><span style=\"font-family: var(--font-family-base); font-size: 1rem;\"><b>Join us for a fun and dynamic journey into the world of Budokon, a holistic movement practice that combines elements of yoga, martial arts, and animal locomotion. In this introductory class, you will have the opportunity to experience the power of Budokon for yourself and learn the basics of this unique practice.</b></span></h1><p><br></p><p>During this one-hour live class, you can expect:</p><p><br></p><p>A brief overview of the history and philosophy of Budokon</p><p><br></p><p>a warm-up that will get you moving and prepare your body for the practice.</p><p><br></p><p>a series of yoga-inspired poses and movements that will help you develop flexibility, balance, and strength.</p><p><br></p><p>An introduction to Budokon animal locomotion, where you will explore movements inspired by the way animals move in their natural habitats.</p><p><br></p><p>a cool-down that will help you integrate the benefits of the practice and return to your day feeling refreshed and rejuvenated.</p><p><br></p><p>No prior experience with Budokon or any other movement practice is required to participate in this class. All levels are welcome, and modifications will be offered to accommodate varying experience levels.</p><p><br></p><p>So come and join us for an introduction to Budokon and discover the power of movement for yourself!</p>'),(4,4,'en','asdadasd',NULL,'<p>aasdadadasdas</p>');
/*!40000 ALTER TABLE `webinar_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webinars`
--

DROP TABLE IF EXISTS `webinars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webinars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `type` enum('webinar','course','text_lesson') COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `organization_price` int(10) unsigned DEFAULT NULL,
  `support` tinyint(1) DEFAULT 0,
  `certificate` tinyint(1) NOT NULL DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `partner_instructor` tinyint(1) DEFAULT 0,
  `subscribe` tinyint(1) DEFAULT 0,
  `forum` tinyint(1) NOT NULL DEFAULT 0,
  `access_days` int(10) unsigned DEFAULT NULL COMMENT 'Number of days to access the course',
  `points` int(11) DEFAULT NULL,
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `webinars_slug_unique` (`slug`) USING BTREE,
  KEY `webinars_teacher_id_foreign` (`teacher_id`) USING BTREE,
  KEY `webinars_category_id_foreign` (`category_id`) USING BTREE,
  KEY `webinars_slug_index` (`slug`) USING BTREE,
  KEY `webinars_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `webinars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webinars`
--

LOCK TABLES `webinars` WRITE;
/*!40000 ALTER TABLE `webinars` DISABLE KEYS */;
INSERT INTO `webinars` VALUES (3,1020,1020,9,'webinar',0,'Introduction-to-Budokon',1675927800,60,'Africa/Johannesburg','/store/1020/277672432_272325965097195_8613072582246396567_n.jpg','/store/1020/254133083_187190956935756_7361478487256596703_n.jpg','https://www.youtube.com/watch?v=SaG87hvIeLI','youtube',10,1000,NULL,0,0,0,0,1,0,NULL,NULL,'Pls check and Approve','active',1675924986,1675952242,NULL),(4,1020,1020,15,'course',0,'Introduction to Budokon1',NULL,60,'Africa/Johannesburg','/store/1/Courses/Introduction to Budokon 1.jpg','/store/1/Courses/Introduction to Budokon.jpg',NULL,NULL,NULL,500,NULL,0,0,1,0,1,0,NULL,NULL,NULL,'pending',1675952471,1675952471,NULL);
/*!40000 ALTER TABLE `webinars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05 10:52:34
