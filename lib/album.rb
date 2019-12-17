class Album
  attr_reader :id, :name, :artist, :genre, :year
  attr_accessor :name, :artist, :genre, :year
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, artist, genre, year)
    @name = name
    @id = id || @@total_rows += 1
    @artist = artist
    @genre = genre
    @year = year
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, artist, genre, year)
    self.name = name
    self.artist = artist
    self.genre = genre
    self.year = year
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
  end

  def delete()
    @@albums.delete(self.id)
  end
end
