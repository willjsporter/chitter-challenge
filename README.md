Chitter
=======

Intro:
-------

The aim of the project is to write a little Twitter clone that will allow the users to sign in and post messages to a public stream.

The purpose as a technical exercise is to demonstrate my ability to work with servers, databases and writing and testing high quality Ruby.

User Stories:
-------

```

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED - to consider later

As a user
In order to start a conversation with another user
I want to be able to reply to a peep from another user.

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Notes on functionality:
------

* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* You only can peep if you are logged in.

Technologies used:
------------------
Ruby, Sinatra, Postgres (SQL), RSpec, DataMapper

Installation and running the program and tests:
-----------------------------------------------
Input `git clone https://github.com/willjsporter/chitter-challenge.git` into your command line.
To run the server, type `rackup` into the command line and press the return key.
To run the testing suite, type `rspec` into the command line and press the return key.
