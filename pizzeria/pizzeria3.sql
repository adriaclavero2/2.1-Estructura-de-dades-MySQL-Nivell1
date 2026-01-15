CREATE TABLE client (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
surname VARCHAR(100),
address VARCHAR(150) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
phone VARCHAR(20) NOT NULL,
locality_id INT NOT NULL,
CONSTRAINT fk_client_locality
FOREIGN KEY (locality_id) REFERENCES locality(id)
);