# Chatr API

This is a simple chat api built in Rails. 

## Install

    bundle install

## Migrations

    rake db:prepare

## Run the app

    rails s

## Run the tests

    rake

# REST API

The REST API to chatr is described below.

## Get messages

### Request

`GET /messages`

    curl -X GET http://localhost:3000/messages?filters%5Blimit%5D=100&filters%5Brecipient_id%5D=9

### Response

    HTTP/1.1 200 OK
    Date: Thu, 24 Jun 2020 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 2

    [{"id":467,"recipient_id":10,"sender_id":9,"body":"Stale messages: Jon paging White Walker","created_at":"2020-05-03T02:53:51.050Z","updated_at":"2020-06-22T02:53:51.050Z"}]

## Create a new Thing

### Request

`POST /messages`

    curl -i -H 'Accept: application/json' -d 'body=Foo&recipient_id&sender_id=new' http://localhost:3000/messages

### Response

    HTTP/1.1 201 Created
    Date: Thu, 24 Jun 2020 12:36:30 GMT
    Status: 201 Created
    Connection: close
    Content-Type: application/json
    Location: /thing/1
    Content-Length: 36

    {"id":1,"body":"Foo","recipient_id": 1, "sender_id": 1}
