-- Active: 1688053910196@@127.0.0.1@3306@demo

CREATE TABLE
    demo.membermaster
(
    cardno        CHAR(8) PRIMARY KEY,
    membername    TEXT,
    memberphone   TEXT,
    memberpid     TEXT,
    memberaddress TEXT,
    sex           TEXT,
    birthday      DATETIME
);

DESCRIBE demo.membermaster;

INSERT INTO demo.membermaster (cardno,
                               membername,
                               memberphone,
                               memberpid,
                               memberaddress,
                               sex,
                               birthday)
VALUES ('10000001',
        '张三',
        '13812345678',
        '110123200001017890',
        '北京',
        '男',
        '2000-01-01');

INSERT INTO demo.membermaster (cardno,
                               membername,
                               memberphone,
                               memberpid,
                               memberaddress,
                               sex,
                               birthday)
VALUES ('10000002',
        '李四',
        '13512345324',
        '110123200001017891',
        '上海',
        '女',
        '2000-01-02');

SELECT *
FROM demo.membermaster;

DELETE
FROM demo.membermaster
WHERE membername = '张三';

# 创建销售流水表
CREATE TABLE
    demo.trans
(
    transactionno INT,
    itemnumber    INT,
    -- 商品编号(商品信息)
    quantity      DECIMAL(10, 2),
    price         DECIMAL(10, 2),
    salesvalue    DECIMAL(10, 2),
    cardno        CHAR(8),
    -- 会员卡号（会员信息）
    transdate     DATETIME
);

DROP TABLE demo.trans;

INSERT INTO demo.trans (transactionno,
                        itemnumber,
                        quantity,
                        price,
                        salesvalue,
                        cardno,
                        transdate)
VALUES (1,
        1,
        1,
        89,
        89,
        '10000001',
        '2020-01-01');

# 查询 2020 年 12 月 01 日的会员销售记录
SELECT b.membername,
       c.goodsname,
       a.quantity,
       a.salesvalue,
       a.transdate
FROM demo.trans AS a
         JOIN demo.membermaster AS b
         JOIN demo.goodsmaster AS c ON (
    a.cardno = b.cardno AND a.itemnumber = c.itemnumber
    );

UPDATE demo.membermaster
SET membername    = '王五',
    memberphone   = '13698765432',
    memberpid     = '475145197001012356',
    memberaddress = '天津',
    sex           = '女',
    birthday      = '1970-01-01'
WHERE cardno = '10000001';

ALTER TABLE demo.membermaster
    DROP PRIMARY KEY;

ALTER TABLE demo.membermaster
    ADD id INT PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE demo.trans
    ADD memberid INT;

UPDATE
    demo.trans AS a,
    demo.membermaster AS b
SET a.memberid = b.id
WHERE a.transactionno > 0
  AND a.cardno = b.cardno;

-- 这样操作可以不用删除trans的内容，在实际工作中更适合

