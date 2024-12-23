use whatabout;

CREATE TABLE addrLocation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    longitude DOUBLE,
    latitude DOUBLE,
    x INT,
    y INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/longlatList.csv'
INTO TABLE addrLocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(address, longitude, latitude, x, y);

select * from addrLocation;