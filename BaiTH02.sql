--BTH02
Create database Btap1
use Btap1

Create table Product 
(
	id int identity(1,1) primary key,
	nameProduct nvarchar(200),
	cost float,
	description nvarchar(200),
	saleoff float,
	image nvarchar(200),
	price float,
);

CREATE TRIGGER UpdateSaleOff
ON Product
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE p
    SET p.saleoff = CASE
        WHEN i.price = 0 THEN 0 
        ELSE ((p.cost - i.price)/i.cost) * 100
        END
    FROM Product p
    JOIN INSERTED i ON p.id = i.id;
END;

insert into Product values ('Sweatshirt 2018 off shoulder', 130000, 'Cung không có gì', NULL, 'ao.jpg', 110000)
insert into Product values ('Simple product', 50000, 'Cung không có gì', NULL, 'vay.jpg', 50000)
insert into Product values ('Supper stereo earbuds', 130000, 'Cung không có gì', NULL, 'vay1.jpg', 110000)
insert into Product values ('Headset stereo Headphones', 39000, 'Cung không có gì', NULL, 'ao2.jpg', 39000)
insert into Product values ('New badger Product', 80000, 'Cung không có gì', NULL, 'vay2.jpg', 80000)
insert into Product values ('Affiliate Product', 29000, 'Cung không có gì', NULL, 'ao3.jpg', 29000)
insert into Product values ('Engagement rings for women', 130000, 'Cung không có gì', NULL, 'ao1.jpg', 110000)
insert into Product values ('Man consise classical', 80000, 'Cung không có gì', NULL, 'ao4.jpg', 80000)
