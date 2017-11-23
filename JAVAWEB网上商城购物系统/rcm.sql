/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50168
Source Host           : localhost:3306
Source Database       : rcm

Target Server Type    : MYSQL
Target Server Version : 50168
File Encoding         : 65001

Date: 2016-05-26 10:06:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classify`
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of classify
-- ----------------------------

-- ----------------------------
-- Table structure for `classify_prodcut`
-- ----------------------------
DROP TABLE IF EXISTS `classify_prodcut`;
CREATE TABLE `classify_prodcut` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `product` int(36) DEFAULT NULL,
  `classify` int(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of classify_prodcut
-- ----------------------------

-- ----------------------------
-- Table structure for `frequency`
-- ----------------------------
DROP TABLE IF EXISTS `frequency`;
CREATE TABLE `frequency` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `user_id` int(36) DEFAULT NULL,
  `product` int(36) DEFAULT NULL,
  `times` int(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of frequency
-- ----------------------------
INSERT INTO `frequency` VALUES ('1', '1', '3', '3');
INSERT INTO `frequency` VALUES ('2', '1', '10', '1');
INSERT INTO `frequency` VALUES ('3', '1', '14', '2');
INSERT INTO `frequency` VALUES ('4', '1', '27', '1');
INSERT INTO `frequency` VALUES ('5', '1', '26', '2');
INSERT INTO `frequency` VALUES ('6', '1', '25', '1');
INSERT INTO `frequency` VALUES ('7', '6', '2', '1');
INSERT INTO `frequency` VALUES ('8', '15', '1', '1');
INSERT INTO `frequency` VALUES ('9', '15', '2', '5');
INSERT INTO `frequency` VALUES ('10', '15', '3', '2');
INSERT INTO `frequency` VALUES ('11', '15', '5', '1');
INSERT INTO `frequency` VALUES ('12', '15', '27', '1');
INSERT INTO `frequency` VALUES ('13', '15', '26', '1');
INSERT INTO `frequency` VALUES ('14', '15', '19', '3');
INSERT INTO `frequency` VALUES ('15', '15', '16', '3');
INSERT INTO `frequency` VALUES ('16', '15', '17', '2');
INSERT INTO `frequency` VALUES ('17', '15', '14', '1');
INSERT INTO `frequency` VALUES ('18', '15', '13', '1');
INSERT INTO `frequency` VALUES ('19', '15', '24', '1');
INSERT INTO `frequency` VALUES ('20', '15', '9', '1');
INSERT INTO `frequency` VALUES ('21', '15', '8', '1');
INSERT INTO `frequency` VALUES ('22', '15', '10', '1');
INSERT INTO `frequency` VALUES ('23', '15', '4', '1');
INSERT INTO `frequency` VALUES ('24', '1', '5', '2');
INSERT INTO `frequency` VALUES ('25', '11', '1', '1');
INSERT INTO `frequency` VALUES ('26', '11', '4', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `classify` int(36) DEFAULT NULL,
  `pic` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `describ` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `price` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '东芝U盘64G USB3.0', '1', '80_QMvEjQAAexB002.jpg', '东芝（TOSHIBA） Osumi EX2 64GB USB3.0 U盘', '198');
INSERT INTO `product` VALUES ('4', 'TP-LINK TL-WR842N', '1', '18_dtl_lyq.jpg', '\"极路由（HiWiFi） HC5761 极贰AC双频智能无线路由器', '50');
INSERT INTO `product` VALUES ('5', '云南勐海古树普洱茶', '2', '569a046bN74da4012.jpg', '梓瑞 云南勐海古树普洱茶 班章系列古树茶叶生/熟 班章1号/357克', '187.5');
INSERT INTO `product` VALUES ('6', '安溪铁观音', '2', 'kdosa9320js.jpg', '安溪铁观音茶叶浓香型兰花香乌龙茶礼盒装 255g', '99.8');
INSERT INTO `product` VALUES ('7', '小细腰荷叶茶', '2', '32r43wqf32q.jpg', '简品 小细腰荷叶茶 天然荷叶袋泡茶 100g*2礼盒', '68');
INSERT INTO `product` VALUES ('8', '武夷山大红袍', '2', '43rfweaf.jpg', '天福茗茶 天曦武夷山大红袍乌龙茶叶礼盒装100g*4罐', '99');
INSERT INTO `product` VALUES ('9', '洞庭碧螺春', '2', 'vsae3wf3.jpg', '春满壶 绿茶 洞庭碧螺春 60g/罐合计240g 谷雨前碧螺春', '88.3');
INSERT INTO `product` VALUES ('10', '西湖龙井绿茶', '2', 'dsafea32r3q.jpg', '明前西湖龙井绿茶 口碑茶250g/罐', '166');
INSERT INTO `product` VALUES ('11', '干红葡萄酒', '3', 'ewqf32r3ajyu.jpg', '长城特酿3年解百纳干红葡萄酒 整箱装 750ml*6瓶', '139');
INSERT INTO `product` VALUES ('13', '张裕优选级干红葡萄酒750ml*6瓶', '3', 'vsaf435875g.jpg', '张裕优选级干红葡萄酒750ml*6瓶', '298');
INSERT INTO `product` VALUES ('15', '韩国所望SOMANG牛奶身体乳500ml', '4', 'mjytkuyt767.jpg', '韩国所望SOMANG牛奶身体乳500ml', '69');
INSERT INTO `product` VALUES ('16', 'L\'occitane欧舒丹护手霜润手霜滋润保湿 薰衣草味润手乳300ml', '4', 'kuyt6757u5.jpg', 'L\'occitane欧舒丹护手霜润手霜滋润保湿 薰衣草味润手乳300ml', '198');
INSERT INTO `product` VALUES ('18', 'Docker进阶与实战', '5', '4362t5fewaf.jpg', 'Docker进阶与实战', '68.25');
INSERT INTO `product` VALUES ('19', 'Python绝技：运用Python成为顶级黑客', '5', '45eytgsfr.jpg', 'Python绝技：运用Python成为顶级黑客', '67.8');
INSERT INTO `product` VALUES ('21', '分布式服务框架原理与实践', '5', 'fewqf09ewjq.jpg', '分布式服务框架原理与实践', '58.9');
INSERT INTO `product` VALUES ('22', '机器学习', '5', 'mklf902q93urj.jpg', '机器学习', '67');
INSERT INTO `product` VALUES ('24', '金贝壳巧克力', '6', 'iofwelq932.jpg', '比利时进口 Guylian吉利莲 金贝壳巧克力礼盒250g', '70');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');
INSERT INTO `user` VALUES ('5', 'tese2', '123456');
INSERT INTO `user` VALUES ('7', 'test3', '123456');
INSERT INTO `user` VALUES ('10', 'test4', '123456');
INSERT INTO `user` VALUES ('11', 'www', '1234');
