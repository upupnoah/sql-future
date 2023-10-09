CREATE TABLE demo.goodsmaster
(
    itemnumber    INT PRIMARY KEY,
    barcode       VARCHAR(255),
    goodsname     VARCHAR(255),
    specification VARCHAR(255),
    unit          VARCHAR(255),
    salesprice    DECIMAL(10, 2)
);

INSERT INTO goodsmaster (itemnumber, barcode, goodsname, specification, unit, salesprice)
VALUES (1, '0001', '书', '', '本', 89.00),
       (2, '0002', '笔', '', '支', 5.00);

select *
from goodsmaster;


CREATE TABLE demo.transactiondetails
(
    transactionid INT,
    itemnumber    INT,
    quantity      DECIMAL(10, 3),
    price         DECIMAL(10, 2),
    salesvalue    DECIMAL(10, 2)
);

INSERT INTO demo.transactiondetails (transactionid, itemnumber, quantity, price, salesvalue)
VALUES (1, 1, 1.000, 89.00, 89.00),
       (1, 2, 2.000, 5.00, 10.00),
       (2, 1, 2.000, 89.00, 178.00),
       (3, 2, 10.000, 5.00, 50.00);

# 需要查询出一个商品记录集，限定条件是单笔销售金额超过 50 元
# 使用 Where 关键字查询
select distinct b.goodsname
from demo.transactiondetails as a
         join demo.goodsmaster as b
              on (a.itemnumber = b.itemnumber)
where a.salesvalue > 50;

# 使用 Having 关键字查询
select b.goodsname
from demo.transactiondetails as a
         join demo.goodsmaster as b
              on (a.itemnumber = b.itemnumber)
group by b.goodsname
having max(a.salesvalue) > 50;

CREATE TABLE demo.transactionhead
(
    transactionid INT PRIMARY KEY,
    transactionno VARCHAR(255),
    operatorid    INT,
    transdate     DATETIME
);

INSERT INTO demo.transactionhead (transactionid, transactionno, operatorid, transdate)
VALUES (1, '0120201201000001', 1, '2020-12-10 00:00:00'),
       (2, '0120201202000001', 2, '2020-12-11 00:00:00'),
       (3, '0120201202000002', 2, '2020-12-12 00:00:00');

CREATE TABLE demo.operator
(
    operatorid   INT PRIMARY KEY,
    branchid     INT,
    workno       VARCHAR(255),
    operatorname VARCHAR(255),
    phone        VARCHAR(255),
    address      VARCHAR(255),
    pid          VARCHAR(255),
    duty         VARCHAR(255)
);

INSERT INTO demo.operator (operatorid, branchid, workno, operatorname, phone, address, pid, duty)
VALUES (1, 1, '001', '张静', '18612345678', '北京', '110392197501012332', '店长'),
       (2, 1, '002', '李强', '13312345678', '北京', '110222199501012332', '收银员');


SELECT a.transdate,
       c.operatorname,
       SUM(b.quantity),
       SUM(b.salesvalue)
FROM demo.transactionhead AS a
         JOIN
     demo.transactiondetails AS b ON (a.transactionid = b.transactionid)
         JOIN
     demo.operator AS c ON (a.operatorid = c.operatorid)
WHERE a.transdate in ('2020-12-12', '2020-12-11') -- 先按日期筛选
GROUP BY a.transdate, operatorname
HAVING SUM(b.salesvalue) > 100; -- 后按金额筛选
