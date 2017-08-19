require 'pry'


class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  #   if self.find_by_name(song_name)
  #     return song
  #   else
  #     self.create_by_name(song_name)
  #   end
  # end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    #filename = song.artist_name + song.name
    artist_and_song_name = filename.split(" - ")
    song.name = artist_and_song_name[1].chop.chop.chop.chop
    song.artist_name = artist_and_song_name[0]
    new_song = Song.new_by_name(song.name)
    new_song.artist_name = song.artist_name
    song
  end

  #
  # def self.create_by_name(song_name)
  #   song = self.create
  #   song.name = song_name
  #   song
  # end

  def self.create_from_filename(filename)
    song = self.create
    #filename = song.artist_name + song.name
    artist_and_song_name = filename.split(" - ")
    song.name = artist_and_song_name[1].chop.chop.chop.chop
    song.artist_name = artist_and_song_name[0]
    new_song = Song.new_by_name(song.name)
    new_song.artist_name = song.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
