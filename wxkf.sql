/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : wxkf

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-01-12 17:26:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL auto_increment,
  `adminname` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `power` int(1) default NULL,
  `lock` int(1) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('4', 'admin', 'admin', '0', null);
INSERT INTO `admin` VALUES ('5', '2', '2', '0', null);
INSERT INTO `admin` VALUES ('6', '3', '3', '0', null);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `openid` varchar(30) NOT NULL,
  `company_email` varchar(40) default NULL,
  `company_password` varchar(20) default NULL,
  `company_time` bigint(20) default NULL,
  `company_username` varchar(20) default NULL,
  `status` int(11) default '0',
  PRIMARY KEY  (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '750229099@qq.com', '1', '1480247546583', '1', '1');
INSERT INTO `company` VALUES ('o6yKmw8QEd6vVrud2ZpBBMLG8z3Y1', '750229099@qq.com', 'gsc19941024', '1480247546583', '17853593651', '1');

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo` (
  `openid` varchar(30) NOT NULL,
  `companyinfo_about` longtext,
  `companyinfo_address` varchar(50) default NULL,
  `companyinfo_city` varchar(20) default NULL,
  `companyinfo_email` varchar(30) default NULL,
  `companyinfo_img` varchar(100) default NULL,
  `companyinfo_name` varchar(30) default NULL,
  `companyinfo_nickname` varchar(20) default NULL,
  `companyinfo_size` varchar(10) default NULL,
  `companyinfo_status` int(11) default NULL,
  `companyinfo_style` varchar(20) default NULL,
  `companyinfo_tel` varchar(20) default NULL,
  `companyinfo_type` varchar(20) default NULL,
  `companyinfo_url` varchar(50) default NULL,
  `companyinfo_pjob` varchar(20) default NULL,
  `companyinfo_certificates` varchar(50) default NULL,
  `companyinfo_copy` varchar(50) default NULL,
  `companyinfo_legal_person` varchar(20) default NULL,
  `companyinfo_uptime` bigint(20) default NULL,
  PRIMARY KEY  (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyinfo
-- ----------------------------
INSERT INTO `companyinfo` VALUES ('o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '哈哈', '烟台芝罘区鲁东大学', '芝罘区', '750229099@qq.com', '1', '阿里巴巴', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `companyinfo` VALUES ('o6yKmw8QEd6vVrud2ZpBBMLG8z3Y1', '哈哈', '烟台芝罘区鲁东大学', '芝罘区', '750229099@qq.com', null, '百度', null, null, '1', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for faceback
-- ----------------------------
DROP TABLE IF EXISTS `faceback`;
CREATE TABLE `faceback` (
  `faceback_id` int(11) NOT NULL auto_increment,
  `faceback_tel` varchar(20) default NULL,
  `faceback_text` varchar(255) default NULL,
  `faceback_time` bigint(20) default NULL,
  `openid` varchar(30) default NULL,
  PRIMARY KEY  (`faceback_id`),
  UNIQUE KEY `faceback_id` (`faceback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faceback
-- ----------------------------

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` bigint(20) NOT NULL auto_increment,
  `job_education` varchar(20) default NULL,
  `job_label` varchar(100) default NULL,
  `job_limittime` varchar(20) default NULL,
  `job_name` varchar(20) default NULL,
  `job_recivenum` varchar(20) default NULL,
  `job_require` varchar(20) default NULL,
  `job_salary` int(11) default NULL,
  `job_style` varchar(20) default NULL,
  `job_time` bigint(20) default NULL,
  `job_type` varchar(20) default NULL,
  `company_id` varchar(30) default NULL,
  `job_delete` int(11) default NULL,
  PRIMARY KEY  (`job_id`),
  UNIQUE KEY `job_id` (`job_id`),
  KEY `FK1239DF11B3DBE` (`company_id`),
  CONSTRAINT `FK1239DF11B3DBE` FOREIGN KEY (`company_id`) REFERENCES `companyinfo` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('18', '1', '1', '1', '1', '1', '1', '1', '123', '1480839020936', '1', 'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '0');
INSERT INTO `job` VALUES ('20', '1', '1', '1', '1', '1', '1', '1', '1', '1480839828024', '1', 'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '1');
INSERT INTO `job` VALUES ('21', '本科', '好,帅,不错,可以', '5', 'java工程师1', '10', '哈哈哈', '3000', '全职', '1480842245088', 'IT', 'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '1');
INSERT INTO `job` VALUES ('22', '1', '1', '1', '123', '123', '1', '1', '1', '1480842354748', '1', 'o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', '0');

-- ----------------------------
-- Table structure for jobcollection
-- ----------------------------
DROP TABLE IF EXISTS `jobcollection`;
CREATE TABLE `jobcollection` (
  `jobCollection_id` bigint(20) NOT NULL auto_increment,
  `jobCollection_time` bigint(20) default NULL,
  `job_id` bigint(20) default NULL,
  `openid` varchar(30) default NULL,
  `status` int(11) default '0',
  PRIMARY KEY  (`jobCollection_id`),
  UNIQUE KEY `jobCollection_id` (`jobCollection_id`),
  KEY `FK567A8E1BCE574CF6` (`openid`),
  KEY `FK567A8E1B7F08D970` (`job_id`),
  CONSTRAINT `FK567A8E1B7F08D970` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FK567A8E1BCE574CF6` FOREIGN KEY (`openid`) REFERENCES `student` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobcollection
-- ----------------------------

-- ----------------------------
-- Table structure for jobinvitation
-- ----------------------------
DROP TABLE IF EXISTS `jobinvitation`;
CREATE TABLE `jobinvitation` (
  `jobInvitation_id` bigint(20) NOT NULL auto_increment,
  `jobInvitation_time` bigint(20) default NULL,
  `job_id` bigint(20) default NULL,
  `openid` varchar(30) default NULL,
  `status` int(11) default '0',
  PRIMARY KEY  (`jobInvitation_id`),
  UNIQUE KEY `jobInvitation_id` (`jobInvitation_id`),
  KEY `FK5845716CE574CF6` (`openid`),
  KEY `FK58457167F08D970` (`job_id`),
  CONSTRAINT `FK58457167F08D970` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FK5845716CE574CF6` FOREIGN KEY (`openid`) REFERENCES `student` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobinvitation
-- ----------------------------

-- ----------------------------
-- Table structure for jobpost
-- ----------------------------
DROP TABLE IF EXISTS `jobpost`;
CREATE TABLE `jobpost` (
  `jobPost_id` bigint(20) NOT NULL auto_increment,
  `jobPost_state` int(11) default '0',
  `jobPost_time` bigint(20) default NULL,
  `job_id` bigint(20) default NULL,
  `openid` varchar(30) default NULL,
  PRIMARY KEY  (`jobPost_id`),
  UNIQUE KEY `jobPost_id` (`jobPost_id`),
  KEY `FKD8219DDCE574CF6` (`openid`),
  KEY `FKD8219DD7F08D970` (`job_id`),
  CONSTRAINT `FKD8219DD7F08D970` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FKD8219DDCE574CF6` FOREIGN KEY (`openid`) REFERENCES `student` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobpost
-- ----------------------------

-- ----------------------------
-- Table structure for job_type
-- ----------------------------
DROP TABLE IF EXISTS `job_type`;
CREATE TABLE `job_type` (
  `job_type_id` int(10) NOT NULL auto_increment COMMENT '职位分类id',
  `job_type_name` varchar(20) default NULL COMMENT '职位分类名称',
  PRIMARY KEY  (`job_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_type
-- ----------------------------
INSERT INTO `job_type` VALUES ('1', '不限');
INSERT INTO `job_type` VALUES ('2', 'IT/互联网');
INSERT INTO `job_type` VALUES ('3', '销售/客服');
INSERT INTO `job_type` VALUES ('4', '设计/广告');
INSERT INTO `job_type` VALUES ('5', '教育/培训');
INSERT INTO `job_type` VALUES ('6', '财会/银行');
INSERT INTO `job_type` VALUES ('7', '人力/行政');

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place` (
  `place_id` bigint(20) NOT NULL auto_increment,
  `place_name` varchar(20) default NULL,
  PRIMARY KEY  (`place_id`),
  UNIQUE KEY `place_id` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES ('1', '芝罘区');
INSERT INTO `place` VALUES ('2', '莱山区');
INSERT INTO `place` VALUES ('3', '高新区');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL auto_increment,
  `salary` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', '不限');
INSERT INTO `salary` VALUES ('2', '1K以下');
INSERT INTO `salary` VALUES ('3', '1~2K');
INSERT INTO `salary` VALUES ('4', '2-4K');
INSERT INTO `salary` VALUES ('5', '4-8K');
INSERT INTO `salary` VALUES ('6', '8-10K');
INSERT INTO `salary` VALUES ('7', '10K以上');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `open_id` varchar(30) NOT NULL,
  `student_birthday` varchar(10) default NULL,
  `student_gender` varchar(4) default NULL,
  `student_img` varchar(100) default NULL,
  `student_mailbox` varchar(20) default NULL,
  `student_major` varchar(20) default NULL,
  `student_name` varchar(10) default NULL,
  `student_qq` varchar(10) default NULL,
  `student_qualifications` varchar(20) default NULL,
  `student_residence` varchar(40) default NULL,
  `student_school` varchar(30) default NULL,
  `student_state` varchar(20) default NULL,
  `student_tel` varchar(15) default NULL,
  `student_time` varchar(20) default NULL,
  `student_aboutme` varchar(200) default NULL,
  `student_speciality` varchar(200) default NULL,
  `student_skill` varchar(200) default NULL,
  PRIMARY KEY  (`open_id`),
  UNIQUE KEY `open_id` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('o6yKmw0KDIv18KyJ7zxuI4Nt4P8E', '2016-11-28', '男', '[/upload/570IMG_20161025_084115.jpg]', null, '软件工程', '佟欢', null, '本科', '芝罘区', '鲁东大学', '在职', null, '2016-11-28 13:49', null, null, null);
INSERT INTO `student` VALUES ('o6yKmw4NCS8rPF8z1wvgxGTpN0TQ', '', null, null, null, '', '哈哈哈', null, null, null, '', null, null, '2016-11-29 20:34', null, null, null);

-- ----------------------------
-- Table structure for studentexperience
-- ----------------------------
DROP TABLE IF EXISTS `studentexperience`;
CREATE TABLE `studentexperience` (
  `studentexp_id` bigint(20) NOT NULL auto_increment,
  `studentexp_company` varchar(30) default NULL,
  `studentexp_jobname` varchar(255) default NULL,
  `studentexp_jobtype` varchar(20) default NULL,
  `studentexp_entrytime` varchar(20) default NULL,
  `studentexp_departuretime` varchar(20) default NULL,
  `studentexp_describe` varchar(100) default NULL,
  `student_id` varchar(30) default NULL,
  PRIMARY KEY  (`studentexp_id`),
  UNIQUE KEY `studentexp_id` (`studentexp_id`),
  KEY `FKFA75A9E5CD0A05B0` (`student_id`),
  CONSTRAINT `FKFA75A9E5CD0A05B0` FOREIGN KEY (`student_id`) REFERENCES `student` (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentexperience
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `OPENID` varchar(255) NOT NULL default '',
  `NICKNAME` varchar(255) default NULL,
  `HEADIMGURL` varchar(2000) default NULL,
  `SEX` varchar(4) default NULL,
  `SUBSCRIBE_TIME` varchar(10) default NULL,
  `LANGUAGE` varchar(10) default NULL,
  `CITY` varchar(20) default NULL,
  `PROVINCE` varchar(20) default NULL,
  `COUNTRY` varchar(20) default NULL,
  `type` int(2) default '0',
  PRIMARY KEY  (`OPENID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('o6yKmw0KDIv18KyJ7zxuI4Nt4P8E', '小小小明光', 'http://wx.qlogo.cn/mmopen/wyia52a3XZBmFYiabYK7HHOO4DxrFbiaeA1F9r4KE2lBNe2xXBBPkm08LaNscd0dxOgaBGOqoTaLKz7c5tQdW2x4g/0', '1', '1478568020', 'zh_CN', '', '', '蒙古', '0');
INSERT INTO `user` VALUES ('o6yKmw4NCS8rPF8z1wvgxGTpN0TQ', '孙梓皓', 'http://wx.qlogo.cn/mmopen/4rNJR0cy2F4V7TIkZyfWynHMcwZzMWoLl98iaC3daib1ILgauN02yFYCialvr3hgQmx1IQoHFpXVMeoPz5I0Hej1TgsoTr6qdZic/0', '1', '1480422775', 'zh_CN', '', '台北市', '中国台湾', '0');
INSERT INTO `user` VALUES ('o6yKmw8QEd6vVrud2ZpBBMLG8z3Y', 'Demon', 'http://wx.qlogo.cn/mmopen/65hJlRGxBxjZPt6F9uLjD057D4bZKcIPbJFlSqxkxDI7eHELtUWBVWSkia0rglvcVgV0L61I0ANS4k4Gpiby4WdEibtGIYp9wfib/0', '1', '1480298947', 'zh_CN', '', '', '安道尔', '1');
INSERT INTO `user` VALUES ('o6yKmw_kjhA3CTiK5EMi8yVhp0E8', 'Mr.Chock', 'http://wx.qlogo.cn/mmopen/bNvDnXQV4bwqPK7LU6yr2pF355KoeZ05uvgq4UREy3tQ1GibianWRHCLXF0yniaqOsD5ay110HGrXEEyqxWwzGk0ibEeug05FQc7/0', '1', '1478845630', 'zh_CN', '', '', '安道尔', '0');
