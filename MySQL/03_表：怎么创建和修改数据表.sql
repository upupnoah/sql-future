-- Active: 1688053910196@@127.0.0.1@3306@demo

# 创建表
CREATE TABLE
    demo.importhead (
        listnumber INT,
        supplierid INT,
        stocknumber INT,
        -- 我们在字段importype定义为INT类型的后面，按照MySQL创建表的语法，加了默认值1。
        importtype INT DEFAULT 1,
        quantity DECIMAL(10, 3),
        importvalue DECIMAL(10, 2),
        recorder INT,
        recordingdate DATETIME
    );

INSERT INTO
    demo.importhead (
        listnumber,
        supplierid,
        stocknumber,
        -- 这里我们没有插入字段importtype的值
        quantity,
        importvalue,
        recorder,
        recordingdate
    )
VALUES (
        3456,
        1,
        1,
        10,
        100,
        1,
        '2020-12-10'
    );

SELECT * FROM demo.importhead;

INSERT INTO
    demo.goodsmaster (
        itemnumber,
        barcode,
        goodsname,
        specification,
        unit,
        price
    )
VALUES (
        -- 指定商品编号为100：
        100,
        '0003',
        '测试1',
        '',
        '个',
        10
    );

INSERT INTO
    demo.goodsmaster (
        -- 不指定自增字段itemnumber的值
        barcode,
        goodsname,
        specification,
        unit,
        price
    )
VALUES ('0004', '测试2', '', '个', 20);

# 修改表 CREATE TABLE demo.importheadhist LIKE demo.importhead;

ALTER TABLE demo.importheadhist ADD confirmer INT;

-- 添加一个字段confirmer，类型INT

ALTER TABLE demo.importheadhist ADD confirmdate DATETIME;

-- 添加一个字段confirmdate，类型是DATETIME

ALTER TABLE
    demo.importheadhist CHANGE quantity importquantity DOUBLE;

ALTER TABLE
    demo.importheadhist MODIFY importquantity DECIMAL(10, 3);

ALTER TABLE
    demo.importheadhist
ADD
    suppliername TEXT AFTER supplierid;