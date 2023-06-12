-- User Table
CREATE TABLE users (
  id VARCHAR(255) PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

-- Role Table (Optional)
CREATE TABLE roles (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- User_Role Table
CREATE TABLE user_roles (
  user_id VARCHAR(255) NOT NULL,
  role_id VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Session Table
CREATE TABLE sessions (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP,
  remember_me TINYINT(1) DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Password Reset Table
CREATE TABLE password_resets (
  token VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Logging and Audit Trails Table
CREATE TABLE audit_trails (
  id VARCHAR(255) PRIMARY KEY,
  action VARCHAR(255) NOT NULL,
  user_id INT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  details TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
