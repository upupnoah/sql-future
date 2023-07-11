# 启用“REAL_AS_FLOAT”， 默认是 DOUBLE SET sql_mode = ”REAL_AS_FLOAT”;

CREATE TABLE
    demo.goodsmaster
(
    barcode    TEXT,
    goodsname  TEXT,
    price      DOUBLE,
    itemnumber INT PRIMARY KEY AUTO_INCREMENT
);

-- 第一条

INSERT INTO demo.goodsmaster (barcode, goodsname, price)
VALUES ('0001', '书', 0.47);

-- 第二条

INSERT INTO demo.goodsmaster (barcode, goodsname, price)
VALUES ('0002', '笔', 0.44);

-- 第三条

INSERT INTO demo.goodsmaster (barcode, goodsname, price)
VALUES ('0002', '胶水', 0.19);

SELECT *
from demo.goodsmaster;

SELECT SUM(price)
FROM demo.goodsmaster;

ALTER TABLE
    demo.goodsmaster
    MODIFY COLUMN price DECIMAL(5, 2);

SELECT SUM(price)
FROM demo.goodsmaster;