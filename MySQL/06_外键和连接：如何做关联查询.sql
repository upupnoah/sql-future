CREATE TABLE demo.importhead
(
    listnumber     INT PRIMARY KEY,
    supplierid     INT,
    stocknumber    INT,
    importtype     INT,
    importquantity DECIMAL(10, 3),
    importvalue    DECIMAL(10, 2),
    recorder       INT,
    recordingdate  DATETIME
);

CREATE TABLE demo.importdetails
(
    listnumber  INT,
    itemnumber  INT,
    quantity    DECIMAL(10, 3),
    importprice DECIMAL(10, 2),
    importvalue DECIMAL(10, 2),
    -- 定义外键
    CONSTRAINT fk_importdetails_importhead
        FOREIGN KEY (listnumber) REFERENCES demo.importhead (listnumber)
);

# 内连接
select a.transactionno, a.itemnumber, a.quantity, a.price, a.transdate, b.membername
from demo.trans as a
         join demo.membermaster AS b on (a.cardno = b.cardno);

# 左外连接
select a.transactionno, a.itemnumber, a.quantity, a.price, a.transdate, b.membername
from demo.trans as a
         left join demo.membermaster as b on (a.cardno = b.cardno);

# 右外连接
select a.transactionno, a.itemnumber, a.quantity, a.price, a.transdate, b.membername
from demo.membermaster as b
         right join demo.trans as a on (a.cardno = b.cardno);
