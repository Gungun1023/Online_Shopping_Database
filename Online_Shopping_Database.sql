     create database onlineshopping;
        use onlineshopping ;
        
        #TABLES
        
	create table user(
    user_id int auto_increment primary key,
    username varchar(50),
    email varchar(50),
    password varchar (30),
    address varchar(100),
    phone_number varchar(20));
insert into user(username, email, password, address, phone_number) values('Gungun','singhalgungun6@gmail.com','gunnu12','jaipur','9782208398');
insert into user(username, email, password, address, phone_number) values('saloni','singhalsaloni6@gmail.com','salo12','kota','2182208398');
insert into user(username, email, password, address, phone_number) values('mahima','mahima@gmail.com','mahi12','alwar','67808398');
insert into user(username, email, password, address, phone_number) values('nitin','nitin6@gmail.com','nitin12','kherli','2208398');
insert into user(username, email, password, address, phone_number) values('mitisha','meet@gmail.com','meet1245','jaipur','56208398');
insert into user(username, email, password, address, phone_number) values('vishal','vishal@gmail.com','vish12','kota','8708398');
insert into user(username, email, password, address, phone_number) values('sohan','sohann6@gmail.com','soh12','alwar','97398');
insert into user(username, email, password, address, phone_number) values('mohit','mohit@gmail.com','mohi12','mumbai','974568398');
insert into user(username, email, password, address, phone_number) values('rohit','rohit6@gmail.com','rohi12','delhi','978398');
insert into user(username, email, password, address, phone_number) values('lovey','lovey6@gmail.com','love122','gurugram','67808398');
select *from user;

 	create table  Category (
category_id  int auto_increment primary key,
category_name varchar(50));
insert into  Category (category_name) values ('Electronics'), ('fashion'), ('Books'), ('grocery'),('beauty'),
('home'),('travel'),('toys'),('pharmacy'),('furniture'),('sports');
select*from Category;

 	create table  Cart1 (
    cart_id int auto_increment primary key,
    user_id int,
    product_id int,
    quantity int,
    date  TIMESTAMP,
    foreign key (user_id) references user(user_id));
    insert into  Cart1(user_id, product_id, quantity, date) values (1, 1, 2, now()), (1, 2, 3, now()) ,(2,3,1,now()),(4,5,3,now()),
(6,8,4, now()),(8,10,2,now()),(9,2,1,now());
select *from Cart1;


 	create table product2(
 product_id int auto_increment primary key,
    product_name varchar(100),
    about text,
    price decimal(10, 2),
    category_id int,
    cart_id int,
    foreign key (category_id) references Category(category_id),
      foreign key (cart_id) references Cart1(cart_id));
      insert into Product2 (product_name, about, price, category_id,cart_id) values ('apple', 'High-quality smartphone with advanced features', 500.00, 1,1),
('T-shirt', 'Comfortable cotton t-shirt for everyday wear', 20.00, 2,1),('Introduction to SQL', 'Comprehensive guide to SQL programming', 30.00, 3,1),
('aashirwaad flour', 'it is best for health ',120.99,4,2),('dr,seth','best sunscreen',600.00,5,3),
('gas stoves',' for kitchen',5678.00,6,3),('indigo flight','book tickets',1000.00, 7,4),('toy car','car for kids',345.00,8,5),
('sumo','for cold',23.00,9,6),('chair',' comfortable',567.00,10,7),('shoes','comfortable for running',459.00,11,6),('samsung','High-quality smartphone with advanced features',567890.00,1,6),
('shirt','Comfortable cotton t-shirt for everyday wear',345.00,2,5),('Introduction to DSA', 'Comprehensive guide to DSA programming', 40.00, 3,4),
('daal', 'it is best for health ',12.99,4,3);
select *from Product2;

 	create table Order1 (
    order_id int auto_increment primary key,
    user_id int ,
    order_date timestamp,
    unit_price decimal(10, 2),
    quantity int,
     total_amount  decimal(10, 2),
    foreign key  (user_id) references User(user_id));
insert into Order1 (user_id, order_date,  unit_price, quantity, total_amount ) values (1, NOW(), 150.00,1,150.00) ,(2,now(),40.00,4,160.00),(3,now(),20.00,2, 40.00), (4,now(),10.00,1,10.00),
(5,now(),50.00,5, 250.00),(6,now(),30.00,3,90.00 );
select*from Order1;

 	create table Payment (
    payment_id  int auto_increment primary key,
    user_id int  unique,
    order_id int  unique,
    payment_date timestamp,
    payment_amount decimal(10, 2),
    payment_method varchar(50),
    paymentStatus varchar(20),
    foreign key (user_id) references User(user_id),
    foreign key (order_id) references Order1(order_id));
insert into  Payment (user_id, order_id, payment_date, payment_amount, payment_method,paymentStatus) values (1, 1, now(), 170.00, 'Credit Card','completed'),
(2,2,now(),123.00,'cash on delivery','completed'),(4,3,now(),234.00,'netbanking','completed'),(6,4,now(),34.00,'UPI', 'completed'),(8,5,now(),456.99,'credit card','completed'),
(9,6,now(),345.67,'EMI','completed');
select*from payment;


