# Book Club
- I am building a Rails application that is to be used for group discussion of books. A club will have one or many people in charge of choosing a new reading for the club, as well as creating meaningful topics for group members to discuss. 
- This app will feature book data from Goodreads API.

# To start on your own machine:

```
git clone https://github.com/cabbagebeard/book-club.git
cd book-club
bundle install
sudo service postgresql start
rake db:create
rake db:migrate
rails s
```

