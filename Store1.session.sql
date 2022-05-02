INSERT INTO salesperson (first_name, last_name, email) VALUES
('Dana', 'Dash', 'musicguru@gmail.com'),
('grahm', 'Hopskins', 'preist@hotmail.com'),
('penguin', 'returns', 'batmansenemy@jillhouse.com');

INSERT INTO customer (first_name, last_name, email) VALUES
('Cat', 'woman', 'freelance@gmail.com'),
('bubbles', 'anonamous', 'powerpuff@hotmail.com'),
('mickey', 'rourke', 'spidy@enemy.com');

INSERT INTO mechanic(first_name, last_name, invoice) VALUES
('Crazy','Mec', '5459856'),
('lou','Blue', '5648556'),
('Frido','its go time', '5678390');

INSERT INTO car_sold(make, model, invoice, price, vin) VALUES
('lambo','the newest one', '54544449856', 200000, 'ZH873450803724EIE'),
('rolls royes','rolls royce', '56444448556', 300000, 'LJK89345JKDF9W80R'),
('hoopty','the old one', '56784444390', 15000, 'KLDJSF9873983SKJ');

INSERT INTO repair(vin) VALUES
('545HJJTFJHF9856'),
('564GLJGKJGK8556'),
('GJHGHGMB,5678390');

INSERT INTO car_sold(salesperson_id, customer_id) VALUES
(1, 1),
(1, 2),
(3, 3),
(2, 1);

INSERT INTO mechanic_repair(repair_id, mechanic_id) VALUES
(1, 1),
(1, 2),
(3, 3),
(2, 1);

INSERT INTO repair(customer_id) VALUES
(1),
(2),
(3);













DROP TABLE IF EXISTS salesperson CASCADE;
CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(13),
    email VARCHAR(50)

);
DROP TABLE IF EXISTS mechanic CASCADE;
CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    invoice TEXT,
    first_name VARCHAR(100),
    last_name VARCHAR(13)
);

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

DROP TABLE IF EXISTS car_sold CASCADE;
CREATE TABLE car_sold(
    car_sold_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    vin VARCHAR(50),
    invoice TEXT,
    price DECIMAL(8,2),
    salesperson_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);



DROP TABLE IF EXISTS mechanic_repair CASCADE;
CREATE TABLE mechanic_repair(
    mechanic_id INTEGER NOT NULL,
    repair_id INTEGER NOT NULL,
    FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
    FOREIGN KEY(repair_id) REFERENCES repair(repair_id)
);


DROP TABLE IF EXISTS parts_inventory CASCADE;
CREATE TABLE parts_inventory(
    parts_inventory_id SERIAL PRIMARY KEY,
    repair_id INTEGER NOT NULL,
    vin VARCHAR(50),
    FOREIGN KEY (repair_id) REFERENCES repair(repair_id)
);

DROP TABLE IF EXISTS repair CASCADE;
CREATE TABLE repair(
    repair_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    vin VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

