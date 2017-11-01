# README

[![GitHub version](https://badge.fury.io/gh/EmanuelCadems%2Fsample.svg)](https://badge.fury.io/gh/EmanuelCadems%2Fsample)
[![Build Status](https://travis-ci.org/EmanuelCadems/sample.svg?branch=master)](https://travis-ci.org/EmanuelCadems/sample)
[![Coverage Status](https://coveralls.io/repos/github/EmanuelCadems/sample/badge.svg?branch=master)](https://coveralls.io/github/EmanuelCadems/sample?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/276eaac5fad97a79e3e4/maintainability)](https://codeclimate.com/github/EmanuelCadems/sample/maintainability)

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

8. Start the server

    ```bash
    rails s
    ```

9. Deployment instructions
* ...

# Usage

## curl

Index a site's content:

```bash
curl --request POST \
  --url http://localhost:3000/v1/sites \
  --header 'content-type: application/json' \
  --data '{"site": {"url": "http://www.google.com" }}'
```


Get all sites with:

```bash
curl --request GET \
  --url http://localhost:3000/v1/sites \
  --header 'content-type: application/json'
```

You can also pass params `page` and `per_page`


```bash
curl --request GET \
  --url 'http://localhost:3000/v1/sites?page=3&per_page=2' \
  --header 'content-type: application/json'
```

## Ruby

Index site's content:

```ruby
require 'uri'
require 'net/http'

url = URI("http://localhost:3000/v1/sites")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request.body = "{\"site\": {\"url\": \"http://www.google.com\" }}"

response = http.request(request)
puts response.read_body
```


Get all sites with:

```ruby
require 'uri'
require 'net/http'

url = URI("http://localhost:3000/v1/sites")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["content-type"] = 'application/json'

response = http.request(request)
puts response.read_body
```

You can also pass params `page` and `per_page`

```ruby
require 'uri'
require 'net/http'

url = URI("http://localhost:3000/v1/sites?page=3&per_page=2")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["content-type"] = 'application/json'

response = http.request(request)
puts response.read_body
```

## HTTP

Index site's content:

```bash
POST /v1/sites HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{"site": {"url": "http://www.google.com" }}
```

Get all sites with:

```bash
GET /v1/sites HTTP/1.1
Host: localhost:3000
Content-Type: application/json
```

You can also pass params `page` and `per_page`

```bash
GET /v1/sites?page=3&amp;per_page=2 HTTP/1.1
Host: localhost:3000
Content-Type: application/json
```
