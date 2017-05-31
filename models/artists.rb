require ('pg')

class Artist
  attr_accessor :id, :name
  def initialize(artist)
    @id = artist['id'].to_i() if artist['if']
    @name = artist['name']
  end

  def save()
      db = PG.connect( {
        dbname: 'music_collection',
        host: 'localhost' } )
      sql =
        "INSERT INTO artists
        (name) VALUES ('#{@name}') returning id;"
      @id = db.exec(sql)[0]["id"].to_i
      db.close
    end

    def self.all()
      db = PG.connect({
        dbname: 'music_collection',
        host: 'localhost'
        })
      sql = "SELECT * FROM artists;"
      artist = db.exec(sql)
      db.close
      return artist.map { |artist| Artist.new( artist ) }
    end

    def artist()
      sql = "SELECT * FROM artist WHERE id = #{artist_id};"
      results = SqlRunner.run(sql)
      artist_data = results[0]
      artist = Artist.new(artist_data)
      return artist
    end
end