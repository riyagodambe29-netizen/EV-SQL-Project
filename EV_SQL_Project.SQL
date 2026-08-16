CREATE DATABASE EV;
USE EV;
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    customer_id INT,
    brand VARCHAR(30),
    model VARCHAR(50),
    battery_capacity_kwh DECIMAL(5,2),
    vehicle_type ENUM('Car', 'Bike', 'Bus', 'Truck'),
    manufacture_year YEAR
    );
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender ENUM('MALE','FEMALE','OTHER'),
    age INT,
    city_id INT,
    membership_type ENUM('Basic','Silver','Gold','Premium'),
    join_date DATE
    
);
ALTER TABLE vehicles
ADD CONSTRAINT fk_vehicle_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);


INSERT INTO customers
(customer_id, first_name, last_name, gender, age, city_id, membership_type, join_date)
VALUES
(101,'Aarav','Sharma','MALE',28,1,'Gold','2024-01-15'),
(102,'Ananya','Patel','FEMALE',25,2,'Silver','2024-02-10'),
(103,'Vivaan','Singh','MALE',32,3,'Premium','2024-03-05'),
(104,'Diya','Verma','FEMALE',29,4,'Basic','2024-04-12'),
(105,'Arjun','Gupta','MALE',35,5,'Gold','2024-05-20'),
(106,'Meera','Joshi','FEMALE',27,6,'Silver','2024-06-08'),
(107,'Kabir','Nair','MALE',31,7,'Premium','2024-07-18'),
(108,'Isha','Kapoor','FEMALE',24,8,'Basic','2024-08-09'),
(109,'Rohan','Yadav','MALE',30,9,'Gold','2024-09-14'),
(110,'Sneha','Kulkarni','FEMALE',26,10,'Premium','2024-10-01'),
(111,'Aditya','Mishra','MALE',34,1,'Gold','2024-02-15'),
(112,'Pooja','Rao','FEMALE',29,2,'Silver','2024-03-18'),
(113,'Karan','Mehta','MALE',27,3,'Basic','2024-04-22'),
(114,'Neha','Sinha','FEMALE',31,4,'Premium','2024-05-30'),
(115,'Yash','Patil','MALE',26,5,'Gold','2024-06-12'),
(116,'Riya','Desai','FEMALE',23,6,'Silver','2024-07-07'),
(117,'Harsh','Jain','MALE',33,7,'Premium','2024-08-16'),
(118,'Nikita','Chauhan','FEMALE',28,8,'Basic','2024-09-05'),
(119,'Siddharth','Bansal','MALE',36,9,'Gold','2024-10-10'),
(120,'Kavya','Iyer','FEMALE',24,10,'Silver','2024-11-14'),
(121,'Rahul','Kumar','MALE',29,1,'Premium','2024-01-28'),
(122,'Priya','Shah','FEMALE',30,2,'Gold','2024-02-25'),
(123,'Aman','Verma','MALE',27,3,'Silver','2024-03-14'),
(124,'Simran','Kaur','FEMALE',26,4,'Basic','2024-04-08'),
(125,'Vikas','Reddy','MALE',35,5,'Premium','2024-05-19'),
(126,'Anjali','Nair','FEMALE',32,6,'Gold','2024-06-21'),
(127,'Rakesh','Pandey','MALE',38,7,'Silver','2024-07-30'),
(128,'Tanvi','Joshi','FEMALE',25,8,'Basic','2024-08-28'),
(129,'Manish','Agarwal','MALE',31,9,'Premium','2024-09-22'),
(130,'Shruti','Malhotra','FEMALE',27,10,'Gold','2024-10-18');

INSERT INTO vehicles
(vehicle_id, customer_id, brand, model, battery_capacity_kwh, vehicle_type, manufacture_year)
VALUES
(1001,101,'Tesla','Model 3',60.00,'Car',2023),
(1002,102,'Tata','Nexon EV',40.50,'Car',2022),
(1003,103,'MG','ZS EV',50.30,'Car',2023),
(1004,104,'BYD','Atto 3',60.40,'Car',2024),
(1005,105,'Mahindra','XUV400',39.40,'Car',2023),
(1006,106,'Ather','450X',3.70,'Bike',2024),
(1007,107,'Ola','S1 Pro',4.00,'Bike',2023),
(1008,108,'TVS','iQube',3.40,'Bike',2022),
(1009,109,'Hero','Vida V1',3.90,'Bike',2024),
(1010,110,'Tesla','Model Y',75.00,'Car',2024),
(1011,111,'Hyundai','Kona Electric',39.20,'Car',2023),
(1012,112,'Kia','EV6',77.40,'Car',2024),
(1013,113,'BMW','i4',83.90,'Car',2024),
(1014,114,'Audi','Q8 e-tron',95.00,'Car',2023),
(1015,115,'Mercedes','EQS',107.80,'Car',2024),
(1016,116,'Volvo','XC40 Recharge',78.00,'Car',2023),
(1017,117,'Citroen','eC3',29.20,'Car',2024),
(1018,118,'MG','Comet EV',17.30,'Car',2024),
(1019,119,'Tata','Tiago EV',24.00,'Car',2023),
(1020,120,'BYD','Seal',82.50,'Car',2024),
(1021,121,'Ola','S1 Air',3.00,'Bike',2024),
(1022,122,'Ather','Rizta',2.90,'Bike',2024),
(1023,123,'Hero','Vida V2',3.80,'Bike',2025),
(1024,124,'TVS','X',4.40,'Bike',2025),
(1025,125,'Simple','One',5.00,'Bike',2024),
(1026,126,'Bajaj','Chetak',3.20,'Bike',2023),
(1027,127,'Switch','EiV12',231.00,'Bus',2024),
(1028,128,'Volvo','7900 Electric',250.00,'Bus',2023),
(1029,129,'Tata','Ultra EV',180.00,'Truck',2024),
(1030,130,'Ashok Leyland','Boss Electric',220.00,'Truck',2025);

SELECT*FROM CUSTOMERS;
SELECT*FROM VEHICLES;

SHOW TABLES;

-- join tables

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    v.vehicle_type,
    v.brand,
    v.model
FROM customers c
JOIN vehicles v
ON c.customer_id = v.customer_id;

-- total vehicles for each brand
SELECT brand, COUNT(*) AS total_vehicles
FROM vehicles
GROUP BY brand;
 
-- Show only Tesla vehicles
SELECT c.first_name, c.last_name, v.brand, v.model
FROM customers c
join vehicles v
on c.customer_id= v.customer_id
where v.brand ='Tesla'; 


-- Age is greater than 30
select* from customers 
where age >30;

-- Total vehicles
select count(*) as Total_vehicles
from vehicles;

-- Average battery capacity by vehicle type
SELECT vehicle_type,
       ROUND(AVG(battery_capacity_kwh),2) AS avg_capacity
FROM vehicles
GROUP BY vehicle_type;

--  Gold members and their vehicles
SELECT c.first_name,
       c.last_name,
       c.membership_type,
       v.brand,
       v.model
FROM customers c
JOIN vehicles v
ON c.customer_id = v.customer_id
WHERE c.membership_type = 'Gold';

--  Rank vehicles by battery capacity
SELECT
    brand,
    model,
    battery_capacity_kwh,
    RANK() OVER (ORDER BY battery_capacity_kwh DESC) AS battery_rank
FROM vehicles;

-- sum of battery capacity
select sum(battery_capacity_kwh )as total_battery_capacity
from vehicles;

-- battery capacity by brand
Select 
brand,
sum(battery_capacity_kwh) as total_battery_capacity
from vehicles
group by brand;

-- Total Battery Capacity for Cars Only
SELECT SUM(battery_capacity_kwh) AS total_battery_capacity
FROM vehicles
WHERE vehicle_type = 'Car';

-- total battery capacity of all vehicles
select sum(battery_capacity_kwh) As total_battery_capacity
from vehicles;

-- total battery capacity of only Bike vehicles.
select SUM(battery_capacity_kwh) AS total_battery_capacity
from vehicles
where vehicle_type ='Bike';

DESCRIBE vehicles;
 -- total battery capacity of vehicles manufactured in 2024.
 select SUM(battery_capacity_kwh)as total_battery_capacity_2024
 from vehicles
 WHERE manufacture_year = 2024;
 
 -- Total battery capacity by manufacture year
SELECT manufacture_year,
       SUM(battery_capacity_kwh) AS total_capacity
FROM vehicles
GROUP BY manufacture_year;

CREATE TABLE charging_stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(50),
    city_id INT,
    charger_type ENUM('AC','DC Fast','Supercharger'),
    number_of_ports INT,
    max_power_kw DECIMAL(6,2),
    status ENUM('Active','Maintenance','Inactive')
);

INSERT INTO charging_stations
(station_id, station_name, city_id, charger_type, number_of_ports, max_power_kw, status)
VALUES
(201,'ChargeHub Mumbai Central',1,'DC Fast',8,120,'Active'),
(202,'EV Power Pune',2,'AC',6,22,'Active'),
(203,'GreenCharge Bengaluru',3,'Supercharger',12,250,'Active'),
(204,'VoltPoint Hyderabad',4,'DC Fast',10,150,'Active'),
(205,'SparkCharge Delhi',5,'Supercharger',16,250,'Active'),
(206,'EcoCharge Chennai',6,'AC',8,22,'Active'),
(207,'RapidEV Ahmedabad',7,'DC Fast',10,120,'Maintenance'),
(208,'ChargeZone Kolkata',8,'AC',6,22,'Active'),
(209,'Electro Jaipur',9,'DC Fast',8,60,'Active'),
(210,'PowerGrid Lucknow',10,'AC',4,22,'Inactive'),
(211,'Tesla Super Mumbai',1,'Supercharger',20,250,'Active'),
(212,'FastVolt Pune',2,'DC Fast',12,180,'Active'),
(213,'EcoPlug Bengaluru',3,'AC',8,22,'Active'),
(214,'ChargeMax Hyderabad',4,'DC Fast',10,150,'Active'),
(215,'Energy Point Delhi',5,'Supercharger',18,250,'Active'),
(216,'GreenPlug Chennai',6,'AC',6,22,'Maintenance'),
(217,'QuickCharge Ahmedabad',7,'DC Fast',8,120,'Active'),
(218,'EV Connect Kolkata',8,'AC',6,22,'Active'),
(219,'SmartCharge Jaipur',9,'DC Fast',10,180,'Active'),
(220,'UrbanCharge Lucknow',10,'AC',5,22,'Active'),
(221,'HighVolt Mumbai',1,'Supercharger',24,250,'Active'),
(222,'ChargeX Pune',2,'DC Fast',12,150,'Active'),
(223,'EcoVolt Bengaluru',3,'AC',10,22,'Active'),
(224,'RapidCharge Hyderabad',4,'DC Fast',8,120,'Active'),
(225,'MegaCharge Delhi',5,'Supercharger',20,250,'Active'),
(226,'PowerEV Chennai',6,'AC',8,22,'Active'),
(227,'Green Energy Ahmedabad',7,'DC Fast',12,180,'Active'),
(228,'UltraCharge Kolkata',8,'Supercharger',16,250,'Active'),
(229,'VoltHub Jaipur',9,'DC Fast',10,150,'Maintenance'),
(230,'FutureCharge Lucknow',10,'AC',6,22,'Active');

CREATE TABLE payment(
    payment_id INT PRIMARY KEY,
    vehicle_id INT,
    payment_date DATE,
    amount DECIMAL(8,2),
    payment_method ENUM('UPI','Credit Card','Debit Card','Wallet','Cash'),
    payment_status ENUM('Success','Pending','Failed'),
    transaction_id VARCHAR(30),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
INSERT INTO payment
(payment_id, vehicle_id, payment_date, amount, payment_method, payment_status, transaction_id)
VALUES
(301,1001,'2024-01-10',850.00,'UPI','Success','TXN100001'),
(302,1002,'2024-01-12',620.50,'Credit Card','Success','TXN100002'),
(303,1003,'2024-01-15',980.75,'Debit Card','Success','TXN100003'),
(304,1004,'2024-01-18',1200.00,'Wallet','Success','TXN100004'),
(305,1005,'2024-01-20',710.50,'Cash','Success','TXN100005'),
(306,1006,'2024-01-22',180.00,'UPI','Success','TXN100006'),
(307,1007,'2024-01-24',220.00,'Wallet','Pending','TXN100007'),
(308,1008,'2024-01-27',175.50,'Debit Card','Success','TXN100008'),
(309,1009,'2024-01-29',195.00,'UPI','Success','TXN100009'),
(310,1010,'2024-02-01',1450.00,'Credit Card','Success','TXN100010'),
(311,1011,'2024-02-03',680.00,'Wallet','Success','TXN100011'),
(312,1012,'2024-02-05',990.00,'UPI','Success','TXN100012'),
(313,1013,'2024-02-08',1100.00,'Debit Card','Success','TXN100013'),
(314,1014,'2024-02-10',1250.50,'Credit Card','Success','TXN100014'),
(315,1015,'2024-02-13',1600.00,'UPI','Success','TXN100015'),
(316,1016,'2024-02-15',875.00,'Cash','Success','TXN100016'),
(317,1017,'2024-02-18',420.00,'Wallet','Pending','TXN100017'),
(318,1018,'2024-02-20',310.00,'UPI','Success','TXN100018'),
(319,1019,'2024-02-22',560.00,'Debit Card','Success','TXN100019'),
(320,1020,'2024-02-25',1500.00,'Credit Card','Success','TXN100020'),
(321,1021,'2024-02-27',140.00,'UPI','Success','TXN100021'),
(322,1022,'2024-03-01',130.00,'Wallet','Success','TXN100022'),
(323,1023,'2024-03-03',165.00,'Cash','Success','TXN100023'),
(324,1024,'2024-03-05',240.00,'Debit Card','Success','TXN100024'),
(325,1025,'2024-03-07',280.00,'UPI','Failed','TXN100025'),
(326,1026,'2024-03-10',150.00,'Wallet','Success','TXN100026'),
(327,1027,'2024-03-12',3200.00,'Credit Card','Success','TXN100027'),
(328,1028,'2024-03-15',3450.00,'UPI','Success','TXN100028'),
(329,1029,'2024-03-18',2900.00,'Debit Card','Success','TXN100029'),
(330,1030,'2024-03-20',3100.00,'Credit Card','Success','TXN100030');

-- sum amount by payment method
select SUM(AMOUNT)AS TOTAL FROM PAYMENT;

-- each method
SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method;

-- payment method by payments
SELECT
    payment_method,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method;

-- AVG Amount 
SELECT
payment_method,
AVG(amount) AS average_amount
FROM payment
GROUP BY payment_method;

-- highest amount of payment
SELECT
    payment_method,
    MAX(amount) AS highest_amount
FROM payments
GROUP BY payment_method;

-- lowest amount of payments
SELECT
payment_method,
min(amount) AS LOWEST_AMOUNT
FROM payments
GROUP BY payment_method;

-- Payment methods with total amount greater than ₹3000
SELECT payment_method,
       SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
HAVING SUM(amount) > 3000;

-- Order by
SELECT *
FROM payments
ORDER BY amount DESC;
