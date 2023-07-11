-- Active: 1688053910196@@127.0.0.1@3306@demo

-- 查看表结构

DESCRIBE demo.goodsmaster;

DROP TABLE demo.goodsmaster;

CREATE TABLE
    demo.goodsmaster
(
    itemnumber    INT PRIMARY KEY AUTO_INCREMENT,
    barcode       TEXT           NOT NULL,
    goodsname     TEXT           NOT NULL,
    specification TEXT,
    unit          TEXT,
    price         DECIMAL(10, 2) NOT NULL
);

-- 添加数据

INSERT INTO demo.goodsmaster (itemnumber, barcode, goodsname, specification, unit, price)
VALUES (4, '0003', '尺子', '三角形', '把', 5);

SELECT *
FROM demo.goodsmaster;

-- 只给其他某些字段赋值

INSERT INTO demo.goodsmaster (barcode, goodsname, price)
VALUES ('0004', '测试', 10);

ALTER TABLE demo.goodsmaster
    MODIFY specification TEXT NOT NULL;

DELETE
from demo.goodsmaster
WHERE itemnumber = 5;

INSERT INTO demo.goodsmaster (barcode, goodsname, price)
VALUES ('0004', '测试', 10);

-- 删除数据

DELETE
FROM demo.goodsmaster
WHERE itemnumber > 1;

-- 修改数据

SELECT *
FROM demo.goodsmaster
where itemnumber = 3;

UPDATE demo.goodsmaster
SET itemnumber = 2
WHERE itemnumber = 3;

INSERT INTO demo.goodsmaster(barcode, goodsname, price)
VALUES ('0003', '尺子1', 15);

INSERT INTO demo.goodsmaster(barcode, goodsname, price)
VALUES ('0004', '测试1', 20);

SELECT *
FROM demo.goodsmaster;

# 查询数据
SELECT a.goodsname, a.price
FROM (SELECT * FROM demo.goodsmaster) AS a;

# ORDER BY
SELECT *
FROM demo.goodsmaster
ORDER BY barcode ASC, price DESC;

# LIMIT
SELECT *
FROM demo.goodsmaster
LIMIT 1, 2; -- 从第二条开始，取两条 (第一条是0)

