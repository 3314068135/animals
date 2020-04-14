/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - animals
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`animals` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `animals`;

/*Table structure for table `animal` */

DROP TABLE IF EXISTS `animal`;

CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动物id',
  `animal_name` varchar(255) DEFAULT NULL COMMENT '动物名',
  `animal_name_en` varchar(255) DEFAULT NULL COMMENT '动物name en',
  `country_id` int(11) DEFAULT NULL COMMENT '国家id',
  `geography_id` int(11) DEFAULT NULL COMMENT '地理id',
  `animal_cf_id` int(11) DEFAULT NULL COMMENT '动物类别id',
  `animal_img` varchar(255) DEFAULT NULL COMMENT '动物配图',
  `animal_summary` varchar(255) DEFAULT '' COMMENT '动物概括',
  `animal_description` varchar(255) DEFAULT NULL COMMENT '外形特征',
  `animal_habit` varchar(255) DEFAULT NULL COMMENT '生态习性',
  `animal_gb` varchar(255) DEFAULT NULL COMMENT '生长繁殖',
  `animal_distribution` varchar(255) DEFAULT NULL COMMENT '地理分布',
  `animal_dp` varchar(255) DEFAULT NULL COMMENT '进化过程',
  `animal_living` varchar(255) DEFAULT NULL COMMENT '生存状况',
  PRIMARY KEY (`animal_id`),
  KEY `FK_animal_country` (`country_id`),
  KEY `FK_animal_cf` (`animal_cf_id`),
  KEY `FK_animal_geography` (`geography_id`),
  CONSTRAINT `FK_animal_geography` FOREIGN KEY (`geography_id`) REFERENCES `geography` (`geography_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_animal_cf` FOREIGN KEY (`animal_cf_id`) REFERENCES `classification` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_animal_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `animal` */

/*Table structure for table `classification` */

DROP TABLE IF EXISTS `classification`;

CREATE TABLE `classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `cf_name` varchar(255) DEFAULT NULL COMMENT '类别名',
  `cf_name_en` varchar(255) DEFAULT NULL COMMENT '类别名 english',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `classification` */

insert  into `classification`(`id`,`cf_name`,`cf_name_en`) values (1,'哺乳动物','mammal'),(2,'鸟类','birds'),(3,'鱼类','fish'),(4,'两栖动物','amphibians'),(5,'爬行动物','reptile'),(6,'无脊椎动物','invertebrates');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '国家id',
  `country_name` varchar(255) DEFAULT NULL COMMENT '国家name',
  `cotuntry_name_en` varchar(255) DEFAULT NULL COMMENT '国家name english',
  `country_img` varchar(255) DEFAULT NULL,
  `country_introduce` varchar(255) DEFAULT NULL COMMENT '国家简述',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

insert  into `country`(`country_id`,`country_name`,`cotuntry_name_en`,`country_img`,`country_introduce`) values (1,'日本','Japan',NULL,'日本国，是位于东亚的一个岛屿国家，由日本列岛和6千8百多个小岛组成，国土面积：377,960平方公里（世界第63名）。日本国土南北狭长，四季分明，也是一个多山国家。深受黑潮、亲潮等洋流影响，海洋性气候明显，一年四季温差很大。日本国土以温带季风气候为主。国歌：《君之代》。首都：东京都'),(2,'中国','China',NULL,'中华人民共和国，是一个位于东亚的社会主义国家。国土面积：9,634,057 平方公里（世界第3/4名）。地势西高东低，分为三级阶梯。珠穆朗玛峰，海拔8844.43米，是世界第一高峰。长江为中国第一大河，全长6380公里，长度及径流量排名世界第三。其他主要河流有黄河、黑龙江、珠江、淮河、松花江等。国歌：《义勇军进行曲》。首都：北京市'),(3,'泰国','Thailand',NULL,'泰王国，是东南亚的一个国家，国土面积：513,120平方公里（世界第51名）。国境大部份为低缓的山地和高原，地形多变。大部分地区属于热带季风气候。常年温度不下摄氏18℃，平均年降水量约1000毫米。国歌：《泰王国歌》。首都：曼谷'),(4,'西班牙','Spain',NULL,'西班牙王国，位于欧洲西南部。国土面积：504,030平方公里（世界第51名）。西班牙位于伊比利亚半岛上。地形多山，梅塞塔高原是构成高原与多山地的主干，西班牙的最高峰是穆拉森山，海拔3,718米。地中海式气候，阳光充足，春秋多雨。国歌：《皇家进行曲》。首都：马德里'),(5,'澳大利亚','Australia',NULL,'澳大利亚联邦，位于南半球、东半球，介于南太平洋和印度洋之间，拥有澳大利亚大陆和塔斯马尼亚等岛屿。国土面积：7,692,024平方公里（世界第6名）。大部分是半干旱或荒漠地带，但生态环境极为丰富，包括从高地的石南荒原到热带的雨林，为全球17个超级生物多样性国家之一。国歌：《前进的澳大利亚》。首都：堪培拉'),(6,'俄罗斯','Russian',NULL,'俄罗斯联邦，是苏联及其最大加盟共和国俄罗斯苏维埃联邦社会主义共和国的继承国，跨越了欧亚大陆的北部大部分地区，地势及气候变化多端，大部分地区处于北温带和北寒带，气候多样，以大陆性气候为主。国土面积：17,098,242平方公里（世界第1名）。国歌：《俄罗斯联邦国歌》。首都：莫斯科'),(7,'法国','France',NULL,'法兰西共和国，是一个本土位于西欧并具有海外大区及领地的单一主权制国家，国土面积：本土551,695平方公里（第50位）。大部分地区属于阔叶林温带海洋性气候，冬温夏凉，常年有雨，东部和山地大陆性较显著，南部属于地中海气候。国歌：《马赛曲》。首都：巴黎'),(8,'美国','America',NULL,'美利坚合众国，位于北美洲中部，国土面积：9,826,675平方公里（世界第3或4名）。由于幅员辽阔和众多的地理特征，美国几乎有着世界上所有的气候类型。有超过17,000种本土的植物和树种，光是加利福尼亚州就有5000种，从热带地区至北极都有植物分布，美国的植物是世界上最多样化的。国歌：《星条旗》。首都：华盛顿哥伦比亚特区'),(9,'瑞士','Switzerland',NULL,'瑞士联邦，为西欧国家之一，划分为26个州。国土面积：41,284平方公里（世界第136名）。高耸的阿尔卑斯山脉横贯瑞士中南部，占全国面积的60%。瑞士山间谷地气候温和，高山较寒冷，一般属温带气候。瑞士境内的冰川面积达1,063平方公里。国歌：《瑞士诗篇》。首都：伯尔尼'),(10,'南非','South Africa',NULL,'南非共和国，是一个位于非洲南部的国家，有“彩虹之国”之誉。南非是世界上独一无二的拥有三个首都的国家。国土面积：1,219,912平方公里（世界第24名）。西部沿海干燥无雨。东部属副热带湿润气候，西南部属地中海型气候。国歌：《南非国歌》。行政首都：比勒陀利亚；司法首都：布隆方丹；立法首都：开普敦'),(11,'赞比亚','Zambia',NULL,'赞比亚共和国，是中部非洲的一个内陆国家。国土面积：752,614平方公里（世界第38名）。大部份土地处于海拔1000－1500米的高原上，最高点海拔1774米，赞比西河是第一大河，横贯南部边境，有著名的莫西奥图尼亚瀑布（维多利亚瀑布）。全境基本属于热带草原气候。国歌：《独立高歌赞比亚，自豪又自由》。首都：卢萨卡');

/*Table structure for table `geography` */

DROP TABLE IF EXISTS `geography`;

CREATE TABLE `geography` (
  `geography_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '地理id',
  `geography_name` varchar(255) DEFAULT NULL COMMENT '地理name',
  `geography_name_en` varchar(255) DEFAULT NULL COMMENT '地理name english',
  PRIMARY KEY (`geography_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `geography` */

insert  into `geography`(`geography_id`,`geography_name`,`geography_name_en`) values (1,'北美洲','North America'),(2,'南美洲','South America'),(3,'欧洲','Europe'),(4,'非洲','Africa'),(5,'亚洲','Asia'),(6,'大洋洲','Oceanica');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `news_title` varchar(255) DEFAULT NULL COMMENT '新闻标题',
  `news_info` varchar(255) DEFAULT NULL COMMENT '新闻内容',
  `news_date` datetime DEFAULT NULL COMMENT '新闻日期',
  `news_img` varchar(255) DEFAULT NULL COMMENT '新闻配图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
