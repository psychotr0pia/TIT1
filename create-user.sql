-- create-user.sql

-- Create a user 'admin' with the password 'password' and allow access only from the '%' container
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';

-- Grant necessary privileges on the 'regcam' database to the 'admin' user
GRANT SELECT, INSERT, UPDATE, DELETE ON regcam.* TO 'admin'@'%';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;
