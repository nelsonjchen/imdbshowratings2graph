#!/usr/bin/env ruby

require 'rubygems'
require 'hpricot'
require 'gruff'

# Example Link
# http://www.imdb.com/title/tt0804503/eprate
# doc.search("//tr/td[@bgcolor=#eeeeee]").last.parent

# Ask for Link (http://www.imdb.com/title/tt0804503/eprate)
# Give Image File (tt0804503.png)
# 
# Ask for Link
# Download Page
# Get elements pertaining to ratings
# Get Ratings
# Get Number of Seasons
# Add the EP's rating to the season total so we can find the average later
# Create Dataset
# Generate Graph



