/*
Navicat MySQL Data Transfer

Source Server         : JspUsers
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : experiment

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-06-06 09:40:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `plateid` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDC17DDF4A176AE69` (`postid`),
  KEY `FKDC17DDF476827864` (`userid`),
  KEY `FKDC17DDF4EDDC7082` (`plateid`),
  CONSTRAINT `FKDC17DDF476827864` FOREIGN KEY (`userid`) REFERENCES `usertable` (`id`),
  CONSTRAINT `FKDC17DDF4A176AE69` FOREIGN KEY (`postid`) REFERENCES `posts` (`id`),
  CONSTRAINT `FKDC17DDF4EDDC7082` FOREIGN KEY (`plateid`) REFERENCES `postplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `postplate`
-- ----------------------------
DROP TABLE IF EXISTS `postplate`;
CREATE TABLE `postplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postplate
-- ----------------------------
INSERT INTO `postplate` VALUES ('1', 'Android交流');
INSERT INTO `postplate` VALUES ('2', 'Java高级技术交流');
INSERT INTO `postplate` VALUES ('3', '茶楼');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(2) NOT NULL DEFAULT '0',
  `plateid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `postdate` varchar(1000) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65E7BD3EDDC7082` (`plateid`),
  KEY `FK65E7BD376827864` (`userid`),
  CONSTRAINT `FK65E7BD376827864` FOREIGN KEY (`userid`) REFERENCES `usertable` (`id`),
  CONSTRAINT `FK65E7BD3EDDC7082` FOREIGN KEY (`plateid`) REFERENCES `postplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for `usertable`
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `rank` int(1) unsigned zerofill DEFAULT '0',
  `plateid` int(11) DEFAULT '0',
  `head` varchar(500) DEFAULT 'no',
  `sex` varchar(1) DEFAULT '男',
  `qq` varchar(255) DEFAULT NULL,
  `phonenum` varchar(11) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES ('1', 'anonymous', 'anonymous', '0', '0', 'no', '男', null, null, null);
INSERT INTO `usertable` VALUES ('2', 'admin', 'admin', '1', '0', 'no', '男', null, null, null);
