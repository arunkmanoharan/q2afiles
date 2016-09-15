-- MySQL dump 10.13  Distrib 5.1.73, for Win64 (unknown)
--
-- Host: localhost    Database: nimeyo_th
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qa_blobs`
--

DROP TABLE IF EXISTS `qa_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_blobs`
--

LOCK TABLES `qa_blobs` WRITE;
/*!40000 ALTER TABLE `qa_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cache`
--

DROP TABLE IF EXISTS `qa_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cache`
--

LOCK TABLES `qa_cache` WRITE;
/*!40000 ALTER TABLE `qa_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
INSERT INTO `qa_categories` VALUES (1,NULL,'IT','it','Information Technology',1,1,'it');
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categorymetas`
--

DROP TABLE IF EXISTS `qa_categorymetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`),
  CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categorymetas`
--

LOCK TABLES `qa_categorymetas` WRITE;
/*!40000 ALTER TABLE `qa_categorymetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categorymetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_contentwords`
--

DROP TABLE IF EXISTS `qa_contentwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_contentwords`
--

LOCK TABLES `qa_contentwords` WRITE;
/*!40000 ALTER TABLE `qa_contentwords` DISABLE KEYS */;
INSERT INTO `qa_contentwords` VALUES (3,10,1,'Q',3),(3,11,1,'Q',3),(3,12,1,'Q',3),(3,13,1,'Q',3),(3,14,1,'Q',3),(3,15,1,'Q',3),(3,8,1,'Q',3),(4,25,1,'Q',4),(4,27,1,'Q',4),(4,22,1,'Q',4),(4,28,1,'Q',4),(4,23,1,'Q',4),(4,29,1,'Q',4),(4,30,1,'Q',4),(4,31,2,'Q',4),(4,32,1,'Q',4),(4,33,1,'Q',4),(4,21,1,'Q',4),(4,34,1,'Q',4),(18,25,1,'A',1),(18,23,1,'A',1),(18,27,1,'A',1),(18,98,1,'A',1),(18,134,1,'A',1),(18,135,1,'A',1),(18,29,1,'A',1),(18,76,1,'A',1),(18,136,1,'A',1),(18,137,1,'A',1),(18,138,1,'A',1),(19,73,3,'A',16),(19,122,1,'A',16),(19,139,1,'A',16),(19,80,1,'A',16),(19,140,1,'A',16),(19,113,1,'A',16),(19,141,2,'A',16),(19,92,1,'A',16),(19,142,2,'A',16),(19,143,1,'A',16),(19,144,1,'A',16),(19,29,1,'A',16),(19,145,1,'A',16),(19,146,1,'A',16),(19,147,1,'A',16),(19,148,1,'A',16),(19,149,1,'A',16),(19,84,1,'A',16),(19,127,1,'A',16),(19,150,1,'A',16),(19,151,1,'A',16),(19,152,1,'A',16),(19,153,1,'A',16),(19,154,1,'A',16),(19,31,1,'A',16),(19,155,1,'A',16),(19,156,1,'A',16),(19,157,1,'A',16),(19,158,1,'A',16),(19,159,1,'A',16),(19,160,1,'A',16),(20,165,2,'Q',20),(20,166,2,'Q',20),(20,27,1,'Q',20),(20,167,1,'Q',20),(20,168,2,'Q',20),(20,169,2,'Q',20),(20,33,2,'Q',20),(20,31,4,'Q',20),(20,170,1,'Q',20),(20,141,2,'Q',20),(20,171,2,'Q',20),(20,172,1,'Q',20),(20,173,2,'Q',20),(20,174,1,'Q',20),(20,175,1,'Q',20),(20,176,1,'Q',20),(20,39,1,'Q',20),(20,177,1,'Q',20),(20,178,1,'Q',20),(20,125,1,'Q',20),(20,77,1,'Q',20),(20,179,1,'Q',20),(20,180,1,'Q',20),(20,181,1,'Q',20),(20,22,2,'Q',20),(20,182,1,'Q',20),(20,183,2,'Q',20),(20,184,1,'Q',20),(20,92,2,'Q',20),(20,29,1,'Q',20),(20,52,1,'Q',20),(20,185,1,'Q',20),(20,186,1,'Q',20),(20,187,1,'Q',20),(20,98,1,'Q',20),(20,188,1,'Q',20),(20,189,1,'Q',20),(20,190,1,'Q',20),(20,191,1,'Q',20),(20,192,1,'Q',20),(20,193,1,'Q',20),(20,194,1,'Q',20),(20,195,1,'Q',20),(20,196,1,'Q',20),(20,197,1,'Q',20),(20,198,1,'Q',20),(21,165,2,'Q',21),(21,166,2,'Q',21),(21,27,1,'Q',21),(21,167,1,'Q',21),(21,168,2,'Q',21),(21,169,2,'Q',21),(21,33,2,'Q',21),(21,31,4,'Q',21),(21,170,1,'Q',21),(21,141,2,'Q',21),(21,171,2,'Q',21),(21,172,1,'Q',21),(21,173,2,'Q',21),(21,174,1,'Q',21),(21,175,1,'Q',21),(21,176,1,'Q',21),(21,39,1,'Q',21),(21,177,1,'Q',21),(21,178,1,'Q',21),(21,125,1,'Q',21),(21,77,1,'Q',21),(21,179,1,'Q',21),(21,180,1,'Q',21),(21,181,1,'Q',21),(21,22,2,'Q',21),(21,182,1,'Q',21),(21,183,2,'Q',21),(21,184,1,'Q',21),(21,92,2,'Q',21),(21,29,1,'Q',21),(21,52,1,'Q',21),(21,185,1,'Q',21),(21,186,1,'Q',21),(21,187,1,'Q',21),(21,98,1,'Q',21),(21,188,1,'Q',21),(21,189,1,'Q',21),(21,190,1,'Q',21),(21,191,1,'Q',21),(21,192,1,'Q',21),(21,193,1,'Q',21),(21,194,1,'Q',21),(21,195,1,'Q',21),(21,196,1,'Q',21),(21,197,1,'Q',21),(21,198,1,'Q',21),(22,165,2,'Q',22),(22,166,2,'Q',22),(22,27,1,'Q',22),(22,167,1,'Q',22),(22,168,2,'Q',22),(22,169,2,'Q',22),(22,33,2,'Q',22),(22,31,4,'Q',22),(22,170,1,'Q',22),(22,141,2,'Q',22),(22,171,2,'Q',22),(22,172,1,'Q',22),(22,173,2,'Q',22),(22,174,1,'Q',22),(22,175,1,'Q',22),(22,176,1,'Q',22),(22,39,1,'Q',22),(22,177,1,'Q',22),(22,178,1,'Q',22),(22,125,1,'Q',22),(22,77,1,'Q',22),(22,179,1,'Q',22),(22,180,1,'Q',22),(22,181,1,'Q',22),(22,22,2,'Q',22),(22,182,1,'Q',22),(22,183,2,'Q',22),(22,184,1,'Q',22),(22,92,2,'Q',22),(22,29,1,'Q',22),(22,52,1,'Q',22),(22,185,1,'Q',22),(22,186,1,'Q',22),(22,187,1,'Q',22),(22,98,1,'Q',22),(22,188,1,'Q',22),(22,189,1,'Q',22),(22,190,1,'Q',22),(22,191,1,'Q',22),(22,192,1,'Q',22),(22,193,1,'Q',22),(22,194,1,'Q',22),(22,195,1,'Q',22),(22,196,1,'Q',22),(22,197,1,'Q',22),(22,198,1,'Q',22),(23,206,1,'A',22),(23,202,1,'A',22);
/*!40000 ALTER TABLE `qa_contentwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cookies`
--

DROP TABLE IF EXISTS `qa_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cookies`
--

LOCK TABLES `qa_cookies` WRITE;
/*!40000 ALTER TABLE `qa_cookies` DISABLE KEYS */;
INSERT INTO `qa_cookies` VALUES (2546954801349069834,'2016-09-08 23:28:41',835664029,'2016-09-09 16:24:42',835664412),(5429748696535929013,'2016-09-08 10:58:34',2047843403,'2016-09-12 11:36:30',2047843403),(17098637306496578236,'2016-08-22 17:23:42',3475958555,'2016-08-22 17:23:42',3475958555);
/*!40000 ALTER TABLE `qa_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cs_widgets`
--

DROP TABLE IF EXISTS `qa_cs_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cs_widgets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `position` varchar(64) DEFAULT NULL,
  `widget_order` int(2) NOT NULL DEFAULT '0',
  `param` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cs_widgets`
--

LOCK TABLES `qa_cs_widgets` WRITE;
/*!40000 ALTER TABLE `qa_cs_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cs_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_iplimits`
--

DROP TABLE IF EXISTS `qa_iplimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_iplimits` (
  `ip` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_iplimits`
--

LOCK TABLES `qa_iplimits` WRITE;
/*!40000 ALTER TABLE `qa_iplimits` DISABLE KEYS */;
INSERT INTO `qa_iplimits` VALUES (0,'A',409350,1),(0,'L',409398,3),(0,'Q',408850,1),(0,'R',409350,1),(0,'V',409353,1),(835664029,'Q',409265,1),(835664412,'A',409282,2),(835664412,'Q',409282,13),(1978350572,'L',409409,1),(1978350572,'V',409409,2),(2047843403,'L',409352,1),(2047843403,'Q',409351,1),(2098643350,'L',409397,1),(2098643350,'V',409403,1),(3475958555,'L',408851,4),(3475958555,'Q',408851,1);
/*!40000 ALTER TABLE `qa_iplimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_messages`
--

DROP TABLE IF EXISTS `qa_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_messages` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) unsigned NOT NULL,
  `touserid` int(10) unsigned NOT NULL,
  `fromhidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  KEY `touserid` (`touserid`,`type`,`created`),
  KEY `fromhidden` (`fromhidden`),
  KEY `tohidden` (`tohidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_messages`
--

LOCK TABLES `qa_messages` WRITE;
/*!40000 ALTER TABLE `qa_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_options`
--

DROP TABLE IF EXISTS `qa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_options`
--

LOCK TABLES `qa_options` WRITE;
/*!40000 ALTER TABLE `qa_options` DISABLE KEYS */;
INSERT INTO `qa_options` VALUES ('allow_change_usernames','1'),('allow_close_questions','1'),('allow_login_email_only',''),('allow_multi_answers','1'),('allow_no_category',''),('allow_no_sub_category',''),('allow_private_messages','1'),('allow_self_answer','1'),('allow_user_walls','1'),('avatar_allow_gravatar','1'),('avatar_allow_upload','1'),('avatar_default_blobid',''),('avatar_default_height',''),('avatar_default_show',''),('avatar_default_width',''),('avatar_message_list_size','20'),('avatar_profile_size','200'),('avatar_q_list_size','0'),('avatar_q_page_a_size','40'),('avatar_q_page_c_size','20'),('avatar_q_page_q_size','50'),('avatar_store_size','400'),('avatar_users_size','30'),('block_bad_words',''),('block_ips_write',''),('cache_acount','3'),('cache_ccount',''),('cache_flaggedcount',''),('cache_qcount','21'),('cache_queuedcount',''),('cache_tagcount','37'),('cache_uapprovecount','1'),('cache_unaqcount','18'),('cache_unselqcount','20'),('cache_unupaqcount','20'),('cache_userpointscount','2'),('captcha_module','reCAPTCHA'),('captcha_on_anon_post','1'),('captcha_on_register','1'),('captcha_on_unconfirmed','0'),('columns_tags','3'),('columns_users','2'),('comment_on_as','1'),('comment_on_qs','0'),('confirm_user_emails','1'),('confirm_user_required',''),('cs_ads_after_question_content',''),('cs_ads_below_question_title',''),('cs_advs',''),('cs_ask_btn_bg',''),('cs_back_to_top_location','nav'),('cs_bg_color','#F4F4F4'),('cs_bg_select',''),('cs_border_color','#EEEEEE'),('cs_crop_x','c'),('cs_crop_y','c'),('cs_custom_css',''),('cs_custom_style',''),('cs_custom_style_created',''),('cs_enable_adv_list',''),('cs_enable_ask_button','1'),('cs_enable_avatar_lists',''),('cs_enable_category_nav','1'),('cs_enable_clean_qlist','1'),('cs_enable_default_home','1'),('cs_enable_except',''),('cs_enable_footer_nav','1'),('cs_enable_gzip',''),('cs_enble_back_to_top','1'),('cs_except_len','240'),('cs_favicon_url',''),('cs_featured_image_height','300'),('cs_featured_image_width','800'),('cs_featured_thumbnail_height','120'),('cs_featured_thumbnail_width','278'),('cs_footer_copyright','Copyright ¬© 2015'),('cs_highlight_bg_color',''),('cs_highlight_color',''),('cs_horizontal_voting_btns',''),('cs_init','1'),('cs_link_color',''),('cs_link_hover_color',''),('cs_mobile_logo_url','http://wpvm02.cloudapp.net:90//qa-theme/cleanstrap/images/small-logo.png'),('cs_nav_fixed','1'),('cs_nav_link_color',''),('cs_nav_link_color_hover',''),('cs_nav_position','top'),('cs_q_link_color',''),('cs_q_link_hover_color',''),('cs_show_icon','1'),('cs_show_tags_list','1'),('cs_social_enable',''),('cs_social_list',''),('cs_styling_closed_question',''),('cs_styling_duplicate_question',''),('cs_styling_open_question',''),('cs_styling_rtl',''),('cs_styling_solved_question',''),('cs_subnav_link_color',''),('cs_subnav_link_color_hover',''),('cs_text_color',''),('cs_theme_layout','boxed'),('cs_version','2.4.4'),('cs_widgets_positions','a:18:{s:3:\"Top\";s:13:\"Before navbar\";s:6:\"Header\";s:12:\"After navbar\";s:11:\"Header left\";s:19:\"Left side of header\";s:12:\"Header Right\";s:20:\"Right side of header\";s:4:\"Left\";s:21:\"Right side below menu\";s:11:\"Content Top\";s:21:\"Before questions list\";s:14:\"Content Bottom\";s:21:\"After questions lists\";s:5:\"Right\";s:21:\"Right side of content\";s:6:\"Bottom\";s:31:\"Below content and before footer\";s:10:\"Home Slide\";s:8:\"Home Top\";s:11:\"Home 1 Left\";s:15:\"Home position 1\";s:13:\"Home 1 Center\";s:15:\"Home position 1\";s:6:\"Home 2\";s:15:\"Home position 2\";s:11:\"Home 3 Left\";s:15:\"Home position 3\";s:13:\"Home 3 Center\";s:15:\"Home position 3\";s:10:\"Home Right\";s:15:\"Home right side\";s:14:\"Question Right\";s:22:\"Right side of question\";s:12:\"User Content\";s:12:\"On user page\";}'),('custom_answer',''),('custom_ask',''),('custom_comment',''),('custom_footer',''),('custom_header',''),('custom_home_content',''),('custom_home_heading',''),('custom_in_head',''),('custom_register',''),('custom_sidebar','Welcome to Localhost:90 Q&amp;A, where you can ask questions and receive answers from other members of the community.'),('custom_sidepanel',''),('custom_welcome',''),('db_version','59'),('do_ask_check_qs','0'),('do_close_on_select',''),('do_complete_tags','1'),('do_count_q_views','1'),('do_example_tags','1'),('editor_for_as','WYSIWYG Editor'),('editor_for_cs',''),('editor_for_qs','WYSIWYG Editor'),('event_logger_to_database',''),('event_logger_to_files',''),('extra_field_active',''),('extra_field_display',''),('extra_field_label',''),('extra_field_prompt',''),('facebook_app_id',''),('feedback_email','debashis_moharana@infosys.com'),('feedback_enabled','1'),('feed_for_activity','1'),('feed_for_hot',''),('feed_for_qa','1'),('feed_for_questions','1'),('feed_for_search',''),('feed_for_tag_qs',''),('feed_for_unanswered','1'),('feed_full_text','1'),('feed_number_items','50'),('feed_per_category','1'),('flagging_hide_after','5'),('flagging_of_posts','1'),('follow_on_as','1'),('form_security_salt','jhoj96lati5om4d4cki12wqeh0y613ll'),('from_email','no-reply@example.com'),('home_description',''),('hot_weight_answers','100'),('hot_weight_a_age','100'),('hot_weight_q_age','100'),('hot_weight_views','100'),('hot_weight_votes','100'),('links_in_new_window',''),('logo_height',''),('logo_show','0'),('logo_url','http://wpvm02.cloudapp.net:90//qa-theme/cleanstrap/images/logo.png'),('logo_width',''),('mailing_enabled',''),('match_ask_check_qs','3'),('match_example_tags','3'),('max_len_q_title','120'),('max_num_q_tags','5'),('max_rate_ip_as','50'),('max_rate_ip_cs','40'),('max_rate_ip_logins','20'),('max_rate_ip_messages','10'),('max_rate_ip_qs','20'),('max_rate_ip_registers','5'),('max_rate_ip_votes','600'),('max_rate_user_as','25'),('max_rate_user_cs','20'),('max_rate_user_messages','5'),('max_rate_user_qs','10'),('max_rate_user_votes','300'),('max_store_user_updates','50'),('min_len_a_content','12'),('min_len_c_content','12'),('min_len_q_content','0'),('min_len_q_title','12'),('min_num_q_tags','0'),('moderate_anon_post',''),('moderate_by_points',''),('moderate_edited_again',''),('moderate_unconfirmed',''),('moderate_users',''),('mouseover_content_on',''),('nav_activity','0'),('nav_ask','1'),('nav_categories','0'),('nav_home',''),('nav_hot','0'),('nav_qa_is_home','0'),('nav_questions','1'),('nav_tags','1'),('nav_unanswered','1'),('nav_users','1'),('neat_urls','5'),('notice_visitor',''),('notice_welcome',''),('notify_admin_q_post',''),('notify_users_default','1'),('pages_prev_next','3'),('page_size_activity','10'),('page_size_ask_check_qs','5'),('page_size_ask_tags','5'),('page_size_home','10'),('page_size_hot_qs','10'),('page_size_pms','10'),('page_size_qs','10'),('page_size_q_as','10'),('page_size_search','10'),('page_size_tags','30'),('page_size_tag_qs','20'),('page_size_una_qs','10'),('page_size_users','30'),('page_size_wall','10'),('permit_anon_view_ips','70'),('permit_close_q','70'),('permit_delete_hidden','40'),('permit_edit_a','100'),('permit_edit_c','70'),('permit_edit_q','70'),('permit_edit_silent','40'),('permit_flag','110'),('permit_hide_show','70'),('permit_moderate','100'),('permit_post_a','150'),('permit_post_c','150'),('permit_post_q','150'),('permit_post_wall','110'),('permit_retag_cat','70'),('permit_select_a','100'),('permit_view_q_page','150'),('permit_view_voters_flaggers','20'),('permit_vote_a','120'),('permit_vote_down','120'),('permit_vote_q','120'),('points_a_selected','30'),('points_a_voted_max_gain','20'),('points_a_voted_max_loss','5'),('points_base','100'),('points_multiple','10'),('points_per_a_voted',''),('points_per_a_voted_down','2'),('points_per_a_voted_up','2'),('points_per_q_voted',''),('points_per_q_voted_down','1'),('points_per_q_voted_up','1'),('points_post_a','4'),('points_post_q','2'),('points_q_voted_max_gain','10'),('points_q_voted_max_loss','3'),('points_select_a','3'),('points_to_titles',''),('points_vote_down_a','1'),('points_vote_down_q','1'),('points_vote_on_a',''),('points_vote_on_q',''),('points_vote_up_a','1'),('points_vote_up_q','1'),('q_urls_remove_accents',''),('q_urls_title_length','50'),('recaptcha_private_key',''),('recaptcha_public_key',''),('register_notify_admin',''),('register_terms','I agree to the Localhost:90 Q&amp;A Terms &amp; Conditions and Privacy Policy'),('search_module',''),('show_a_c_links','1'),('show_a_form_immediate','if_no_as'),('show_custom_answer',''),('show_custom_ask',''),('show_custom_comment',''),('show_custom_footer','0'),('show_custom_header','0'),('show_custom_home','0'),('show_custom_in_head','0'),('show_custom_register',''),('show_custom_sidebar','0'),('show_custom_sidepanel','0'),('show_custom_welcome','0'),('show_c_reply_buttons','1'),('show_fewer_cs_count','5'),('show_fewer_cs_from','10'),('show_full_date_days','7'),('show_home_description','0'),('show_message_history','1'),('show_notice_visitor',''),('show_notice_welcome',''),('show_post_update_meta','1'),('show_register_terms','0'),('show_selected_first','1'),('show_url_links','1'),('show_user_points','1'),('show_user_titles','1'),('show_view_counts',''),('show_view_count_q_page',''),('show_when_created','1'),('site_language',''),('site_maintenance','0'),('site_text_direction','ltr'),('site_theme','Snow'),('site_theme_mobile','Snow'),('site_title','Localhost:90 Q&A'),('site_url','http://wpvm02.cloudapp.net:90//'),('smtp_active',''),('smtp_address',''),('smtp_authenticate',''),('smtp_password',''),('smtp_port','25'),('smtp_secure',''),('smtp_username',''),('sort_answers_by','created'),('styling_open_question',''),('suspend_register_users',''),('tags_or_categories','tc'),('tag_cloud_count_tags','100'),('tag_cloud_font_size','24'),('tag_cloud_minimal_font_size','8'),('tag_cloud_size_popular','1'),('tag_separator_comma',''),('typo_googlefonts',''),('typo_options_backup_h1',''),('typo_options_backup_h2',''),('typo_options_backup_h3',''),('typo_options_backup_h4',''),('typo_options_backup_h5',''),('typo_options_backup_mainnav',''),('typo_options_backup_p',''),('typo_options_backup_pcontent',''),('typo_options_backup_qtitle',''),('typo_options_backup_qtitlelink',''),('typo_options_backup_quote',''),('typo_options_backup_span',''),('typo_options_family_h1',''),('typo_options_family_h2',''),('typo_options_family_h3',''),('typo_options_family_h4',''),('typo_options_family_h5',''),('typo_options_family_mainnav',''),('typo_options_family_p',''),('typo_options_family_pcontent',''),('typo_options_family_qtitle',''),('typo_options_family_qtitlelink',''),('typo_options_family_quote',''),('typo_options_family_span',''),('typo_options_linehight_h1',''),('typo_options_linehight_h2',''),('typo_options_linehight_h3',''),('typo_options_linehight_h4',''),('typo_options_linehight_h5',''),('typo_options_linehight_mainnav',''),('typo_options_linehight_p',''),('typo_options_linehight_pcontent',''),('typo_options_linehight_qtitle',''),('typo_options_linehight_qtitlelink',''),('typo_options_linehight_quote',''),('typo_options_linehight_span',''),('typo_options_size_h1',''),('typo_options_size_h2',''),('typo_options_size_h3',''),('typo_options_size_h4',''),('typo_options_size_h5',''),('typo_options_size_mainnav',''),('typo_options_size_p',''),('typo_options_size_pcontent',''),('typo_options_size_qtitle',''),('typo_options_size_qtitlelink',''),('typo_options_size_quote',''),('typo_options_size_span',''),('typo_options_style_h1',''),('typo_options_style_h2',''),('typo_options_style_h3',''),('typo_options_style_h4',''),('typo_options_style_h5',''),('typo_options_style_mainnav',''),('typo_options_style_p',''),('typo_options_style_pcontent',''),('typo_options_style_qtitle',''),('typo_options_style_qtitlelink',''),('typo_options_style_quote',''),('typo_options_style_span',''),('votes_separated',''),('voting_on_as','1'),('voting_on_qs','1'),('voting_on_q_page_only',''),('widgetanyw_active','1'),('wysiwyg_editor_upload_images','');
/*!40000 ALTER TABLE `qa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_pages`
--

DROP TABLE IF EXISTS `qa_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_pages`
--

LOCK TABLES `qa_pages` WRITE;
/*!40000 ALTER TABLE `qa_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_postmetas`
--

DROP TABLE IF EXISTS `qa_postmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`),
  CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_postmetas`
--

LOCK TABLES `qa_postmetas` WRITE;
/*!40000 ALTER TABLE `qa_postmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_postmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posts`
--

DROP TABLE IF EXISTS `qa_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `lastip` int(10) unsigned DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`),
  CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posts`
--

LOCK TABLES `qa_posts` WRITE;
/*!40000 ALTER TABLE `qa_posts` DISABLE KEYS */;
INSERT INTO `qa_posts` VALUES (1,'Q',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,1,NULL,NULL,1,NULL,0,0,0,835664412,3,4.20882e+010,0,'','2016-08-22 15:50:51','2016-08-22 16:21:38','T','wewsdfsfsdfsdfsfsffffffd','','html',NULL,'@'),(2,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,17098637306496578236,3475958555,NULL,NULL,0,1,-1,NULL,2,4.19013e+010,0,'','2016-08-22 17:23:42',NULL,NULL,'wererrwrwrwerwerwerwer','','','',NULL),(3,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,5429748696535929013,2047843403,NULL,NULL,1,0,1,835664412,2,4.22225e+010,0,'','2016-09-08 10:58:34',NULL,NULL,'sadfjkh sadh sad;fhasd fh sdafoihiasd','sadfjhas dfoh sadfoias dfo\'iasdh f[oi fh[]','asdf,coffee','Tarun','asdfasdf@gmail.com'),(4,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664029,NULL,NULL,0,0,0,835664029,1,4.22151e+010,0,'','2016-09-08 23:28:41',NULL,NULL,'How do you ask a question on this forum?','This is a sample question... to verify the functionality of the Ask screen.','sample,ask','Satish',NULL),(5,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:51:24',NULL,NULL,'What\'s the smartest thing you\'ve ever seen someone do?','','smart,intelligence','Madhav',NULL),(6,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:52:05',NULL,NULL,'What is the smartest thing you\'ve seen a dog do?','','smart,intelligence,dog,pets','Varun',NULL),(7,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:53:06',NULL,NULL,'What\'s the most breathtakingly beautiful thing you\'ve ever seen?','','beautiful','Raghu',NULL),(8,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:54:51',NULL,NULL,'How can honeybee make perfect hexagonal chambers without any geometrical instruments for her hive?','','bees,nature','Rahul',NULL),(9,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:56:10',NULL,NULL,'What are some great examples of \'Karma always wins‚Äô?','','life','Himanshu',NULL),(10,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.22269e+010,0,'','2016-09-09 15:57:07',NULL,NULL,'How can I learn coding to be an elite programmer with no one to guide me?','','code,smart,intelligence','Satish',NULL),(11,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,835664412,1,4.2227e+010,0,'','2016-09-09 15:59:46',NULL,NULL,'How should I fix the website which is hacked by someone?','','it,hacking,website','Jack',NULL),(12,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,1,0,1,2098643350,2,4.22434e+010,0,'','2016-09-09 16:00:08',NULL,NULL,'What are the best one-minute life hacks?','','smart,life,hack','Satish',NULL),(13,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,2067788064,3,4.22278e+010,0,'','2016-09-09 16:01:28',NULL,NULL,'Should I not download movie from internet?','','movie,entertainment','Arun',NULL),(14,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,3626404906,3,4.22278e+010,0,'','2016-09-09 16:02:29',NULL,NULL,'Secrets: What is that one secret that you can never share with anyone?','','secret','Jack',NULL),(15,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,1,0,1,2047861968,2,4.22434e+010,0,'','2016-09-09 16:04:09',NULL,NULL,'Is it possible that we can have a \"friends with benefits\" relationship in India?','','friends,life,india','Vishnu',NULL),(16,'Q',NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,2047843403,2,4.22434e+010,0,'','2016-09-09 16:04:58',NULL,NULL,'What is the craziest thing you\'ve done in public?','','crazy','Madhav',NULL),(17,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,2047843403,5,4.22286e+010,0,'','2016-09-09 16:05:37',NULL,NULL,'What was Einstein\'s viewpoint when he said \"The more I study science, the more I believe in God\"?','','einstein,smart,intelligence','Payal',NULL),(18,'A',1,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2016-09-09 16:07:22',NULL,NULL,NULL,'This question is not comprehensible! Needs to be deleted or rephrased!!',NULL,'Veer',NULL),(19,'A',16,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2546954801349069834,835664412,NULL,NULL,0,0,0,NULL,0,NULL,0,'','2016-09-09 16:09:36',NULL,NULL,NULL,'I was out with my friends and it started pouring. Everybody started to run towards shelter. Something inside me said, why follow everyone!!? I enjoyed soaking the rain and danced around like I didn\'t care!!',NULL,'Veena',NULL),(20,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,5429748696535929013,2047843403,NULL,NULL,0,0,0,2047843403,1,4.22756e+010,0,'html','2016-09-12 11:35:10',NULL,NULL,'Which websites to refer to become a better programmer','<p><strong>Lorem Ipsum</strong><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</span></p>','programming,better,online,best,programmer','Manan',NULL),(21,'Q',NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,5429748696535929013,2047843403,NULL,NULL,0,0,0,1978350572,4,4.22768e+010,0,'html','2016-09-12 11:35:11',NULL,NULL,'Which websites to refer to become a better programmer','<p><strong>Lorem Ipsum</strong><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</span></p>','programming,better,online,best,programmer','Manan',NULL),(22,'Q',NULL,NULL,NULL,NULL,NULL,1,1,23,NULL,NULL,5429748696535929013,2047843403,NULL,NULL,1,0,1,1978350572,7,4.23103e+010,0,'html','2016-09-12 11:36:29',NULL,NULL,'Which is the best WYSIWYG editor','<p><strong>Lorem Ipsum</strong><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</span></p>','editor,wysiwyg,content,typing,easy','Rahul',NULL),(23,'A',22,NULL,NULL,NULL,NULL,0,0,NULL,NULL,2,NULL,NULL,1,1978350572,1,0,1,NULL,0,NULL,0,'','2016-09-12 12:21:40','2016-09-14 22:42:36','S',NULL,'Sublime Editor',NULL,NULL,'@'),(24,'Q',NULL,1,1,NULL,NULL,0,0,NULL,NULL,1,NULL,2047843403,NULL,NULL,0,0,0,883155411,6,4.22783e+010,0,'','2016-09-12 12:30:59',NULL,NULL,'How do you add a Category to a question?','','question,category',NULL,'@');
/*!40000 ALTER TABLE `qa_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posttags`
--

DROP TABLE IF EXISTS `qa_posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`),
  CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posttags`
--

LOCK TABLES `qa_posttags` WRITE;
/*!40000 ALTER TABLE `qa_posttags` DISABLE KEYS */;
INSERT INTO `qa_posttags` VALUES (1,2,'2016-08-22 15:50:51'),(3,16,'2016-09-08 10:58:34'),(3,17,'2016-09-08 10:58:34'),(4,21,'2016-09-08 23:28:41'),(4,28,'2016-09-08 23:28:41'),(5,42,'2016-09-09 15:51:24'),(5,43,'2016-09-09 15:51:24'),(6,42,'2016-09-09 15:52:05'),(6,43,'2016-09-09 15:52:05'),(6,45,'2016-09-09 15:52:05'),(6,46,'2016-09-09 15:52:05'),(7,49,'2016-09-09 15:53:06'),(8,63,'2016-09-09 15:54:51'),(8,64,'2016-09-09 15:54:51'),(9,72,'2016-09-09 15:56:10'),(10,42,'2016-09-09 15:57:07'),(10,43,'2016-09-09 15:57:07'),(10,85,'2016-09-09 15:57:07'),(11,88,'2016-09-09 15:59:46'),(11,92,'2016-09-09 15:59:46'),(11,93,'2016-09-09 15:59:46'),(12,42,'2016-09-09 16:00:08'),(12,72,'2016-09-09 16:00:08'),(12,97,'2016-09-09 16:00:08'),(13,100,'2016-09-09 16:01:28'),(13,103,'2016-09-09 16:01:28'),(14,106,'2016-09-09 16:02:29'),(15,72,'2016-09-09 16:04:09'),(15,113,'2016-09-09 16:04:09'),(15,117,'2016-09-09 16:04:09'),(16,121,'2016-09-09 16:04:58'),(17,42,'2016-09-09 16:05:37'),(17,43,'2016-09-09 16:05:37'),(17,133,'2016-09-09 16:05:37'),(20,79,'2016-09-12 11:35:10'),(20,94,'2016-09-12 11:35:10'),(20,164,'2016-09-12 11:35:10'),(20,199,'2016-09-12 11:35:10'),(20,200,'2016-09-12 11:35:10'),(21,79,'2016-09-12 11:35:11'),(21,94,'2016-09-12 11:35:11'),(21,164,'2016-09-12 11:35:11'),(21,199,'2016-09-12 11:35:11'),(21,200,'2016-09-12 11:35:11'),(22,201,'2016-09-12 11:36:29'),(22,202,'2016-09-12 11:36:29'),(22,203,'2016-09-12 11:36:29'),(22,204,'2016-09-12 11:36:29'),(22,205,'2016-09-12 11:36:29'),(24,23,'2016-09-12 12:30:59'),(24,208,'2016-09-12 12:30:59');
/*!40000 ALTER TABLE `qa_posttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_sharedevents`
--

DROP TABLE IF EXISTS `qa_sharedevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_sharedevents`
--

LOCK TABLES `qa_sharedevents` WRITE;
/*!40000 ALTER TABLE `qa_sharedevents` DISABLE KEYS */;
INSERT INTO `qa_sharedevents` VALUES ('Q',1,1,1,NULL,1,'2016-08-22 15:50:52'),('U',1,1,1,NULL,1,'2016-08-22 15:50:52'),('Q',1,1,1,'T',1,'2016-08-22 16:21:38'),('U',1,1,1,'T',1,'2016-08-22 16:21:38'),('T',2,1,1,'T',1,'2016-08-22 16:21:38'),('Q',2,2,2,NULL,NULL,'2016-08-22 17:23:42'),('Q',3,3,3,NULL,NULL,'2016-09-08 10:58:34'),('T',16,3,3,NULL,NULL,'2016-09-08 10:58:34'),('T',17,3,3,NULL,NULL,'2016-09-08 10:58:34'),('Q',4,4,4,NULL,NULL,'2016-09-08 23:28:41'),('T',21,4,4,NULL,NULL,'2016-09-08 23:28:41'),('T',28,4,4,NULL,NULL,'2016-09-08 23:28:41'),('Q',5,5,5,NULL,NULL,'2016-09-09 15:51:25'),('T',43,5,5,NULL,NULL,'2016-09-09 15:51:25'),('T',42,5,5,NULL,NULL,'2016-09-09 15:51:25'),('Q',6,6,6,NULL,NULL,'2016-09-09 15:52:05'),('T',45,6,6,NULL,NULL,'2016-09-09 15:52:05'),('T',43,6,6,NULL,NULL,'2016-09-09 15:52:05'),('T',46,6,6,NULL,NULL,'2016-09-09 15:52:05'),('T',42,6,6,NULL,NULL,'2016-09-09 15:52:05'),('Q',7,7,7,NULL,NULL,'2016-09-09 15:53:07'),('T',49,7,7,NULL,NULL,'2016-09-09 15:53:07'),('Q',8,8,8,NULL,NULL,'2016-09-09 15:54:51'),('T',63,8,8,NULL,NULL,'2016-09-09 15:54:51'),('T',64,8,8,NULL,NULL,'2016-09-09 15:54:52'),('Q',9,9,9,NULL,NULL,'2016-09-09 15:56:11'),('T',72,9,9,NULL,NULL,'2016-09-09 15:56:11'),('Q',10,10,10,NULL,NULL,'2016-09-09 15:57:07'),('T',85,10,10,NULL,NULL,'2016-09-09 15:57:07'),('T',43,10,10,NULL,NULL,'2016-09-09 15:57:07'),('T',42,10,10,NULL,NULL,'2016-09-09 15:57:07'),('Q',11,11,11,NULL,NULL,'2016-09-09 15:59:47'),('T',93,11,11,NULL,NULL,'2016-09-09 15:59:47'),('T',92,11,11,NULL,NULL,'2016-09-09 15:59:47'),('T',88,11,11,NULL,NULL,'2016-09-09 15:59:47'),('Q',12,12,12,NULL,NULL,'2016-09-09 16:00:08'),('T',97,12,12,NULL,NULL,'2016-09-09 16:00:08'),('T',72,12,12,NULL,NULL,'2016-09-09 16:00:08'),('T',42,12,12,NULL,NULL,'2016-09-09 16:00:08'),('Q',13,13,13,NULL,NULL,'2016-09-09 16:01:29'),('T',103,13,13,NULL,NULL,'2016-09-09 16:01:29'),('T',100,13,13,NULL,NULL,'2016-09-09 16:01:29'),('Q',14,14,14,NULL,NULL,'2016-09-09 16:02:29'),('T',106,14,14,NULL,NULL,'2016-09-09 16:02:30'),('Q',15,15,15,NULL,NULL,'2016-09-09 16:04:10'),('T',113,15,15,NULL,NULL,'2016-09-09 16:04:10'),('T',117,15,15,NULL,NULL,'2016-09-09 16:04:10'),('T',72,15,15,NULL,NULL,'2016-09-09 16:04:10'),('Q',16,16,16,NULL,NULL,'2016-09-09 16:04:58'),('T',121,16,16,NULL,NULL,'2016-09-09 16:04:58'),('Q',17,17,17,NULL,NULL,'2016-09-09 16:05:38'),('T',133,17,17,NULL,NULL,'2016-09-09 16:05:38'),('T',43,17,17,NULL,NULL,'2016-09-09 16:05:38'),('T',42,17,17,NULL,NULL,'2016-09-09 16:05:38'),('Q',1,1,18,NULL,NULL,'2016-09-09 16:07:23'),('Q',16,16,19,NULL,NULL,'2016-09-09 16:09:37'),('Q',20,20,20,NULL,NULL,'2016-09-12 11:35:10'),('T',94,20,20,NULL,NULL,'2016-09-12 11:35:10'),('T',164,20,20,NULL,NULL,'2016-09-12 11:35:10'),('T',200,20,20,NULL,NULL,'2016-09-12 11:35:10'),('T',79,20,20,NULL,NULL,'2016-09-12 11:35:10'),('T',199,20,20,NULL,NULL,'2016-09-12 11:35:10'),('Q',21,21,21,NULL,NULL,'2016-09-12 11:35:11'),('T',94,21,21,NULL,NULL,'2016-09-12 11:35:11'),('T',164,21,21,NULL,NULL,'2016-09-12 11:35:11'),('T',200,21,21,NULL,NULL,'2016-09-12 11:35:11'),('T',79,21,21,NULL,NULL,'2016-09-12 11:35:11'),('T',199,21,21,NULL,NULL,'2016-09-12 11:35:11'),('Q',22,22,22,NULL,NULL,'2016-09-12 11:36:30'),('T',203,22,22,NULL,NULL,'2016-09-12 11:36:30'),('T',205,22,22,NULL,NULL,'2016-09-12 11:36:30'),('T',202,22,22,NULL,NULL,'2016-09-12 11:36:30'),('T',204,22,22,NULL,NULL,'2016-09-12 11:36:30'),('T',201,22,22,NULL,NULL,'2016-09-12 11:36:30'),('Q',22,22,23,NULL,2,'2016-09-12 12:21:41'),('U',2,22,23,NULL,2,'2016-09-12 12:21:41'),('Q',24,24,24,NULL,1,'2016-09-12 12:31:00'),('U',1,24,24,NULL,1,'2016-09-12 12:31:00'),('T',208,24,24,NULL,1,'2016-09-12 12:31:00'),('T',23,24,24,NULL,1,'2016-09-12 12:31:00'),('C',1,24,24,NULL,1,'2016-09-12 12:31:00'),('Q',22,22,23,'S',1,'2016-09-14 22:42:37'),('U',1,22,23,'S',1,'2016-09-14 22:42:37');
/*!40000 ALTER TABLE `qa_sharedevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagmetas`
--

DROP TABLE IF EXISTS `qa_tagmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagmetas`
--

LOCK TABLES `qa_tagmetas` WRITE;
/*!40000 ALTER TABLE `qa_tagmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagwords`
--

DROP TABLE IF EXISTS `qa_tagwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagwords`
--

LOCK TABLES `qa_tagwords` WRITE;
/*!40000 ALTER TABLE `qa_tagwords` DISABLE KEYS */;
INSERT INTO `qa_tagwords` VALUES (1,2),(3,16),(3,17),(4,28),(4,21),(5,42),(5,43),(6,42),(6,43),(6,45),(6,46),(7,49),(8,63),(8,64),(9,72),(10,85),(10,42),(10,43),(11,92),(11,93),(11,88),(12,42),(12,72),(12,97),(13,100),(13,103),(14,106),(15,113),(15,72),(15,117),(16,121),(17,133),(17,42),(17,43),(20,199),(20,164),(20,200),(20,94),(20,79),(21,199),(21,164),(21,200),(21,94),(21,79),(22,202),(22,201),(22,203),(22,204),(22,205),(24,23),(24,208);
/*!40000 ALTER TABLE `qa_tagwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_titlewords`
--

DROP TABLE IF EXISTS `qa_titlewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_titlewords`
--

LOCK TABLES `qa_titlewords` WRITE;
/*!40000 ALTER TABLE `qa_titlewords` DISABLE KEYS */;
INSERT INTO `qa_titlewords` VALUES (1,1),(2,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(5,35),(5,31),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,19),(6,44),(6,27),(6,31),(6,36),(6,37),(6,38),(6,40),(6,22),(6,45),(6,19),(7,35),(7,31),(7,47),(7,48),(7,49),(7,37),(7,38),(7,39),(7,40),(8,18),(8,50),(8,51),(8,52),(8,53),(8,54),(8,55),(8,56),(8,57),(8,58),(8,59),(8,60),(8,61),(8,62),(9,44),(9,65),(9,66),(9,67),(9,68),(9,33),(9,69),(9,70),(9,71),(10,18),(10,50),(10,73),(10,74),(10,75),(10,29),(10,76),(10,77),(10,78),(10,79),(10,80),(10,81),(10,82),(10,83),(10,84),(11,18),(11,86),(11,73),(11,87),(11,31),(11,88),(11,89),(11,27),(11,90),(11,91),(11,41),(12,44),(12,65),(12,31),(12,94),(12,82),(12,95),(12,72),(12,96),(13,86),(13,73),(13,98),(13,99),(13,100),(13,101),(13,102),(14,104),(14,44),(14,27),(14,105),(14,82),(14,106),(14,20),(14,50),(14,107),(14,108),(14,80),(14,109),(15,27),(15,92),(15,110),(15,105),(15,111),(15,50),(15,112),(15,22),(15,113),(15,80),(15,114),(15,115),(15,116),(15,117),(16,44),(16,27),(16,31),(16,118),(16,37),(16,38),(16,119),(16,116),(16,120),(17,44),(17,122),(17,123),(17,124),(17,125),(17,126),(17,127),(17,31),(17,128),(17,73),(17,129),(17,130),(17,131),(17,116),(17,132),(20,89),(20,161),(20,29),(20,162),(20,163),(20,22),(20,164),(20,79),(21,89),(21,161),(21,29),(21,162),(21,163),(21,22),(21,164),(21,79),(22,89),(22,27),(22,31),(22,94),(22,201),(22,202),(24,18),(24,19),(24,20),(24,207),(24,22),(24,208),(24,29),(24,23);
/*!40000 ALTER TABLE `qa_titlewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userevents`
--

DROP TABLE IF EXISTS `qa_userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userevents` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`),
  CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userevents`
--

LOCK TABLES `qa_userevents` WRITE;
/*!40000 ALTER TABLE `qa_userevents` DISABLE KEYS */;
INSERT INTO `qa_userevents` VALUES (1,'-',0,1,18,NULL,NULL,'2016-09-09 16:07:23'),(2,'-',0,22,23,'S',1,'2016-09-14 22:42:37');
/*!40000 ALTER TABLE `qa_userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfavorites`
--

DROP TABLE IF EXISTS `qa_userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfavorites` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`),
  CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfavorites`
--

LOCK TABLES `qa_userfavorites` WRITE;
/*!40000 ALTER TABLE `qa_userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfields`
--

DROP TABLE IF EXISTS `qa_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfields`
--

LOCK TABLES `qa_userfields` WRITE;
/*!40000 ALTER TABLE `qa_userfields` DISABLE KEYS */;
INSERT INTO `qa_userfields` VALUES (1,'name',NULL,1,0,NULL),(2,'location',NULL,2,0,NULL),(3,'website',NULL,3,2,NULL),(4,'about',NULL,4,1,NULL);
/*!40000 ALTER TABLE `qa_userfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlevels`
--

DROP TABLE IF EXISTS `qa_userlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlevels` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`),
  CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlevels`
--

LOCK TABLES `qa_userlevels` WRITE;
/*!40000 ALTER TABLE `qa_userlevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlimits`
--

DROP TABLE IF EXISTS `qa_userlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlimits` (
  `userid` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`),
  CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlimits`
--

LOCK TABLES `qa_userlimits` WRITE;
/*!40000 ALTER TABLE `qa_userlimits` DISABLE KEYS */;
INSERT INTO `qa_userlimits` VALUES (1,'Q',409351,1),(1,'V',409409,2),(2,'A',409350,1);
/*!40000 ALTER TABLE `qa_userlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlogins`
--

DROP TABLE IF EXISTS `qa_userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlogins` (
  `userid` int(10) unsigned NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  KEY `source` (`source`,`identifiermd5`),
  KEY `userid` (`userid`),
  CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlogins`
--

LOCK TABLES `qa_userlogins` WRITE;
/*!40000 ALTER TABLE `qa_userlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usermetas`
--

DROP TABLE IF EXISTS `qa_usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usermetas` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`),
  CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usermetas`
--

LOCK TABLES `qa_usermetas` WRITE;
/*!40000 ALTER TABLE `qa_usermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usernotices`
--

DROP TABLE IF EXISTS `qa_usernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`),
  CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usernotices`
--

LOCK TABLES `qa_usernotices` WRITE;
/*!40000 ALTER TABLE `qa_usernotices` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usernotices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userpoints`
--

DROP TABLE IF EXISTS `qa_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userpoints` (
  `userid` int(10) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userpoints`
--

LOCK TABLES `qa_userpoints` WRITE;
/*!40000 ALTER TABLE `qa_userpoints` DISABLE KEYS */;
INSERT INTO `qa_userpoints` VALUES (1,200,2,0,0,0,0,4,1,1,0,0,0,0,0,0),(2,460,0,1,0,0,1,0,0,0,0,0,2,1,0,0);
/*!40000 ALTER TABLE `qa_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userprofile`
--

DROP TABLE IF EXISTS `qa_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userprofile` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`title`),
  CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userprofile`
--

LOCK TABLES `qa_userprofile` WRITE;
/*!40000 ALTER TABLE `qa_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_users`
--

DROP TABLE IF EXISTS `qa_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) unsigned DEFAULT NULL,
  `avatarwidth` smallint(5) unsigned DEFAULT NULL,
  `avatarheight` smallint(5) unsigned DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `handle` (`handle`),
  KEY `level` (`level`),
  KEY `created` (`created`,`level`,`flags`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_users`
--

LOCK TABLES `qa_users` WRITE;
/*!40000 ALTER TABLE `qa_users` DISABLE KEYS */;
INSERT INTO `qa_users` VALUES (1,'2016-08-22 12:27:50',0,'debashis_moharana@infosys.com','admin',NULL,NULL,NULL,'ooba8cw7x8alfpfv','\"+gã–K—„†˘À[Úê‹ºáß',120,'2016-09-14 22:42:18',1978350572,'2016-09-14 22:42:56',1978350572,'','ehwdxp0w',NULL,0,0),(2,'2016-09-12 12:17:45',0,'user@xyz.com','user1',NULL,NULL,NULL,'fei6omrqavp55bln','ê3ﬁMïr/√à0˜3Æ°9',0,'2016-09-12 12:17:55',0,'2016-09-12 12:21:41',0,'livgmfw5','b9agr2du',NULL,0,0);
/*!40000 ALTER TABLE `qa_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_uservotes`
--

DROP TABLE IF EXISTS `qa_uservotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`),
  CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_uservotes`
--

LOCK TABLES `qa_uservotes` WRITE;
/*!40000 ALTER TABLE `qa_uservotes` DISABLE KEYS */;
INSERT INTO `qa_uservotes` VALUES (2,1,-1,0),(3,1,1,0),(12,1,1,0),(15,1,1,0),(22,1,1,0),(23,1,1,0);
/*!40000 ALTER TABLE `qa_uservotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgetanyw`
--

DROP TABLE IF EXISTS `qa_widgetanyw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_widgetanyw` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `pages` varchar(800) NOT NULL,
  `position` varchar(30) NOT NULL,
  `ordering` smallint(5) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`,`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgetanyw`
--

LOCK TABLES `qa_widgetanyw` WRITE;
/*!40000 ALTER TABLE `qa_widgetanyw` DISABLE KEYS */;
INSERT INTO `qa_widgetanyw` VALUES (1,'categories','all','side-high',1,'<div class=\"heading\">filter by category</div>\n					<div class=\"content\">\n						<ul class = \"category-list\">\n							<li class=\"border\"> \n								<input id=\"option1\" type=\"checkbox\">\n								<label for=\"option1\"><span><span></span></span>all categories </label>\n							</li>\n							<li class=\"border\"> \n								<input id=\"option2\" type=\"checkbox\">\n								<label for=\"option2\"><span><span></span></span>category 01  </label>\n							</li>\n							<li class=\"border\"> \n								<input id=\"option3\" type=\"checkbox\">\n								<label for=\"option3\"><span><span></span></span>category 02 </label>\n							</li>\n						</ul>\n						<a href=\"#\" class = \"category-link\">View All categories</a>\n						<form class=\"category-form\" role=\"search\">\n							<div class=\"input-group search\">\n								<input type=\"text\" class=\"form-control\" placeholder=\"Search Categories\" name=\"q\">\n								<div class=\"input-group-btn\">\n									<button class=\"btn btn-default search-btn\" type=\"submit\">\n										<i class=\"glyphicon glyphicon-search\"></i>\n									</button>\n								</div>\n							</div>\n						</form>\n					</div>');
/*!40000 ALTER TABLE `qa_widgetanyw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgets`
--

DROP TABLE IF EXISTS `qa_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgets`
--

LOCK TABLES `qa_widgets` WRITE;
/*!40000 ALTER TABLE `qa_widgets` DISABLE KEYS */;
INSERT INTO `qa_widgets` VALUES (5,'ST',1,'all','Activity Count'),(6,'ST',2,'all','Tag Cloud');
/*!40000 ALTER TABLE `qa_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_words`
--

DROP TABLE IF EXISTS `qa_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_words`
--

LOCK TABLES `qa_words` WRITE;
/*!40000 ALTER TABLE `qa_words` DISABLE KEYS */;
INSERT INTO `qa_words` VALUES (1,'wewsdfsfsdfsdfsfsffffffd',1,0,0,0),(2,'html',0,0,1,1),(3,'wererrwrwrwerwerwerwer',1,0,0,0),(4,'sadfjkh',1,0,0,0),(5,'sadh',1,0,0,0),(6,'sad',1,0,0,0),(7,'fhasd',1,0,0,0),(8,'fh',1,1,0,0),(9,'sdafoihiasd',1,0,0,0),(10,'sadfjhas',0,1,0,0),(11,'dfoh',0,1,0,0),(12,'sadfoias',0,1,0,0),(13,'dfoiasdh',0,1,0,0),(14,'f',0,1,0,0),(15,'oi',0,1,0,0),(16,'asdf',0,0,1,1),(17,'coffee',0,0,1,1),(18,'how',5,0,0,0),(19,'do',4,0,0,0),(20,'you',3,0,0,0),(21,'ask',1,1,1,1),(22,'a',6,4,0,0),(23,'question',2,2,1,1),(24,'on',1,0,0,0),(25,'this',1,2,0,0),(26,'forum',1,0,0,0),(27,'is',6,5,0,0),(28,'sample',0,1,1,1),(29,'to',4,6,0,0),(30,'verify',0,1,0,0),(31,'the',8,5,0,0),(32,'functionality',0,1,0,0),(33,'of',1,4,0,0),(34,'screen',0,1,0,0),(35,'whats',2,0,0,0),(36,'smartest',2,0,0,0),(37,'thing',4,0,0,0),(38,'youve',4,0,0,0),(39,'ever',2,3,0,0),(40,'seen',3,0,0,0),(41,'someone',2,0,0,0),(42,'smart',0,0,5,5),(43,'intelligence',0,0,4,4),(44,'what',6,0,0,0),(45,'dog',1,0,1,1),(46,'pets',0,0,1,1),(47,'most',1,0,0,0),(48,'breathtakingly',1,0,0,0),(49,'beautiful',1,0,1,1),(50,'can',4,0,0,0),(51,'honeybee',1,0,0,0),(52,'make',1,3,0,0),(53,'perfect',1,0,0,0),(54,'hexagonal',1,0,0,0),(55,'chambers',1,0,0,0),(56,'without',1,0,0,0),(57,'any',1,0,0,0),(58,'geometrical',1,0,0,0),(59,'instruments',1,0,0,0),(60,'for',1,0,0,0),(61,'her',1,0,0,0),(62,'hive',1,0,0,0),(63,'bees',0,0,1,1),(64,'nature',0,0,1,1),(65,'are',2,0,0,0),(66,'some',1,0,0,0),(67,'great',1,0,0,0),(68,'examples',1,0,0,0),(69,'karma',1,0,0,0),(70,'always',1,0,0,0),(71,'wins',1,0,0,0),(72,'life',1,0,3,3),(73,'i',4,1,0,0),(74,'learn',1,0,0,0),(75,'coding',1,0,0,0),(76,'be',1,1,0,0),(77,'an',1,3,0,0),(78,'elite',1,0,0,0),(79,'programmer',3,0,2,2),(80,'with',3,1,0,0),(81,'no',1,0,0,0),(82,'one',3,0,0,0),(83,'guide',1,0,0,0),(84,'me',1,1,0,0),(85,'code',0,0,1,1),(86,'should',2,0,0,0),(87,'fix',1,0,0,0),(88,'website',1,0,1,1),(89,'which',4,0,0,0),(90,'hacked',1,0,0,0),(91,'by',1,0,0,0),(92,'it',1,4,1,1),(93,'hacking',0,0,1,1),(94,'best',2,0,2,2),(95,'minute',1,0,0,0),(96,'hacks',1,0,0,0),(97,'hack',0,0,1,1),(98,'not',1,4,0,0),(99,'download',1,0,0,0),(100,'movie',1,0,1,1),(101,'from',1,0,0,0),(102,'internet',1,0,0,0),(103,'entertainment',0,0,1,1),(104,'secrets',1,0,0,0),(105,'that',2,0,0,0),(106,'secret',1,0,1,1),(107,'never',1,0,0,0),(108,'share',1,0,0,0),(109,'anyone',1,0,0,0),(110,'possible',1,0,0,0),(111,'we',1,0,0,0),(112,'have',1,0,0,0),(113,'friends',1,1,1,1),(114,'benefits',1,0,0,0),(115,'relationship',1,0,0,0),(116,'in',3,0,0,0),(117,'india',1,0,1,1),(118,'craziest',1,0,0,0),(119,'done',1,0,0,0),(120,'public',1,0,0,0),(121,'crazy',0,0,1,1),(122,'was',1,1,0,0),(123,'einsteins',1,0,0,0),(124,'viewpoint',1,0,0,0),(125,'when',1,3,0,0),(126,'he',1,0,0,0),(127,'said',1,1,0,0),(128,'more',1,0,0,0),(129,'study',1,0,0,0),(130,'science',1,0,0,0),(131,'believe',1,0,0,0),(132,'god',1,0,0,0),(133,'einstein',0,0,1,1),(134,'comprehensible',0,1,0,0),(135,'needs',0,1,0,0),(136,'deleted',0,1,0,0),(137,'or',0,1,0,0),(138,'rephrased',0,1,0,0),(139,'out',0,1,0,0),(140,'my',0,1,0,0),(141,'and',0,4,0,0),(142,'started',0,1,0,0),(143,'pouring',0,1,0,0),(144,'everybody',0,1,0,0),(145,'run',0,1,0,0),(146,'towards',0,1,0,0),(147,'shelter',0,1,0,0),(148,'something',0,1,0,0),(149,'inside',0,1,0,0),(150,'why',0,1,0,0),(151,'follow',0,1,0,0),(152,'everyone',0,1,0,0),(153,'enjoyed',0,1,0,0),(154,'soaking',0,1,0,0),(155,'rain',0,1,0,0),(156,'danced',0,1,0,0),(157,'around',0,1,0,0),(158,'like',0,1,0,0),(159,'didnt',0,1,0,0),(160,'care',0,1,0,0),(161,'websites',2,0,0,0),(162,'refer',2,0,0,0),(163,'become',2,0,0,0),(164,'better',2,0,2,2),(165,'lorem',0,3,0,0),(166,'ipsum',0,3,0,0),(167,'simply',0,3,0,0),(168,'dummy',0,3,0,0),(169,'text',0,3,0,0),(170,'printing',0,3,0,0),(171,'typesetting',0,3,0,0),(172,'industry',0,3,0,0),(173,'has',0,3,0,0),(174,'been',0,3,0,0),(175,'industrys',0,3,0,0),(176,'standard',0,3,0,0),(177,'since',0,3,0,0),(178,'1500s',0,3,0,0),(179,'unknown',0,3,0,0),(180,'printer',0,3,0,0),(181,'took',0,3,0,0),(182,'galley',0,3,0,0),(183,'type',0,3,0,0),(184,'scrambled',0,3,0,0),(185,'specimen',0,3,0,0),(186,'book',0,3,0,0),(187,'survived',0,3,0,0),(188,'only',0,3,0,0),(189,'five',0,3,0,0),(190,'centuries',0,3,0,0),(191,'but',0,3,0,0),(192,'also',0,3,0,0),(193,'leap',0,3,0,0),(194,'into',0,3,0,0),(195,'electronic',0,3,0,0),(196,'remaining',0,3,0,0),(197,'essentially',0,3,0,0),(198,'unchanged',0,3,0,0),(199,'programming',0,0,2,2),(200,'online',0,0,2,2),(201,'wysiwyg',1,0,1,1),(202,'editor',1,1,1,1),(203,'content',0,0,1,1),(204,'typing',0,0,1,1),(205,'easy',0,0,1,1),(206,'sublime',0,1,0,0),(207,'add',1,0,0,0),(208,'category',1,0,1,1);
/*!40000 ALTER TABLE `qa_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-15 15:46:14
