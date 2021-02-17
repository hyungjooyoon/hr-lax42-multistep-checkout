DROP DATABASE IF EXISTS purchases;
CREATE DATABASE purchases;
USE purchases;


CREATE TABLE customer_account(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  email VARCHAR(30) UNIQUE,
  password VARCHAR(30) NOT NULL
);

CREATE TABLE shipping_address(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  street VARCHAR(40) NOT NULL,
  line2 VARCHAR(40) NOT NULL,
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  zip_code INT NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer_account(id)
);

CREATE TABLE payment_information(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  cc_number INT NOT NULL,
  expiry_date INT NOT NULL,
  cvv INT NOT NULL,
  billing_zip INT NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer_account(id)
);

CREATE TABLE purchase(
  purchase_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  shipping_id INT NOT NULL,
  payment_id INT NOT NULL,
  FOREIGN KEY(customer_id) REFERENCES customer_account(id),
  FOREIGN KEY(shipping_id) REFERENCES shipping_address(id),
  FOREIGN KEY(payment_id) REFERENCES payment_information(id)
);