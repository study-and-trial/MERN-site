USE my-devices;

CREATE TABLE devices (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- dummy data
insert into devices (name, price) values ('iPhone SE', 250);
insert into devices (name, price) values ('iPhone SE2', 500);
