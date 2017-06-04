/*
Navicat MySQL Data Transfer

Source Server         : zl
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : db

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-03-08 17:35:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `price_list`
-- ----------------------------
DROP TABLE IF EXISTS `price_list`;
CREATE TABLE `price_list` (
  `price_list` int(128) NOT NULL AUTO_INCREMENT,
  `price_type` varchar(16) DEFAULT NULL,
  `price` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`price_list`),
  CONSTRAINT `price_list` FOREIGN KEY (`price_list`) REFERENCES `ticket` (`price_list`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_list
-- ----------------------------
INSERT INTO `price_list` VALUES ('1', 'G', '134');

-- ----------------------------
-- Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `train_no` varchar(16) NOT NULL,
  `uid` int(255) NOT NULL,
  `train_type` varchar(8) NOT NULL,
  `start_station` varchar(16) NOT NULL,
  `start_station_type` varchar(16) DEFAULT NULL,
  `end_station` varchar(16) NOT NULL,
  `end_station_type` varchar(16) DEFAULT NULL,
  `start_time` varchar(16) DEFAULT NULL,
  `end_time` varchar(16) DEFAULT NULL,
  `run_time` varchar(16) DEFAULT NULL,
  `price_list` int(128) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`train_no`),
  KEY `price_list` (`price_list`),
  KEY `Uid` (`uid`),
  CONSTRAINT `Uid` FOREIGN KEY (`uid`) REFERENCES `userinfo` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ticket` VALUES ('23', '2', '23', '23', '34', '23', '24', '23', '23', '23', '2');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `upass` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '1', '1');
INSERT INTO `userinfo` VALUES ('2', 'asd', 'asd');
INSERT INTO `userinfo` VALUES ('4', 'bb', '123');
