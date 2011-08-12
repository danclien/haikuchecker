# Haiku Checker

This haiku checker uses the pronunciation dictionary from Carnegie Mellon University.

    http://www.speech.cs.cmu.edu/cgi-bin/cmudict

## Getting Started

The initial seed data is pulled from the CMU dictionary and put into the database.  It may take a few minutes so be patient while it runs!

    $ git clone https://github.com/danclien/haikuchecker.git
    $ cd haikuchecker
    $ bundle install
    $ rake haikuchecker:seed
    $ rails server
    
While it's loading the data, you can open a Ruby on Rails console and check the number of entries in the database.  There was around 133,000 entries the last time I ran this.

    $ rails console
    > Word.count