-- PressMPLS Database --
CREATE DATABASE PressMPLS;
USE PressMPLS;

CREATE TABLE users (
  userid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  status varchar(150) ,
  password VARCHAR(255) NOT NULL
);


CREATE TABLE brands (
brandid int not null auto_increment primary key,
brandname varchar(255) not null
);

CREATE TABLE designs (
 designid bigint not null auto_increment primary key,
  imgname varchar(255) not null,
  imgcreator varchar(255) not null,
img longblob not null,
  price decimal (10,2) not null,
  designdesc varchar(150) not null

);
INSERT INTO designs (designid, imgname, imgcreator, img, price, designdesc) 
VALUES ('1', 'fifty', 'idk', 'LOAD_FILE(C:/Users/ahmed/Downloads/fidy.jpg)', '50.00', 'many men');
select * from designs;


CREATE TABLE products (
  productid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  productline varchar(255) not null,
  productname varchar(255) not null,
  productdesc varchar(700) not null,
  price DECIMAL(10,2) NOT NULL,
  colorid varchar(50) not null,
  size varchar(10) not null,
  brandid int not null,
  designid bigint,
  quantity int not null,
 foreign key (designid) references designs(designid),
 foreign key (brandid) references brands(brandid)
 
);


CREATE TABLE orders (
  orderid INT not null auto_increment primary KEY,
  productid INT NOT NULL,
  brandid int not null,
  foreign key (productid) references products(productid),
  foreign key (brandid) references brands(brandid)
);

CREATE TABLE purchase_cart (
  purchaseid INT not null PRIMARY KEY auto_increment,
  productid INT NOT NULL,
  quantity INT NOT NULL,
  orderid INT NOT NULL,
  brandid int not null,
  userid int not null,
  foreign key (productid) references products(productid),
  foreign key (brandid) references brands(brandid),
  foreign key (userid) references users(userid)
  );
  
  CREATE TABLE Order_details(
  OrderdetailsID int not null auto_increment primary key,
  productid int not null,
  purchaseid int not null,
  orderid int not null,
  brandname varchar(255) not null,
  brandid int not null,
  userid int not null,
  foreign key (productid) references products(productid),
  foreign key (purchaseid) references purchase_cart(purchaseid),
  foreign key (orderid) references orders(orderid),
  foreign key (brandid) references brands(brandid),
  foreign key (userid) references users(userid)
  );
  
  CREATE table billing (
  billingID int not null auto_increment primary key,
  billingAddress varchar(255) not null,
  purchaseMethod varchar(255) not null,
  shippingAddress varchar(255) not null,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  country varchar(255) not null,
  state varchar(255) not null,
  purchaseid int not null,
  foreign key (purchaseid) references purchase_cart(purchaseid)
  );

  
-- data manipulation time -- 
-- brand inseretion -- 
insert into brands (brandid,brandname)
values ('1', 'Gildan');
insert into brands(brandid,brandname)
values ('2','District');
insert into brands(brandid,brandname)
values ('3','BELLA+CANVAS');
insert into brands(brandid,brandname)
values ('4','Port and COMPANY');
select * from brands;
-- brands complete --

-- products--
select * from products;
-- Gildan Shirts --
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('1','T-Shirt', 'Softstyle T-Shirt','Very cool shirt kinda based ngl','5.00','White','Large','1','200');
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('2','T-Shirt', 'Softstyle CVC-Tee','Very cool shirt kinda based ngl','3.00','Black','Small','1','100');
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('3','T-Shirt', 'Gildan Performance T-Shirt','Very cool shirt kinda based ngl','5.00','Black','Large','1','50');

-- District Shirts --
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('4','T-Shirt', 'District Perfect Weight Tee','John Wick wore this once','12000.00','Black','Large','2','1');
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('5','T-Shirt', 'District Re-Tee','Made from the skin of the manticore','1.00','Gold','Large','2','1');

-- Bella Canvas Shirts--
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('7','T-Shirt', 'Unisex Jersey Short Sleeve Shirt','Very cool shirt kinda based ngl','5.00','Black','Large','3','200');
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('8','T-Shirt', 'Bella + Canvas Shirt ','Very cool shirt kinda based ngl','5.00','Green','Large','3','40');

-- Port and Company Shirts--
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('9','T-Shirt', 'Port and Company Shirt','Very cool shirt kinda based ngl','5.00','White','Large','4','200');
insert into products (productid,productline,productname,productdesc,price,colorid,size,brandid,quantity)
values ('10','T-Shirt', 'Port and Company Shirt','Very cool shirt kinda based ngl','5.00','White','Large','4','200');

select * from users;

insert into users (username,password,email) values ('goku', 'goku','goku@gmail.com');
insert into users (username,password,email) values ('rick' , 'roll', 'rickroll12@gmail.com');

select * from products;






