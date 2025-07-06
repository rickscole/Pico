CREATE TABLE event (
  start_date DATE,
  end_date DATE,
  start_time INT,
  end_time INT,
  description VARCHAR(1000),
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
