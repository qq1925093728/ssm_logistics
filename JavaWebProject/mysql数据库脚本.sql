-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_workMan` (
  `workUserName` varchar(30)  NOT NULL COMMENT 'workUserName',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `workManPhoto` varchar(60)  NOT NULL COMMENT '������Ա��Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `workManMemo` varchar(800)  NULL COMMENT '��ע��Ϣ',
  PRIMARY KEY (`workUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_cangku` (
  `cangkuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ֿ�id',
  `diqu` varchar(20)  NOT NULL COMMENT '���ڵ���',
  `cangkuName` varchar(20)  NOT NULL COMMENT '�ֿ�����',
  `mianji` varchar(20)  NOT NULL COMMENT '�ֿ����',
  `tdl` varchar(20)  NOT NULL COMMENT '�ֿ�������',
  `lianxiren` varchar(20)  NOT NULL COMMENT '��ϵ��',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NOT NULL COMMENT '�ֿ��ַ',
  `cangkuMemo` varchar(800)  NULL COMMENT '�ֿⱸע',
  PRIMARY KEY (`cangkuId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_wuzi` (
  `wuliuNo` varchar(20)  NOT NULL COMMENT 'wuliuNo',
  `wuziClassObj` int(11) NOT NULL COMMENT '���ʷ���',
  `wuziName` varchar(20)  NOT NULL COMMENT '��������',
  `zhongliang` varchar(20)  NOT NULL COMMENT '��������',
  `wuziDesc` varchar(8000)  NOT NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '�ļ���',
  `sendTelephone` varchar(30)  NOT NULL COMMENT '�ļ��˵绰',
  `sendAddress` varchar(80)  NOT NULL COMMENT '�ļ��˵�ַ',
  `receiveUserObj` varchar(30)  NOT NULL COMMENT '�ռ���',
  `receiveTelephone` varchar(20)  NOT NULL COMMENT '�ռ��˵绰',
  `receiveAddress` varchar(80)  NOT NULL COMMENT '�ռ��˵�ַ',
  `yunfei` float NOT NULL COMMENT '�˷�',
  `wldt` varchar(800)  NOT NULL COMMENT '������̬',
  `wuziMemo` varchar(800)  NULL COMMENT '��ע��Ϣ',
  PRIMARY KEY (`wuliuNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_ruku` (
  `rukuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���id',
  `wuziObj` varchar(20)  NOT NULL COMMENT '�������',
  `wuziClassObj` int(11) NOT NULL COMMENT '��������',
  `zhongliang` varchar(20)  NOT NULL COMMENT '����',
  `cangkuObj` int(11) NOT NULL COMMENT '���ֿ�',
  `rukuTime` varchar(20)  NULL COMMENT '���ʱ��',
  `okFlag` varchar(20)  NOT NULL COMMENT '�Ƿ����',
  `workManObj` varchar(30)  NOT NULL COMMENT '������Ա',
  `rukuMemo` varchar(800)  NULL COMMENT '��ⱸע',
  PRIMARY KEY (`rukuId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_chuku` (
  `chukuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `wuziObj` varchar(20)  NOT NULL COMMENT '��������',
  `wuziClassObj` int(11) NOT NULL COMMENT '��������',
  `zhongliang` varchar(20)  NOT NULL COMMENT '����',
  `cangkuObj` int(11) NOT NULL COMMENT '����ֿ�',
  `chukuTime` varchar(20)  NULL COMMENT '����ʱ��',
  `okFlag` varchar(20)  NOT NULL COMMENT '�Ƿ����',
  `workManObj` varchar(30)  NOT NULL COMMENT '������Ա',
  `chukuMemo` varchar(800)  NULL COMMENT '���ⱸע',
  PRIMARY KEY (`chukuId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_wuziClass` (
  `wuziClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `wuziClassName` varchar(20)  NOT NULL COMMENT '������������',
  PRIMARY KEY (`wuziClassId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_wuzi ADD CONSTRAINT FOREIGN KEY (wuziClassObj) REFERENCES t_wuziClass(wuziClassId);
ALTER TABLE t_wuzi ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_wuzi ADD CONSTRAINT FOREIGN KEY (receiveUserObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_ruku ADD CONSTRAINT FOREIGN KEY (wuziObj) REFERENCES t_wuzi(wuliuNo);
ALTER TABLE t_ruku ADD CONSTRAINT FOREIGN KEY (wuziClassObj) REFERENCES t_wuziClass(wuziClassId);
ALTER TABLE t_ruku ADD CONSTRAINT FOREIGN KEY (cangkuObj) REFERENCES t_cangku(cangkuId);
ALTER TABLE t_ruku ADD CONSTRAINT FOREIGN KEY (workManObj) REFERENCES t_workMan(workUserName);
ALTER TABLE t_chuku ADD CONSTRAINT FOREIGN KEY (wuziObj) REFERENCES t_wuzi(wuliuNo);
ALTER TABLE t_chuku ADD CONSTRAINT FOREIGN KEY (wuziClassObj) REFERENCES t_wuziClass(wuziClassId);
ALTER TABLE t_chuku ADD CONSTRAINT FOREIGN KEY (cangkuObj) REFERENCES t_cangku(cangkuId);
ALTER TABLE t_chuku ADD CONSTRAINT FOREIGN KEY (workManObj) REFERENCES t_workMan(workUserName);


