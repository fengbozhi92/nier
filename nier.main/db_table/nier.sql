/*
Navicat MySQL Data Transfer

Source Server         : person
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : nier

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-11-05 22:48:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group_category
-- ----------------------------
DROP TABLE IF EXISTS `group_category`;
CREATE TABLE `group_category` (
  `id` char(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sequence` int(11) DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` char(36) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `group_subcategory`;
CREATE TABLE `group_subcategory` (
  `id` char(36) NOT NULL,
  `group_category_id` char(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` char(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `depth` tinyint(4) NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` char(36) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `roles` smallint(4) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(50) DEFAULT NULL,
  `residence` varchar(50) DEFAULT NULL,
  `marriage` tinyint(4) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `worked` tinyint(4) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `sina_microblog` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fans_count` int(11) DEFAULT '0',
  `followed_count` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `create_time` datetime NOT NULL,
  `create_user_id` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `roles_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`) USING BTREE,
  KEY `index_roles_id` (`roles_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
