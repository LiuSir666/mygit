
-- 这个文件中写 SQL 语句

-- 删除数据库
DROP DATABASE IF EXISTS zy_coupon;

-- 创建数据库
CREATE DATABASE IF NOT EXISTS zy_coupon;

-- 使用数据库
USE zy_coupon;

-- 创建表

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
    `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    `username` varchar(20) NOT NULL COMMENT '用户名',
    `password` varchar(20) NOT NULL COMMENT '密码'
) ENGINE = INNODB AUTO_INCREMENT = 1000 DEFAULT CHARSET = utf8 COMMENT '用户表';

-- ENGINE 数据库引擎：只有 INNODB 方式才支持索引（index），在我们的配置文件中是默认的 
-- AUTO_INCREMENT：设置主键的起始值，从 1000 开始
-- DEFAULT CHARSET：设置字符编码格式，在我们配置文件中默认也是 utf8

-- 优惠券表
CREATE TABLE IF NOT EXISTS `coupon` (
    `id` bigint unsigned PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    `title` varchar(20) NOT NULL COMMENT '标题',
    `desc` varchar(100) NOT NULL COMMENT '描述',
    `start_time` datetime NOT NULL COMMENT '开始时间',
    `end_time` datetime NOT NULL COMMENT '结束时间',
    `number` int NOT NULL COMMENT '数量'
)ENGINE = INNODB AUTO_INCREMENT = 1000 DEFAULT CHARSET = utf8 COMMENT '优惠券表';

-- 用户优惠券表
CREATE TABLE IF NOT EXISTS `user_coupon` (
    `user_id` bigint unsigned COMMENT '用户主键',
    `coupon_id` bigint unsigned COMMENT '优惠券主键',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '领取时间',
    PRIMARY KEY(user_id, coupon_id)
)ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT '用户优惠券表';

-- user_id 和 coupon_id 设置为联合主键，每一个都可以重复，但是组合不能重复

    
    
    
    
    
    