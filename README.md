== Welcome to Educentives

=== Database Setup

We're using Postgres as the database so first things first, install postgres.  I used Brew. 

Create the user configured in database.yml.  Does not need to be a super user, should be able to create databases and additional roles (possibly not necessary but that's what I selected)

`createuser educentives_user`

Create the databases using 

`bundle exec rake db:create:all`

...and migrate

`bundle exec rake db:migrate`




