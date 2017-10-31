# README

This project cover:

  1. Ruby on Rails
  2. PostgreSQL
  3. Software design
  4. API Design and REST
  5. Testing with Minitest
  6. Code performance and scalability
  7. AWS deployment

Getting Started:

* Ruby version

  ruby-2.4.2

  If you are using rvm run inside folder's project:
  ```bash
    cd .
  ```
  in order to create gemset sample and select the proper ruby version

* System dependencies

    PostgreSQL 9.3

* Configuration

  ```bash
    bundle install
  ```

* Database creation

  ```bash
    rake db:create
  ```
* Database initialization

  ```bash
    rake db:migrate
  ```
* How to run the test suite

  This project use minitest. You can run the tests with:
  ```bash
    rake
  ```
* Check code

  This project check the quality of the code using rubucop, rails_best_practices,
  flay, brakeman, and Minitest.

  You can run all this tools with the following task:

  ```bash
    rake code:check
  ```
* Deployment instructions

* ...
