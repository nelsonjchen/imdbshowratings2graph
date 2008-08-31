#!/usr/bin/env ruby
# This is shit code, don't use it.

require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'gruff'

# Example Link
# http://www.imdb.com/title/tt0804503/eprate
# doc.search("//tr/td[@bgcolor=#eeeeee]").last.parent
# doc.search("//h1").first.children.first.inner_text

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

class Show
  attr_accessor :name
  attr_accessor :seasons
  def initialize(url)
    url.sub!("rate","date")
    html = open(url)
    @doc = Hpricot(html)
    @seasons = {}
    process
  end
  
  
  def save_png(file)
    generate_graph
  end
  
  private
  def process
    
    season_number = doc.search("//tr/td[@bgcolor=#eeeeee]").last.inner_text.to_i
    
    doc.search("//tr/td[@bgcolor=#eeeeee]").each do |e|
      e = e.parent
      puts e
    end
  end
end
  
class Season
  attr_accessor :length
  attr_accessor :shows
  
  def initialize
    @shows = []
  end
  
  def avg_rating
    total_rating = 0
    @shows.each do |s|
      s.rating += rating
    end
    total_rating/@shows.length
  end
end

class Episode
  attr_accessor :pc
  attr_accessor :epnumber
  attr_accessor :season
  attr_accessor :name
  attr_accessor :rating
end
url = "http://www.imdb.com/title/tt0804503/eprate"
