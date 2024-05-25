#Operator
 	select distinct user_id from user;
	select *from user order by username;
	select *from user where user_id between 2 and 4;
	select *from user where user_id not between 2 and 4;
	select*from user where username like '%a';
	select*from user limit 2;
	select*from user limit 2 offset 3;
	select *from user where user_id = 2 and  address='kota';
    select *from user where user_id = 2 or  address='kota';
	select *from user where user_id in (2,3,5) ;
	select *from user where user_id  not in (2,3,5) ;
	select *from user order by username;
    
    
    #AGGREGATOR
     	select max(unit_price)from order1;
		#select min(unit_price)from order1;
		#select avg(unit_price)from order1;
		select count(unit_price)from order1 where order_id=2;
		select sum(unit_price) from order1 where order_id =1;
        
	#DATA MANUPLATIONS OPERATION
     	update user set username='monty' where user_id = 3;
        select*from user;
 	 	delete from user where password='vish12';
		select*from user;


#JOINS 
 	select*from user inner join product2 on user.user_id=product2.product_id
   inner join order1 on  user.user_id=order1.order_id  inner join payment on  user.user_id=payment.payment_id;
 	select*from user left join product2 on user.user_id=product2.product_id left join order1 
    on  user.user_id=order1.order_id left join payment on  user.user_id=payment.payment_id;
	select*from user right join product2 on user.user_id=product2.product_id right join order1 
	on  user.user_id=order1.order_id right join payment on  user.user_id=payment.payment_id;
    
    
#SUBQURIES 
 	select *from payment where payment_amount > (select avg(payment_amount)from payment);
	select *from payment where payment_amount > (select min(payment_amount)from payment);
	SELECT MAX(payment_amount) FROM payment WHERE payment_amount < (SELECT MAX(payment_amount) FROM payment);
	select *from payment where payment_amount < (select Max(payment_amount)from payment);
	SELECT min(payment_amount) FROM payment WHERE payment_amount > (SELECT min(payment_amount) FROM payment); 
	(SELECT min(payment_amount) FROM payment WHERE payment_amount > (SELECT min(payment_amount) FROM payment));
 	SELECT * FROM Payment WHERE payment_method IN (SELECT DISTINCT payment_method FROM Payment WHERE paymentStatus = 'completed'); 
   SELECT payment_id, payment_amount,(SELECT MAX(payment_amount) FROM Payment) - payment_amount AS remaining_amount FROM Payment;
   SELECT user_id, AVG(payment_amount) AS avg_payment FROM Payment p1 WHERE paymentStatus = 'completed' GROUP BY user_id;

#trigger 

 	 	DELIMITER //
CREATE TRIGGER update_cart_total
AFTER INSERT ON Product2
FOR EACH ROW
BEGIN
UPDATE Cart1
SET cart_total = cart_total + NEW.price
WHERE cart_id = NEW.cart_id;
END;
	Inserting a product into the Product2 table
INSERT INTO Product2 (product_name, about, price, category_id, cart_id)
VALUES ('Laptop', 'Powerful laptop for productivity', 1200.00, 1, 1);

