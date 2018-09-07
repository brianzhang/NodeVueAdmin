
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `role` tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户权限',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',

  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


INSERT INTO `user` (user_name, password, role) VALUES('admin', '123456', 100);


DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `members_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `member_name` varchar(50) NOT NULL DEFAULT 'noname',
  `member_phone` varchar(100) NOT NULL DEFAULT '',
  `diamond` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '钻石',
  `points` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分',
  `open_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'OPENID',
  `remarks` varchar(100) NOT NULL DEFAULT '',
  `membership_level` tinyint(3) NOT NULL DEFAULT '0' COMMENT '会员等级',
  PRIMARY KEY (`members_id`),
  UNIQUE KEY `members_id` (`members_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `goodstype` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `goods_typename` varchar(100) NOT NULL DEFAULT '',
  `remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`goodstype`),
  UNIQUE KEY `goodstype` (`goodstype`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `goods_name` varchar(50) NOT NULL DEFAULT 'noname' COMMENT '游戏名字',
  `app_id` varchar(50) NOT NULL DEFAULT 'app_id' COMMENT '游戏ID',
  `goods_price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '分成价',
  `inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `run_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '启动次数',
  `goods_typename` varchar(50) DEFAULT '' COMMENT '分类',
  `partner_name` varchar(30) DEFAULT '' COMMENT '合作CP',
  `imgs` varchar(50) DEFAULT '',
  `onsale` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否上架',
  `goods_details` varchar(50) DEFAULT '' COMMENT '详情',
  `color1` varchar(10) DEFAULT '#F4A0A0' COMMENT '色阶',
  `color2` varchar(10) DEFAULT '#991717' COMMENT '色阶',
  `open_url` varchar(500) DEFAULT '' COMMENT '统计地址',
  `recommend` BOOLEAN DEFAULT 0 COMMENT '是否推荐',
  `qr_url` varchar(200) DEFAULT '' COMMENT '统计地址',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;


DROP TABLE if EXISTS 'parters';
CREATE TABLE `parters` (
  `parter_id` int(11) NOT NULL AUTO_INCREMENT,
  `parter_name` varchar(30) NOT NULL DEFAULT '' COMMENT '合作伙伴名称',
  `contacts` varchar(30) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `wechat` varchar(30) NOT NULL DEFAULT '' COMMENT '微信',
  `web_site` varchar(40) NOT NULL DEFAULT '' COMMENT '网址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  PRIMARY KEY (`parter_id`),
  UNIQUE KEY `parter_id` (`parter_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

DROP TABLE if EXISTS 'run_logs';
CREATE TABLE `run_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(50) NOT NULL DEFAULT '' COMMENT '游戏ID',
  `members_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id` (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

DROP TABLE if EXISTS 'login_logs';
CREATE TABLE `login_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `members_id` varchar(50) NOT NULL DEFAULT '' COMMENT '用户ID',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '地区',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id` (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp COMMENT '更新时间',
  `goods_id` varchar(50) NOT NULL DEFAULT '',
  `goods_name` varchar(50) NOT NULL DEFAULT 'noname',
  `goods_price` float(10,2) NOT NULL DEFAULT '0.00',
  `purchase_quantity` float(10,0) NOT NULL DEFAULT '0',	
  `member_id` varchar(50) NOT NULL DEFAULT '',
  `members_addr` varchar(50) NOT NULL DEFAULT '',
  `state` tinyint(8) NOT NULL DEFAULT '0' COMMENT '订单状态',	
  `state_name` varchar(50) NOT NULL DEFAULT '',	
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

 





