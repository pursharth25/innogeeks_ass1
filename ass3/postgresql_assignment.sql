--ECOMMERCE ADMIN PANEL

TABLES:

create table customer(
 cust_id serial primary key,
	cust_fname varchar(20),
	cust_lname varchar(20),
	cust_addr varchar(100),
	cust_phoneno varchar(10),
	cust_email varchar(20),
	cust_password varchar(8),
	cust_pincode int
);

create table category(
  cat_id serial primary key,
  cat_name varchar(50)
	)
	
create table product(
  prod_id serial primary key,
	cat_id int references category(cat_id),
	prod_name varchar(50),
	prod_price float,
	prod_img varchar(100),
	prod_quantity int
	)
	
create table orders(
	order_id serial primary key,
	order_quantity int,
	total_amt float,
	cust_id int references customer(cust_id),
	prod_id int references product(prod_id),
	paid bool,
	track_order varchar(20)
	)
	
create table invoice(
	invoice_no serial primary key,
	cust_id int references customer(cust_id),
	order_id int references orders(order_id),
	prod_id int references product(prod_id) 
		
	)
	
--Inserting data in tables:

insert into category(cat_name) values('Clothing'),
('Electronics'),
('Fashoin'),
('Food')

insert into product(prod_name,prod_price,prod_img,prod_quantity,cat_id) values('Samsung SE',30000,'url',20,2),
	('Jacket',3000,'url',20,1),
	('Lamp',2000,'url',20,3),
	('Maggie',500,'url',15,4);

    insert into customer(cust_fname,
	cust_lname,
	cust_addr,
	cust_phoneno,
	cust_email,
	cust_password,
	cust_pincode) values('Pursharth','Maheshwari','Citylight','9000000000','abc@gmail.com','123','305001')
	
    insert into orders (cust_id,prod_id,order_quantity,total_amt,paid,track_order) values(1,1,100000,4,true,2345678)

    	insert into invoice(order_id,prod_id,cust_id) values(1,1,1)


--	update category set cat_id=1 where cat_id=5  to update values .

create view bill as
	select i.invoice_no,i.order_id,i.cust_id,cu.cust_fname,cu.cust_lname,p.prod_name,o.order_quantity,o.total_amt
	from invoice i
	inner join
	orders o
	on i.order_id=o.order_id
	inner join product p
	on i.prod_id=p.prod_id
	inner join 
	customer cu
	on i.cust_id=cu.cust_id
	
	select * from bill;


    create or replace function new_order()
	returns trigger
	language PLPGSQL
	as
	$$
	BEGIN
	 update product set prod_quantity = prod_quantity - new.order_quantity where prod_id=new.prod_id;
	 return new;
	END;
	
	$$
	
	create trigger tr
	after insert
	on orders
	for each row
	execute procedure new_order()
