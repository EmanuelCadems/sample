# README

This project cover:

  * Ruby on Rails
  * PostgreSQL
  * Software design
  * API Design and REST
  * Testing with Minitest
  * Code performance and scalability
  * AWS deployment

# Getting Started

1. Ruby version

    ruby-2.4.2

    If you are using rvm run inside folder's project:
    ```bash
      cd .
    ```
    in order to create gemset sample and select the proper ruby version

2. System dependencies

    PostgreSQL 9.3

3. Configuration

    Install bundler with:


    ```bash
      gem install bundler -v='1.15.4' --no-rdoc --no-ri
    ```

    Then install all dependencies with

    ```bash
      bundle install
    ```

4. Database creation

    ```bash
      rake db:create
    ```
5. Database initialization

    ```bash
      rake db:migrate
    ```
6. How to run the test suite

    This project use minitest. You can run the tests with:
    ```bash
      rake
    ```

    You can see the coverage with:
    ```bash
      open coverage/index.html
    ```

7. Check code

    This project check the quality of the code using rubucop, rails_best_practices,
    flay, brakeman, and Minitest.

    You can run all this tools with the following task:

    ```bash
      rake code:check
    ```
8. Deployment instructions

* ...
