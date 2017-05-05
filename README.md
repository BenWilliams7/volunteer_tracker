Open a new terminal and enter: postgres
Open another new terminal and enter: psql
In the psql terminal, run the following commands to build a database: CREATE DATABASE volunteer_tracker;
\c volunteer_tracker
CREATE TABLE projects (id serial PRIMARY KEY, name varchar);
CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;
CREATE TABLE volunteer (id serial PRIMARY KEY, name varchar)

DROP DATABASE volunteer_tracker_test;
CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

ALTER TABLE volunteers ADD project_id int;
DROP DATABASE volunteer_tracker_test;
CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;


also: $ gem install pg
