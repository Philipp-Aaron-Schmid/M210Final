-- init.sql
CREATE DATABASE IF NOT EXISTS sudoku;
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
INSERT INTO role (id, name) VALUES (1, 'ROLE_USER'), (2, 'ROLE_ADMIN');