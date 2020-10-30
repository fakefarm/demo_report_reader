# Report reader

A demo app to upload files using active storage, process files in a background job, and recreate them with visual modifications. Specific extraction work is done through Tesseract, and visual creation using imageMagick.

## watch the demo video

https://youtu.be/NUjO0AU21Ag

## try it out

Install clone

```
  bundle install
```

```
  bundle exec rails
```

## run the specs

```
  bundle exec rspec
```

### Output
```
Generate
  Creates an Upload
  Requires a Payment

Row
  API
    #to_h
    #net
    #date
    #invoice
    #discount
    #description
    #amount

ProcessReportJob
  #perform_later

Payment
  is expected to have db column named report_name
  is expected to have db column named report_date
  is expected to have db column named description
  is expected to have db column named code
  is expected to have db column named page
  is expected to have db column named date
  is expected to have an index on :customer_id

Extract
  API
    #to_h
    #company
    #rows
  ( private )
    #description
    #date
    #lines
    #convert
    #report_page
    #report_name
    #report_date

Searches
  GET /searches/new
    ok
  GET /searches
    ok

Payments
  GET /payments
    ok

Customers
  GET /customers
    ok

Import
  Creates a Payment Report
  Extracts Report from Upload
  Creates a Customer
  Assigns a Payment to Upload
  Creates Payment Lines

SearchService
  string
    is expected to be an instance of Payment
  code
    is expected to be an instance of Payment
  date
    is expected to be an instance of Payment
  decimal
    is expected to be an instance of Payment

Search
  is expected to have db column named term

Upload
  is expected to have db column named payment_id
  is expected to have an index on :payment_id

Customer
  is expected to have db column named name
  is expected to have an index on :name

Line
  is expected to have an index on :payment_id
  is expected to have db column named payment_id
  is expected to have db column named discount
  is expected to have db column named description
  is expected to have db column named net
  is expected to have db column named invoice
  is expected to have db column named amount
  is expected to have db column named date

Finished in 44.95 seconds (files took 3.88 seconds to load)
53 examples, 0 failures
```