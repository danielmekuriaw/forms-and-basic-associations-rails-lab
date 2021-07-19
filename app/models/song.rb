class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def notes_1=(content)
     self.notes << Note.find_or_create_by(content: content)
  end

  def notes_1
      if self.notes
        return self.notes
      else
        return nil
      end
  end

  def genre_type=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_type
    self.genre ? self.genre.name : nil
  end

  def notes_2=(content)
    self.notes << Note.find_or_create_by(content: content)
 end

 def notes_2
     if self.notes
       return self.notes
     else
       return nil
     end
 end



end 
