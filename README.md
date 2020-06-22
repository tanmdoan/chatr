# Chatr API

This is a simple messaging restful API built in Rails. 

## Prerequisites

Ruby 2.7.1

## Install

    $ bundle install

## Migrations

    $ rake db:prepare

or
    
    $ rake db:setup && rake db:migrate

## Run the app

    $ rails s

## Run the tests

    $ rake

# REST API

The REST API to Chatr is described below.

## Get Messages

  Filters are optional: `limit, recipient_id, sender_id`. When `limit` parameter is passed then results will reflect limit applied to all records ordered by most recent. Without a limit flag, the records returned are within thirty days and is also ordered by most recent.

### Request

`GET /messages with filters`

    curl -X GET -g 'http://localhost:3000/messages?filters[limit]=1&filters[recipient_id]=1&filters[sender_id]=2'

### Response

    [
      { 
        "id":467,
        "recipient_id":1,
        "sender_id":2,
        "body":"Stale messages: Jon paging White Walker",
        "created_at":"2020-05-03T02:53:51.050Z",
        "updated_at":"2020-06-22T02:53:51.050Z"
      }
    ]

## Create a new Message

### Request

`POST /messages`

    curl -i -H 'Accept: application/json' -d 'body=Foo&recipient_id=1&sender_id=2' http://localhost:3000/messages

### Response

    HTTP/1.1 201 Created
    X-Frame-Options: SAMEORIGIN
    X-XSS-Protection: 1; mode=block
    X-Content-Type-Options: nosniff
    X-Download-Options: noopen
    X-Permitted-Cross-Domain-Policies: none
    Referrer-Policy: strict-origin-when-cross-origin
    Content-Type: application/json; charset=utf-8
    ETag: W/"5ad44e4084f646bb2a85095a309b722f"
    Cache-Control: max-age=0, private, must-revalidate
    X-Request-Id: 8bf56b66-b11c-4ab2-b297-f71b52ade9a8
    X-Runtime: 0.070555
    Transfer-Encoding: chunked

    { 
      "id":111,
      "recipient_id":1,
      "sender_id":2,
      "body":"Foo",
      "created_at":"2020-06-22T07:29:32.693Z",
      "updated_at":"2020-06-22T07:29:32.693Z"
    }
