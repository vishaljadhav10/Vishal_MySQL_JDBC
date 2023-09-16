create database if not exists orderdirectory;
use orderdirectory;

create table supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) not null
);
select * from supplier;

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

create table customer(
CUS_ID int not null,
CUS_NAME VARCHAR(20) not null,
CUS_PHONE VARCHAR(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char,
primary key (CUS_ID));
select * from customer;

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

create table category (
CAT_ID int not null,
CAT_NAME VARCHAR(20) not null,
primary key (CAT_ID)
);
select * from category;

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

create table product (
PRO_ID int not null,
PRO_NAME VARCHAR(20) not null default "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID int not null,
primary key (PRO_ID),
foreign key (CAT_ID) references CATEGORY (CAT_ID)
);
select * from product;

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

create table supplier_pricing (
PRICING_ID int not null,
PRO_ID int not null,
SUPP_ID int not null,
SUPP_PRICE int default 0,
primary key (PRICING_ID),
foreign key (PRO_ID) references PRODUCT (PRO_ID),
foreign key (SUPP_ID) references SUPPLIER(SUPP_ID)
);
select * from supplier_pricing;

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

create table ordertable (
ORD_ID int not null,
ORD_AMOUNT int not null,
ORD_DATE date,
CUS_ID int not null,
PRICING_ID int not null,
primary key (ORD_ID),
foreign key (CUS_ID) references CUSTOMER(CUS_ID),
foreign key (PRICING_ID) references SUPPLIER_PRICING(PRICING_ID)
);
select * from ordertable;

INSERT INTO ordertable VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO ordertable VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO ordertable VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO ordertable VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO ordertable VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO ordertable VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO ordertable VALUES(107,789,"2021-09-01",3,7);
INSERT INTO ordertable VALUES(108,780,"2021-09-07",5,6);
INSERT INTO ordertable VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO ordertable VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO ordertable VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO ordertable VALUES(112,789,"2021-09-16",4,7);
INSERT INTO ordertable VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO ordertable VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO ordertable VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO ordertable VALUES(116,99,"2021-09-17",2,14);

create table rating (
RAT_ID int not null,
ORD_ID int not null,
RAT_RATSTARS int not null,
primary key (RAT_ID),
foreign key (ORD_ID) references ordertable(ORD_ID)
);
select * from rating;

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

show tables;

-- query 3  Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

select count(*),cus_gender 
from customer 
where cus_id in
( select cus_id from ordertable where ord_amount>=3000) 
group by cus_gender;

-- query 4  Display all the orders along with product name ordered by a customer having Customer_Id=2

select p.pro_name,o.*
from ordertable o
join product p ON o.pricing_id = p.pro_id
WHERE o.cus_id = 2;

-- query 5 Display the Supplier details who can supply more than one product.

select s.supp_id, s.supp_name
from supplier s
join supplier_pricing sp on s.supp_id= sp.supp_id
group by s.supp_id, s.supp_name
having COUNT(sp.PRO_ID) > 1;

-- query 6 Create a view as lowest_expensive_product and display the least expensive product from each category 
-- and print the table with category id, name, product name and price of the product.

create view lowest_exp_prod as
select c.cat_id,c.cat_name,p.pro_name,min(sp.supp_price) as lowestprice
from category c
join
product p 
on c.cat_id=p.cat_id
join supplier_pricing sp
on p.pro_id=sp.pro_id
group by c.cat_id,c.cat_name,p.pro_name;

select * from lowest_exp_prod;

-- query 7 Display the Id and Name of the Product ordered after “2021-10-05”.

 select p.pro_id,p.pro_name
from product p
join supplier_pricing sp
on p.pro_id=sp.pro_id
join ordertable o 
on sp.pricing_id=o.pricing_id
where o.ord_date>'2021-10-05';

-- query 8 Display customer name and gender whose names start or end with character 'A'.

select cus_name,cus_gender
from customer
where cus_name like 'a%' or cus_name like '%a';

-- query 9
/*Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
“Average Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

DELIMITER &&
CREATE PROCEDURE CalculateSupplierRating()
BEGIN
    SELECT s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS Rating,
    CASE
        WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
        WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
        WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
    FROM supplier s
    LEFT JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    LEFT JOIN ordertable o ON sp.PRICING_ID = o.PRICING_ID
    LEFT JOIN rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID, s.SUPP_NAME;
END &&
DELIMITER ;


CALL CalculateSupplierRating();