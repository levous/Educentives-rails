## Welcome to Educentives

### Database Setup

Note: set up the database before you run bundler for the first time.  Otherwise, follow the instructions to uninstall the pg gem and bundle again.

We're using Postgres as the database so first things first, install postgres.  I used Brew but then than failed on a new mac so I tried [Postgres App](http://postgresapp.com) and that gave me the same trouble...

Since OSX Lion, Postgres is installed with the OS so we have a potential path contention.  Make sure that your chosen Postgres is in your path `echo $PATH` and, if you had the pg gem installed, uninstall it `gem uninstall pg` then let bundler do its thing

Create the user configured in database.yml.  Does not need to be a super user, should be able to create databases and additional roles (possibly not necessary but that's what I selected)

`createuser educentives_user`

Create the databases using 

`bundle exec rake db:create:all`

...and migrate

`bundle exec rake db:migrate`




