CREATE TABLE DIM.customer (
  customer_id INT NOT NULL IDENTITY ,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  address_id INT NOT NULL,
  create_date DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (customer_id),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE NO ACTION ON UPDATE CASCADE
)



CREATE TABLE  DIM.inventory (
  inventory_id INT NOT NULL IDENTITY,
  film_Name VARCHAR(45) NOT NULL,
  store_id INT NOT NULL,
  PRIMARY KEY NONCLUSTERED (inventory_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)

CREATE TABLE FACT.payment (
  payment_id int NOT NULL IDENTITY ,
  customer_id INT  NOT NULL,
  rental_id INT DEFAULT NULL,
  amount DECIMAL(5,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY NONCLUSTERED (payment_id),
  CONSTRAINT fk_payment_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ,
 )

CREATE TABLE FACT.rental (
  rental_id INT NOT NULL IDENTITY,
  rental_date DATETIME NOT NULL,
  inventory_id INT  NOT NULL,
  customer_id INT  NOT NULL,
  return_date DATETIME DEFAULT NULL,
  PRIMARY KEY NONCLUSTERED (rental_id),
  CONSTRAINT fk_rental_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id) ,
  CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) 
)





