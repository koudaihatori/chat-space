== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

user, group, comment

#comment table
|column | type|
|-------|--------|
|body | text|
|image | string|
|group_id | integer|
|user_id | integer|

#user table
|column | type|
|-------|--------|
|name |string|
|email |string|
|password |string|

#group table
|column | type|
|-------|--------|
|name |string|

#user-group table
|column | type|
|-------|--------|
|user_id | integer|
|group_id | integer|
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
