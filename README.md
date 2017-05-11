# Volunteer Tracker

#### A Ruby exercise that demonstrates one-to-many database relationships. 4/28/17

#### By Ben Williams

## Description

This webpage allows users to create, edit and delete projects. The users can then assign volunteers to projects.

## Setup/Installation Requirements
* User needs git pivotal scripts in their CLI. Project can be modified with a text editor such as Atom after it has been downloaded from GitHub. For terminal commands, first navigate to your project directory. User must create a database to run the project. The instructions for this are:

1. Open a new terminal and enter: postgres
2. Open another new terminal and enter: psql
3. In the psql terminal, run the following commands to build a database (the "=#" indicates a new command and should not be included in what is typed):

=# CREATE DATABASE volunteer_tracker;

=# \c volunteer_tracker

=# CREATE TABLE projects (id serial PRIMARY KEY, name varchar);

=# CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;

=# CREATE TABLE volunteers (id serial PRIMARY KEY, nombre varchar, project_id int)


* In yet another terminal, run: ruby app.rb. In a browser, go to the indicated localhost (usually 4567) to use the project.

## Known Bugs

No known bugs. If you find any other issues, please contact me at benjarwilliams at gmail dot com.

## Support and contact details

If you'd like to improve upon or use this project, please contact me at benjarwilliams at gmail dot com.

## Technologies Used

* Built with Ruby. Gems include sinatra, sinatra-contrib, capybara, pg, and rspec.

### License

Shared under the MIT license.

Copyright (c) 2016 Ben Williams
