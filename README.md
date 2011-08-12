# Haiku Checker

The original idea came from the first [Friday Night Hacks](http://fridaynighthacks.com/) session as a crowd-sourced haiku website for hipster-themed haikus [insert whose idea it was].  While the project never got off the ground, I decided after the hack night to create the haiku checker as my first solo Ruby on Rails project.  About three hours later, here it is!

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
    

## Issues

If there's a word that's not found in the dictionary, it automatically returns as invalid.


## TODO

- Clean up and add additional comments to the code
- Add unit tests to the syllable counting validator
