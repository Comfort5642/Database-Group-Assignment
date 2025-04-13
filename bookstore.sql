create database bookstoredb;
use bookstoredb;


create table COUNTRY (
COUNTRY_ID INT PRIMARY KEY auto_increment,
COUNTRY_NAME varchar(20) NOT null
);

create table ADDRESS_STATUS (
STATUS_ID INT PRIMARY KEY auto_increment,
STATUS_NAME varchar(20) NOT null
);

create table PUBLISHER (
PUBLISHER_ID INT PRIMARY KEY auto_increment,
PUBLISHER_NAME varchar(200) not null
);


create table BOOK_LANGUAGE (
LANGUAGE_ID INT PRIMARY KEY auto_increment,
LANGUAGE_NAME varchar(200) NOT NULL
);


create table AUTHOR (
AUTHOR_ID INT PRIMARY KEY auto_increment,
AUTHOR_NAME varchar(100) NOT null
);


create table BOOKS (
BOOK_ID int primary key auto_increment,
TITLE varchar (200) not null,
ISBN VARCHAR (200),
PUBLISHER_ID INT,
LANGUAGE_ID INT,
PRICE DECIMAL (10, 2),
FOREIGN KEY (PUBLISHER_ID) REFERENCES PUBLISHER (PUBLISHER_ID),
FOREIGN KEY (LANGUAGE_ID) REFERENCES BOOK_LANGUAGE (LANGUAGE_ID)
);

create table BOOK_AUTHOR (
BOOK_ID INT,
AUTHOR_ID INT,
PRIMARY KEY (BOOK_ID, AUTHOR_ID),
FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID),
FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID)
);


CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(200) NOT NULL
);

CREATE TABLE ADDRESS (
    ADDRESS_ID INT PRIMARY KEY AUTO_INCREMENT,
    STREET_ADDRESS VARCHAR(255) NOT NULL,
    CITY VARCHAR(100) NOT NULL,
    STATE VARCHAR(100),
    POSTAL_CODE VARCHAR(20),
    COUNTRY_ID INT,
    FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY(COUNTRY_ID)
);

CREATE TABLE CUSTOMER_ADDRESS (
    CUSTOMER_ID INT,
    ADDRESS_ID INT,
    STATUS_ID INT,
    PRIMARY KEY (CUSTOMER_ID, ADDRESS_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
    FOREIGN KEY (STATUS_ID) REFERENCES ADDRESS_STATUS(STATUS_ID)
);


CREATE TABLE ORDER_STATUS (
    STATUS_ID INT PRIMARY KEY AUTO_INCREMENT,
    STATUS_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE SHIPPING_METHOD (
    SHIPPING_METHOD_ID INT PRIMARY KEY AUTO_INCREMENT,
    METHOD_NAME VARCHAR(100) NOT NULL
);
CREATE TABLE CUST_ORDER (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    ORDER_STATUS VARCHAR(50),
    SHIPPING_METHOD_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (SHIPPING_METHOD_ID) REFERENCES SHIPPING_METHOD(SHIPPING_METHOD_ID)
    );


CREATE TABLE ORDER_LINE (
    ORDER_LINE_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY INT,
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (ORDER_ID) REFERENCES CUST_ORDER(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);

CREATE TABLE ORDER_HISTORY (
    HISTORY_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT,
    STATUS VARCHAR(100),
    CHANGE_DATE DATE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES CUST_ORDER(ORDER_ID)
);



CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITLE VARCHAR(200) NOT NULL,
    ISBN VARCHAR(200),
    PUBLISHER_ID INT,
    LANGUAGE_ID INT,
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (PUBLISHER_ID) REFERENCES PUBLISHER(PUBLISHER_ID),
    FOREIGN KEY (LANGUAGE_ID) REFERENCES BOOK_LANGUAGE(LANGUAGE_ID)
);

use bookstoredb;

INSERT INTO PUBLISHER (PUBLISHER_ID, PUBLISHER_NAME) VALUES
(1, 'Bloomsbury'),
(2, 'Scholastic'),
(3, 'Pan Macmillan');


INSERT INTO AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES
(1, 'J.K. Rowling'),
(2, 'R.L. Stine'),
(3, 'David Baldacci'),
(4, 'Dan Brown');


INSERT INTO BOOK_LANGUAGE (LANGUAGE_ID, LANGUAGE_NAME) VALUES
(1, 'English'),
(2, 'Swahili'),
(3, 'French');

INSERT INTO COUNTRY (COUNTRY_ID, COUNTRY_NAME) VALUES
(1, 'Kenya'),
(2, 'Uganda'),
(3, 'Tanzania'),
(4, 'United States'),
(5, 'United Kingdom');


INSERT INTO books (TITLE, ISBN, PUBLISHER_ID, LANGUAGE_ID, PRICE) VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532743', 1, 1, 19.99),
('Harry Potter and the Chamber of Secrets', '9780747538486', 1, 1, 19.99),
('Harry Potter and the Prisoner of Azkaban', '9780747542155', 1, 1, 19.99),
('Harry Potter and the Goblet of Fire', '9780747546245', 1, 1, 19.99),
('Harry Potter and the Order of the Phoenix', '9780747551003', 1, 1, 19.99),
('Harry Potter and the Half-Blood Prince', '9780747581085', 1, 1, 19.99),
('Harry Potter and the Deathly Hallows', '9780747591053', 1, 1, 19.99);


INSERT INTO books (TITLE, ISBN, PUBLISHER_ID, LANGUAGE_ID, PRICE) VALUES
('Goosebumps: Welcome to Dead House', '9780590733272', 2, 1, 9.99),
('Goosebumps: Stay Out of the Basement', '9780590733289', 2, 1, 9.99),
('Goosebumps: Monster Blood', '9780590733296', 2, 1, 9.99),
('Goosebumps: Say Cheese and Die!', '9780590733302', 2, 1, 9.99),
('Goosebumps: Night of the Living Dummy', '9780590733319', 2, 1, 9.99);


INSERT INTO books (TITLE, ISBN, PUBLISHER_ID, LANGUAGE_ID, PRICE) VALUES
('Memory Man', '9781455582437', 3, 1, 14.99),
('The Camel Club', '9780446618906', 3, 1, 14.99),
('The Whole Truth', '9780446538908', 3, 1, 14.99),
('The Last Mile', '9781455586589', 3, 1, 14.99),
('The Escape', '9781455586596', 3, 1, 14.99);


INSERT INTO books (TITLE, ISBN, PUBLISHER_ID, LANGUAGE_ID, PRICE) VALUES
('The Da Vinci Code', '9780385504201', 3, 1, 15.99),
('Angels & Demons', '9780743486216', 3, 1, 15.99),
('Inferno', '9780385537858', 3, 1, 15.99),
('The Lost Symbol', '9780385504225', 3, 1, 15.99),
('Digital Fortress', '9780312273623', 3, 1, 15.99);



INSERT INTO ADDRESS_STATUS (STATUS_ID, STATUS_NAME) VALUES
(1, 'Current'),
(2, 'Old');


INSERT INTO SHIPPING_METHOD (SHIPPING_METHOD_ID, METHOD_NAME) VALUES
(1, 'Standard Delivery'),
(2, 'Express Delivery'),
(3, 'Next-Day Delivery');


INSERT INTO ORDER_STATUS (STATUS_ID, STATUS_NAME) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Cancelled');

INSERT INTO CUSTOMER (CUSTOMER_NAME) VALUES
('Olive Gathoni'),
('Timothy Kibunja'),
('Morgan Smith'),
('Murugi Ndungu'),
('Ken Doll');


INSERT INTO CUST_ORDER (CUSTOMER_ID, ORDER_DATE, ORDER_STATUS, SHIPPING_METHOD_ID)
VALUES 
(1, '2025-04-10', 'Pending', 1),  -- Olive Gathoni, Standard Delivery
(2, '2025-04-10', 'Pending', 2),  -- Timothy Kibunja, Express Delivery
(3, '2025-04-10', 'Shipped', 3),  -- Morgan Smith, Next-Day Delivery
(4, '2025-04-10', 'Delivered', 1);  -- Murugi Ndungu, Standard Delivery


INSERT INTO ORDER_HISTORY (ORDER_ID, STATUS, CHANGE_DATE) VALUES
(1, 'Pending', '2025-04-10'),
(2, 'Pending', '2025-04-10'),
(3, 'Shipped', '2025-04-10'),
(4, 'Delivered', '2025-04-10');

INSERT INTO ORDER_LINE (ORDER_ID, BOOK_ID, QUANTITY, PRICE) 
VALUES 
(1, 22, 2, 19.99),  -- Order 1, Book 'Harry Potter and the Philosopher\'s Stone', 2 copies, $19.99 each
(1, 23, 1, 19.99),  -- Order 1, Book 'Harry Potter and the Chamber of Secrets', 1 copy, $19.99
(2, 24, 3, 19.99),  -- Order 2, Book 'Harry Potter and the Prisoner of Azkaban', 3 copies, $19.99 each
(2, 25, 1, 19.99),  -- Order 2, Book 'Harry Potter and the Goblet of Fire', 1 copy, $19.99
(3, 26, 1, 19.99),  -- Order 3, Book 'Harry Potter and the Order of the Phoenix', 1 copy, $19.99
(3, 27, 2, 19.99),  -- Order 3, Book 'Harry Potter and the Half-Blood Prince', 2 copies, $19.99 each
(4, 28, 1, 19.99),  -- Order 4, Book 'Harry Potter and the Deathly Hallows', 1 copy, $19.99
(4, 29, 1, 9.99),   -- Order 4, Book 'Goosebumps: Welcome to Dead House', 1 copy, $9.99
(4, 30, 2, 9.99);   -- Order 4, Book 'Goosebumps: Stay Out of the Basement', 2 copies, $9.99 each


INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) 
VALUES 
(22, 1),  -- Harry Potter and the Philosopher's Stone -> J.K. Rowling
(23, 1),  -- Harry Potter and the Chamber of Secrets -> J.K. Rowling
(24, 1),  -- Harry Potter and the Prisoner of Azkaban -> J.K. Rowling
(25, 1),  -- Harry Potter and the Goblet of Fire -> J.K. Rowling
(26, 1),  -- Harry Potter and the Order of the Phoenix -> J.K. Rowling
(27, 1),  -- Harry Potter and the Half-Blood Prince -> J.K. Rowling
(28, 1),  -- Harry Potter and the Deathly Hallows -> J.K. Rowling
(29, 2),  -- Goosebumps: Welcome to Dead House -> R.L. Stine
(30, 2),  -- Goosebumps: Stay Out of the Basement -> R.L. Stine
(31, 2),  -- Goosebumps: Monster Blood -> R.L. Stine
(32, 2),  -- Goosebumps: Say Cheese and Die! -> R.L. Stine
(33, 2),  -- Goosebumps: Night of the Living Dummy -> R.L. Stine
(34, 3),  -- Memory Man -> David Baldacci
(35, 3),  -- The Camel Club -> David Baldacci
(36, 3),  -- The Whole Truth -> David Baldacci
(37, 3),  -- The Last Mile -> David Baldacci
(38, 3),  -- The Escape -> David Baldacci
(39, 4),  -- The Da Vinci Code -> Dan Brown
(40, 4),  -- Angels & Demons -> Dan Brown
(41, 4),  -- Inferno -> Dan Brown
(42, 4),  -- The Lost Symbol -> Dan Brown
(43, 4);  -- Digital Fortress -> Dan Brown


INSERT INTO ADDRESS (STREET_ADDRESS, CITY, STATE, POSTAL_CODE, COUNTRY_ID)
VALUES
('123 Moi Avenue', 'Nairobi', 'Nairobi County', '00100', 1),  -- Kenya address (Assuming Kenya's COUNTRY_ID is 1)
('456 Kenyatta Avenue', 'Mombasa', 'Coast', '80100', 1),  -- Mombasa address
('789 Thika Road', 'Thika', 'Kiambu County', '01000', 1),  -- Thika address
('101 Lang’ata Road', 'Nakuru', 'Nakuru County', '20100', 1),  -- Nakuru address
('202 Kenyatta Road', 'Eldoret', 'Uasin Gishu County', '30100', 1);  -- Eldoret address


INSERT INTO CUSTOMER_ADDRESS (CUSTOMER_ID, ADDRESS_ID, STATUS_ID)
VALUES 
(1, 1, 1),  -- Olive Gathoni, Address ID 1 (Nairobi), Status 'Current' (Status ID 1)
(2, 2, 1),  -- Timothy Kibunja, Address ID 2 (Mombasa), Status 'Current' (Status ID 1)
(3, 3, 2),  -- Morgan Smith, Address ID 3 (Thika), Status 'Old' (Status ID 2)
(4, 4, 1),  -- Murugi Ndungu, Address ID 4 (Nakuru), Status 'Current' (Status ID 1)
(5, 5, 2);  -- Ken Doll, Address ID 5 (Eldoret), Status 'Old' (Status ID 2)









