-- Create roles
CREATE ROLE db_user WITH LOGIN PASSWORD 'password_user';
CREATE ROLE db_admin WITH LOGIN PASSWORD 'password_admin';

-- Create database
CREATE DATABASE offers_database OWNER db_admin;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE offers_database TO db_admin;
GRANT CONNECT ON DATABASE offers_database TO db_user;
GRANT USAGE ON SCHEMA public TO db_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO db_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO db_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO db_user;