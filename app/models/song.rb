class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  # def notes_1
  #   self.notes.length != 0 ? self.notes : nil
  # end

  # def notes_2
  #   self.notes.length != 0 ? self.notes : nil
  # end

  def note_text=(text)
    text.each do |tx|
      self.notes.build(content: tx)
    end
  end

  def note_text
    collect = []
    self.notes.each do |text|
      collect << text.content
    end
    collect
  end



end
