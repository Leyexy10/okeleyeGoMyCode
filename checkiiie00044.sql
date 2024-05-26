Create database checkpoint05
go

use checkpoint05;
go

create table customer(
customer_id INT Primary key,
customer_Name VARCHAR(50),
customer_Tel VARCHAR(50)
);
go

CREATE TABLE Product (
Product_id INT Primary key,
product_name VARCHAR(50),
category VARCHAR(50),
Price float
);
go

CREATE TABLE Orders (
primary key (customer_id,product_id),
customer_id INT foreign key references customer,
Product_id INT foreign key references product,
OrderDate DATE,
quantity INT,
total_amount float,
);
go

INSERT INTO Customer (Customer_id, customer_Name, customer_Tel)
VALUES
(101, 'Alice Johnson', '555-123-4567'),
(102, 'Bob Smith', '555-987-6543'),
(103, 'Carol Lee', '555-555-5555'),
(104, 'David Brown', '555-888-7777'),
(105, 'Eva White', '555-444-3333'),
(106, 'Frank Adams', '555-222-1111'),
(107, 'Grace Miller', '555-666-9999'),
(108, 'Henry Clark', '555-777-8888'),
(109, 'Isabel Garcia', '555-333-2222'),
(110, 'Jack Turner', '555-999-4444'),
(111, 'Karen Hall', '555-111-0000'),
(112, 'Liam Harris', '555-555-7777'),
(113, 'Mia Martinez', '555-888-5555'),
(114, 'Nora Scott', '555-444-7777'),
(115, 'Zara Khan', '555-999-1111');
go

INSERT INTO Product (Product_id, product_name, category, Price)
VALUES
(201, 'Laptop', 'Doohickeys', 899.99),
(202, 'Smartphone', 'Electronics', 599.00),
(203, 'Desk Chair', 'Gadget', 149.99),
(204, 'Headphones', 'widgets', 79.99),
(205, 'Coffee Maker', 'Gadget', 49.99),
(206, 'Bluetooth Speaker', 'Electronics', 129.99),
(207, 'Fitness Tracker', 'Health', 89.99),
(208, 'Wireless Mouse', 'Electronics', 19.99),
(209, 'Plant Pot', 'Doohickeys', 24.99),
(210, 'External Hard Drive', 'Electronics', 119.99),
(211, 'Yoga Mat', 'widgets', 29.99),
(212, 'Sunglasses', 'Fashion', 59.99),
(213, 'Cookware Set', 'Gadgets', 199.99),
(214, 'Backpack', 'Accessories', 39.99),
(215, 'Wireless Earbuds', 'widgets', 79.99);
go

INSERT INTO Orders (Customer_id, Product_id, OrderDate, quantity, total_amount)
VALUES
(101, 201, '2024-05-01', 2, 1799.98),
(102, 202, '2024-05-02', 1, 599.00),
(103, 203, '2024-05-03', 3, 449.97),
(104, 204, '2024-05-04', 2, 159.98),
(105, 205, '2024-05-05', 8, 49.99),
(106, 206, '2024-05-06', 1, 129.99),
(107, 207, '2024-05-07', 2, 179.98),
(108, 208, '2024-05-08', 3, 59.97),
(109, 209, '2024-05-09', 6, 24.99),
(110, 210, '2024-05-10', 1, 119.99),
(111, 211, '2024-05-11', 2, 59.98),
(112, 212, '2024-05-12', 1, 59.99),
(113, 213, '2024-05-13', 1, 199.99),
(114, 214, '2024-05-14', 2, 79.98),
(115, 215, '2024-05-15', 5, 399.95);

select customer.customer_name, product.category, orders.total_amount
from customer
join orders on customer.customer_id=orders.customer_id
join product on orders.product_id=product.product_id
where product.category in ('widgets','gadgets') and orders.quantity>=1
order by  customer.customer_name;

select customer.customer_name, product.category, orders.total_amount
from customer
join orders on customer.customer_id=orders.customer_id
join product on orders.product_id=product.product_id
where product.category in ('widgets') and orders.quantity>=1
order by  customer.customer_name;

select customer.customer_name, product.category, orders.total_amount
from customer
join orders on customer.customer_id=orders.customer_id
join product on orders.product_id=product.product_id
where product.category like ('%gadget%') and orders.quantity>=1
order by  customer.customer_name;

select customer.customer_name, product.category, orders.total_amount
from customer
join orders on customer.customer_id=orders.customer_id
join product on orders.product_id=product.product_id
where product.category in ('doohickeys') and orders.quantity>=1
order by  customer.customer_name;

select customer.customer_name,count(product.category) as product_category, orders.total_amount
from customer
join orders on customer.customer_id=orders.customer_id
join product on orders.product_id=product.product_id
where product.category in ('widgets','gadgets') 
group by  customer.customer_name, orders.total_amount
order by customer.customer_Name

select product.product_name, count(Orders.product_id), orders.quantity
from product
join orders on product.product_id=orders.product_id
where (Orders.product_id)>=1
group by product.product_name, orders.quantity

select customer.customer_Name, count(orders.product_id) as Ordering_frequency
from customer
join orders on customer.customer_id=orders.customer_id
group by customer.customer_Name, orders.product_id
order by orders.product_id desc

select product.product_name, count(orders.customer_id)as number_of_orders_placed, orders.quantity
from product
join orders on product.product_id=orders.product_id
group by product.product_name, orders.customer_id, orders.quantity
order by orders.quantity desc

select customer.customer_Name, count(orders.orderdate), orders.product_id
from customer
join orders on customer.customer_id=orders.customer_id
group by customer.customer_name, orders.product_id
having count(orders.orderdate)=7





