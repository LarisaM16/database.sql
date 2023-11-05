create database carturesti;
use carturesti;

 
	create table discount(
    id int auto_increment primary key,
	discount_name varchar(10),
    start_date date,
    discount_percent int
    );
alter table discount add column end_date date;
 

INSERT INTO discount (discount_name, start_date, end_date, discount_percent)
VALUES
  ('Discount1', '2023-10-30', '2023-11-30', 10),
  ('Discount2', '2023-10-15', '2023-12-15', 20),
  ('Discount3', '2023-11-15', '2023-11-30', 25), 
  ('Discount4', '2023-11-27', '2023-12-10', 30),
  ('Discount5', '2023-11-19', '2023-11-30', 15);  
 
select * from discount;

	CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_of_books VARCHAR(30),
    price FLOAT,
    publishing VARCHAR(50),
    country_of_origin VARCHAR(10),  
    id_discount INT,
    FOREIGN KEY (id_discount) REFERENCES discount(id)
);
    
alter table products  modify price float;
alter table products modify country_of_origin varchar(50);
alter table products
add foreign key(id_discount) references discount(id);

desc products;

INSERT INTO products (type_of_books, price, publishing, country_of_origin, id_discount)
VALUES
  ('Audiobooks', 29.99, 'Polirom', 'Germany,USA,Romania,Italy', 1),
  ('Magazines', 109.99, 'Humanitas', 'USA,Romania,France,Spain', 2),
  ('Home & Deco', 100.99, 'Kikkerland', 'Spain,UK,China,Germany, Romania', 1),
  ('Art and Architecture', 200.0, 'Warner Bros. Pictures', 'Japan,USA, UK, France,Romania,Italy', 3),
  ('Linguistics, Dictionaries', 50.0, 'UPrestige', 'USA,Romania,France,Spain,Germany', 4),
  ('Technique and Technology', 29.99, 'M.A.S.T.', 'Japan,USA, UK, France,Romania,Italy,Germany', 2);
  
  select * from products;


 
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity_of_pieces INT,
    order_status VARCHAR(20),
    order_value FLOAT,
    type_of_delivery VARCHAR(20),
    order_placement_date DATE
);
ALTER TABLE orders
ADD FOREIGN KEY (id) REFERENCES products(id);

     
   INSERT INTO orders (quantity_of_pieces, order_status, order_value, type_of_delivery, order_placement_date)
VALUES
  (7, 'In progress', 39.98, 'Standard', '2023-10-30'),
  (9, 'Shipped', 24.99, 'Express', '2023-10-29'),
  (8, 'Pending', 47.97, 'Standard', '2023-10-31'),
  (12, 'Pending', 59.98, 'Express', '2023-10-28'),
  (10, 'Completed', 59.98, 'Standard', '2023-10-28'),
  (6, 'In progress', 59.98, 'Express', '2023-10-28');

SELECT id FROM products;
select * from orders;

create table clients(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    second_name varchar(20),
    address VARCHAR(50),
    phone_number VARCHAR(15),
    id_order INT,
    id_discount INT,
    FOREIGN KEY (id_order)
        REFERENCES orders (id),
    FOREIGN KEY (id_discount)
        REFERENCES discount (id)
);

 alter table clients add column email varchar(20);
 alter table clients modify email varchar(40);
 alter table clients add column card int;
 alter table clients modify card  varchar(50);
 alter table clients drop column second_name;
 
INSERT INTO clients (first_name, last_name, address, phone_number, id_order, id_discount, email, card)
VALUES
  ('John', 'Doe', '123 Main St', '0756090655', 1, 1, 'john.doe@example.com', '1234-5678-9012-3456'),
  ('Jane', 'Smith', '456 Elm St', '0773345767', 2, 2, 'jane.smith@example.com', '9876-5432-2109-8765'),
  ('Paula', 'Antonescu', '156 IS VL', '0787999008', 3, 2, 'paula.antonescu@example.com', '9786-5232-2249-8665'),
  ('Dan', 'Smok', 'BT  str. Florilor ', '0774553367', 4, 2, 'dan.smok@example.com', '9876-5432-2109-8765'),
  ('Antony', 'Chung', 'Bucuresti, str Luminii', '0877123567', 5, 2, 'antony.chung@example.com', '9876-5432-2109-8765'),
  ('Adrian', 'Pop', '456 Elm St', '0877123567', 3, 2, 'adrian.pop@example.com', '9876-5432-2109-8765');
  
  select * from clients;  
  
CREATE TABLE shopping_cart (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    id_product INT,
    quantity INT,
    FOREIGN KEY (id_client) REFERENCES clients (id),
    FOREIGN KEY (id_product) REFERENCES products (id)
    );

 drop table shopping_cart;
INSERT INTO shopping_cart (id_client, id_product, quantity)
VALUES
  (1,1, 2),
  (2,3, 1),
  (1,2, 3),
  (4,5, 6),
  (3,6, 2);
  
  select * from shopping_cart; 

CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_type VARCHAR(10),
    payment_status VARCHAR(10),
    order_id INT,  
    FOREIGN KEY (order_id) REFERENCES orders(id)  
);    
 

INSERT INTO payments (payment_type, payment_status, order_id)
VALUES
  ('ramburs', 'Pending', 1),
  ('PayU', 'Complete', 2),
  ('PayPal', 'Complete', 3),
  ('ramburs', 'Pending', 5),
  ('PayPal', 'In progress', 4),
  ('ramburs', 'In progress', 2);

alter table payments modify payment_status varchar(50);
select * from payments;
desc payments;

select * from  discount;
select * from  orders;


update products set price=1500 where id=1;
update discount set discount_percent=10, discount_name="Discount2" where id=1;
update orders set quantity_of_pieces=4 where id=4;
update orders set order_value=109  where id=5;
update orders set order_value=199 where id=6;
update clients set card= 1234-9876-99999 where id=5;

alter table products add column stock int default 1;

select * from products;

update products set price=29.99, stock=2 where id=7;
update products set price=price + price* 0.1 where id_discount=1;

select country_of_origin from products;	
select * from products where country_of_origin in ('USA');
select first_name, last_name from clients;

select * from clients where first_Name = 'John';

select * from products where price >'29.99';

delete from shopping_cart where id=1;

select * from products where country_of_origin= 'Germany,USA,Romania,Italy';
select * from products where country_of_origin <>'UK';

 update payments set payment_status = 'return' where id = '9';
select * from payments;

 
select COUNT(*) from clients;
select COUNT(*) from payments;
select COUNT('UK') from products;

select sum(id_product) from shopping_cart;

select type_of_books,id, min(price) from products
group by type_of_books,id;

select * from clients order by last_name asc;

select * from clients order by first_name, id_order desc;
select * from products  order by price desc, type_of_books;

 
SELECT * FROM clients
CROSS JOIN products;
 

