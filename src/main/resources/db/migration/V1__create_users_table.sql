-- User Table
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

-- Role Table (Optional)
CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- User_Role Mapping Table (Optional)
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Session Table
CREATE TABLE sessions (
  id VARCHAR(255) PRIMARY KEY,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP,
  remember_me TINYINT(1) DEFAULT 0,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Password Reset Table
CREATE TABLE password_resets (
  token VARCHAR(255) PRIMARY KEY,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Logging and Audit Trails Table (Optional)
CREATE TABLE audit_trails (
  id INT AUTO_INCREMENT PRIMARY KEY,
  action VARCHAR(255) NOT NULL,
  user_id INT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  details TEXT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
