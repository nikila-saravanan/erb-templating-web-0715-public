require 'pry'

class Movie
  attr_accessor(:title,:release_date,:director,:summary)
  @@movies = []
  def self.all
    @@movies
  end

  def self.reset_movies!
    @@movies.clear
  end

  def self.make_movies!
    movie_read = File.read('spec/fixtures/movies.txt')
    movie_array = movie_read.split("\n")
    movie_array = movie_array.map do |movie|
      movie.split(" - ")
    end
    movie_array.each do |movie|
      Movie.new(movie[0],movie[1].to_i,movie[2],movie[3])
    end
  end

  def self.recent
    @@movies.select {|movie| movie.release_date >= 2012}
  end

  def initialize(title,release_date,director,summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
  end

  def url
    new_title = @title.downcase.gsub(" ","_")
    "#{new_title}.html"
  end

end