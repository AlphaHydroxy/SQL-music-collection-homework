require ('pg')

class Album
  attr_accessor :id, :title, :genre
  def initialize(album)
    @id = album['id'].to_i() if album['if']
    @title = album['title']
    @genre = album['genre']
    @artist_id = album['artist_id'].to_i()
  end

def save()
  db = PG.connect( {
    dbname: 'music_collection',
    host: 'localhost' } )
  sql =
  "INSERT INTO albums (title, genre, artist_id)
  VALUES ('#{@title}','#{@genre}','#{@artist_id}') returning id;"
  @id = db.exec(sql)[0]["id"].to_i
  db.close
end

def self.all()
  db = PG.connect({
    dbname: 'music_collection',
    host: 'localhost'
    })
  sql = "SELECT * FROM albums;"
  album = db.exec(sql)
  db.close
  return album.map { |album| Album.new( album ) }
end

def album()
  sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  results = SqlRunner.run(sql)
  album = results.map { |album| Album.new}
  return album
end

end