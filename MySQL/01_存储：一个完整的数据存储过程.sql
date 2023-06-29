# create database CREATE DATABASE demo;

# show database SHOW DATABASES;

# create table
CREATE TABLE
    demo.test (
        barcode text,
        goodsname text,
        price int
    );

DESCRIBE demo.test;

USE demo;
SHOW TABLES;

# 修改表，插入一个新字段
ALTER TABLE demo.test
ADD COLUMN itemnumber int PRIMARY KEY AUTO_INCREMENT;

# 插入数据
INSERT INTO demo.test
(barcode,goodsname,price)
VALUES ('0001','本',3);

SELECT * FROM demo.test;