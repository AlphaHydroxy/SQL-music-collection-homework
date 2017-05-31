require ('pry-byebug')
require_relative ('../models/artists')
require_relative ('../models/albums')

# Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({
  'name' => 'Christina'
  })

artist2 = Artist.new({
  'name' => 'Marilyn'
  })

artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Stripped',
  'genre' => 'pop'
  })

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'The Pale Emperor',
  'genre' => 'metal'
  })

album3 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Bionic',
  'genre' => 'pop'
  })

album4 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'The High End of Low',
  'genre' => 'metal'
  })

album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil