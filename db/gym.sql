DROP TABLE bookings;
DROP TABLE activities;
DROP TABLE members;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth VARCHAR(255)
);

CREATE TABLE activities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  day VARCHAR(255),
  start_time VARCHAR(255),
  end_time VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  activity_id INT8 REFERENCES activities(id) ON DELETE CASCADE
);
