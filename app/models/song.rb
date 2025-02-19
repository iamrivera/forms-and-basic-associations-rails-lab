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

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def notes_content=(text)
    text.each do |text| 
      note = Note.find_or_create_by(content: text)
      self.notes << note
    end
  end

  def notes_content
    self.notes.collect{|note| note.content}
  end

end
