/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : nier

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-11-20 16:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `b_banner`
-- ----------------------------
DROP TABLE IF EXISTS `b_banner`;
CREATE TABLE `b_banner` (
  `id` char(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `width` int(5) NOT NULL DEFAULT '0',
  `height` int(5) NOT NULL DEFAULT '0',
  `valid_num` int(5) NOT NULL DEFAULT '0',
  `autoplay` tinyint(4) NOT NULL,
  `autoplay_interval` int(5) DEFAULT '5',
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `b_banner_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_banner_item`;
CREATE TABLE `b_banner_item` (
  `id` char(36) NOT NULL,
  `banner_id` char(36) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `image_path` varchar(100) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sequence` int(5) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_banner_item
-- ----------------------------

-- ----------------------------
-- Table structure for `b_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `subcategory_id` char(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `member_count` int(11) NOT NULL DEFAULT '0',
  `post_count` int(11) NOT NULL DEFAULT '0',
  `owner_id` char(36) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_group
-- ----------------------------

-- ----------------------------
-- Table structure for `b_photo`
-- ----------------------------
DROP TABLE IF EXISTS `b_photo`;
CREATE TABLE `b_photo` (
  `id` char(36) NOT NULL,
  `album_id` char(36) NOT NULL,
  `path` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sequence` int(11) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `like_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_photo
-- ----------------------------

-- ----------------------------
-- Table structure for `b_photo_album`
-- ----------------------------
DROP TABLE IF EXISTS `b_photo_album`;
CREATE TABLE `b_photo_album` (
  `id` char(36) NOT NULL,
  `title` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `sequence` int(5) NOT NULL DEFAULT '1',
  `photo_count` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_photo_album
-- ----------------------------

-- ----------------------------
-- Table structure for `b_post`
-- ----------------------------
DROP TABLE IF EXISTS `b_post`;
CREATE TABLE `b_post` (
  `id` char(36) NOT NULL,
  `group_id` char(36) NOT NULL,
  `thread_id` char(36) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT '1',
  `reply_count` int(11) NOT NULL DEFAULT '0',
  `like_count` int(11) NOT NULL DEFAULT '0',
  `dislike_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_post
-- ----------------------------

-- ----------------------------
-- Table structure for `b_post_reply`
-- ----------------------------
DROP TABLE IF EXISTS `b_post_reply`;
CREATE TABLE `b_post_reply` (
  `id` char(36) NOT NULL,
  `group_id` char(36) NOT NULL,
  `thread_id` char(36) NOT NULL,
  `target_id` char(36) NOT NULL,
  `target_user_id` char(36) NOT NULL,
  `content` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_post_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `b_post_thread`
-- ----------------------------
DROP TABLE IF EXISTS `b_post_thread`;
CREATE TABLE `b_post_thread` (
  `id` char(36) NOT NULL,
  `group_id` char(36) NOT NULL,
  `title` varchar(30) NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `reply_count` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_post_thread
-- ----------------------------

-- ----------------------------
-- Table structure for `d_group_category`
-- ----------------------------
DROP TABLE IF EXISTS `d_group_category`;
CREATE TABLE `d_group_category` (
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
-- Records of d_group_category
-- ----------------------------

-- ----------------------------
-- Table structure for `d_group_subcategory`
-- ----------------------------
DROP TABLE IF EXISTS `d_group_subcategory`;
CREATE TABLE `d_group_subcategory` (
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
-- Records of d_group_subcategory
-- ----------------------------

-- ----------------------------
-- Table structure for `d_photo_album_category`
-- ----------------------------
DROP TABLE IF EXISTS `d_photo_album_category`;
CREATE TABLE `d_photo_album_category` (
  `id` char(36) NOT NULL,
  `name` varchar(10) NOT NULL,
  `user_id` char(36) NOT NULL,
  `sequence` int(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_photo_album_category
-- ----------------------------

-- ----------------------------
-- Table structure for `s_menu`
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu` (
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
-- Records of s_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
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
  `create_user` char(36) NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` char(36) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------