# Chatr API

This is a simple chat api built in Rails. 

## Prerequisites

Ruby 2.7.1

## Install

    $ bundle install

## Migrations

    $ rake db:prepare

## Run the app

    $ rails s

## Run the tests

    $ rake

# REST API

The REST API to chatr is described below.

## Get messages

  Filters are optional `limit, recipient_id, sender_id` are all optional. When `limit` parameter is passed then results will reflect limit applied to all records ordered by most recent. Without a limit flag, the records returned are within the latest thirty days also ordered by most recent.

### Request

`GET /messages with filters`

    curl -X GET http://localhost:3000/messages?filters%5Blimit%5D=1&filters%5Brecipient_id%5D=9&filters%5Bsender_id%5D=9

translates to:

    curl -X GET http://localhost:3000/messages?filters[limit]=1&filters[recipient_id]=9&filters[sender_id]=10

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

    curl -i -H 'Accept: application/json' -d 'body=Foo&recipient_id=1&sender_id=1' http://localhost:3000/messages

### Response

    HTTP/1.1 201 Created
    Date: Thu, 24 Jun 2020 12:36:30 GMT
    Status: 201 Created
    Connection: close
    Content-Type: application/json
    Location: /thing/1
    Content-Length: 36

    {"id":1,"body":"Foo","recipient_id": 1, "sender_id": 1}
