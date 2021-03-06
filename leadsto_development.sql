-- MySQL dump 10.13  Distrib 5.6.23, for osx10.10 (x86_64)
--
-- Host: localhost    Database: leadsto_development
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `property` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `founded_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `products` text COLLATE utf8_unicode_ci,
  `team` text COLLATE utf8_unicode_ci,
  `stage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `worktime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'某知名网上菜市场 O2O 平台','科技有限公司是一家基于互联网技术的现代生鲜服务供应商，提供高品质净菜产品和鲜果。我厨是由国内领先的餐饮连锁集团—原微集团和国内知名的投资机构—复星谱润资本和新天域资本联合投资，拥有30000平米国内最大中央厨房的生鲜电商平台，通过3年多供应链体系的建设和夯实，于2015年3月9日在上海发布正式上线。','私营企业','100-500人','上海','2014','网上菜市场 互联网 全品类生鲜',NULL,'2015-11-26 12:48:34','2015-11-26 12:48:34','网上菜市场，通过手机APP销售1000多种生鲜食材，并且自建冷链物流送菜到家，不仅有海鲜牛排、进口水果等中高端生鲜，还有青菜、猪肉等老百姓餐桌必不可少的普通生鲜，以及免洗、免切、免配的半成品净菜，是一家真正的全品类生鲜电商。','XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK','A 轮','作五休二','我厨（上海）科技有限公司'),(2,'某知名弹幕视频分享网站','中国大陆一个动画、游戏相关的弹幕视频分享网站，网站最大的特点是悬浮于视频上方的实时评论功能。是中国大陆第二家提供这样功能的网站。','私营企业','100-500人','上海','2010','视频 弹幕 游戏 动画 分享 新番 日本动画 会员制',NULL,'2015-11-26 12:48:34','2015-11-26 12:48:34','采用会员制，大部分视频会员与游客都可以观看，但部分视频只有会员才可以观看（这些视频常被称为“只有会员才知道的世界”）。以前只有会员才可以发送弹幕表达自己的见解和发布评论，游客也能发送部分弹幕。使用数据库方式储存弹幕，每个人在发送弹幕时IP与会员ID(如果已经登陆了的话)将会被后台记录，由单条弹幕可追查出发送该弹幕的会员ID或IP。','XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK','B 轮','作五休二','上海幻电信息科技有限公司');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'王先生','1000000000',NULL,'','','','2015-11-26 14:01:22','2015-11-26 14:01:22'),(2,'vincent wang','100000000',NULL,'','','','2015-11-26 14:02:45','2015-11-26 14:02:45'),(3,'王先生','100000000',NULL,'','','','2015-11-26 14:03:20','2015-11-26 14:03:20'),(4,'www','7777',NULL,'','','','2015-11-26 14:04:41','2015-11-26 14:04:41');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `salary_top` int(11) DEFAULT NULL,
  `salary_bottom` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age_top` int(11) DEFAULT NULL,
  `age_bottom` int(11) DEFAULT NULL,
  `keyword` text COLLATE utf8_unicode_ci,
  `recommended` int(11) DEFAULT NULL,
  `interviewee` int(11) DEFAULT NULL,
  `entry` int(11) DEFAULT NULL,
  `remaining` int(11) DEFAULT NULL,
  `demanding` int(11) DEFAULT NULL,
  `responsibility` text COLLATE utf8_unicode_ci,
  `requirement` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `consultant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_positions_on_company_id` (`company_id`) USING BTREE,
  CONSTRAINT `fk_rails_9d634cdbb9` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Java 工程师',8,50,30,'上海','浦东新区','松林路111号','技术部','技术总监','学历不限','经验不限',0,0,'php java',0,0,0,1,1,'1、充分理解客户需求，完成客户岗位职责的分析；\n2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;\n3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；\n4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；\n5、协助双方进行薪资谈判及后续跟踪服务；\n6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； ','1、大专学历及以上，\n2、个性成熟、有亲和力，性格开朗、乐观积极；\n3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；\n4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；\n5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；\n6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。','上线',NULL,'Lisa','2015-11-26 12:48:34','2015-11-26 12:48:34',1),(2,'PHP 工程师',8,50,30,'上海','浦东新区','松林路111号','技术部','技术总监','学历不限','经验不限',0,0,'php java',0,0,0,1,1,'1、充分理解客户需求，完成客户岗位职责的分析；\n2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;\n3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；\n4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；\n5、协助双方进行薪资谈判及后续跟踪服务；\n6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； ','1、大专学历及以上，\n2、个性成熟、有亲和力，性格开朗、乐观积极；\n3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；\n4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；\n5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；\n6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。','上线',NULL,'Arnold','2015-11-26 12:48:34','2015-11-26 12:48:34',1),(3,'系统工程师',8,50,30,'上海','浦东新区','松林路111号','技术部','技术总监','学历不限','经验不限',0,0,'php java',0,0,0,1,1,'1、充分理解客户需求，完成客户岗位职责的分析；\n2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;\n3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；\n4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；\n5、协助双方进行薪资谈判及后续跟踪服务；\n6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； ','1、大专学历及以上，\n2、个性成熟、有亲和力，性格开朗、乐观积极；\n3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；\n4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；\n5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；\n6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。','上线',NULL,'Arnold','2015-11-26 12:48:34','2015-11-26 12:48:34',2);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151006131215'),('20151011084359'),('20151018064456'),('20151109093623'),('20151109102948'),('20151116145726'),('20151121080142'),('20151121092515'),('20151121154746'),('20151125132738');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` text COLLATE utf8_unicode_ci,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marriage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hometown` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `isadmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_city` (`city`) USING BTREE,
  KEY `index_users_on_email` (`email`) USING BTREE,
  KEY `index_users_on_isadmin` (`isadmin`) USING BTREE,
  KEY `index_users_on_name` (`name`) USING BTREE,
  KEY `index_users_on_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'18117209130','Lisa','lisa@leadsto.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2a$10$YUfY6H5jjy86R/7H0p4cP.s2Hwwwxj9EtplBN15HY2w53ZmTsBPxi','2015-11-26 12:48:34','2015-11-26 12:48:34',1),(2,'18721668737','Arnold','arnold@leadsto.cn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2a$10$E1WVSMcTn827T/nf2.8m9.i3FgmXsP68eUWgXtmEz92youI3YOeqy','2015-11-26 12:48:34','2015-11-26 12:48:34',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-28 13:26:49
