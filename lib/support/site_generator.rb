class SiteGenerator
  def initialize(path)
    @path = path
  end

  def rendered_path
    @path
  end

  def generate_template (template_path)
    ERB.new (File.read(template_path))
  end

  def generate_page (template, file_path)
    File.open(file_path, 'w') do |f|
    f.puts template.result(binding)
    f.close
   end
  end

  def build_index_page(folder)
     dir_path = "./tmp/_site/" + folder
     Dir.mkdir (dir_path) unless File.exists? (dir_path)
     erb_path = "./app/views/#{folder}index.html.erb"
     page_path = "./tmp/_site/#{folder}index.html"
     generate_page(generate_template(erb_path), page_path)
  end

  def build_index
    build_index_page("")
  end

  def build_artists_index
    build_index_page("artists/")
  end

  def build_artist_page
    template = generate_template("./app/views/artists/show.html.erb")
    Artist.all.each do |artist|
      @artist = artist
      File.open("./tmp/_site/artists/#{artist.to_slug}.html", 'w') do |f|
        f.puts template.result(binding)
        f.close
      end
    end
    
  end

  def build_genres_index
    build_index_page("genres/")
  end

  def build_genre_page
    template = generate_template("./app/views/genres/show.html.erb")
    Genre.all.each do |genre|
      @genre = genre
    File.open("./tmp/_site/genres/#{genre.to_slug}.html", 'w') do |f|
    f.puts template.result(binding)
    f.close
      end
     end
  end

  def build_songs_index
    build_index_page("songs/")
  end

  def build_song_page
    template = generate_template("./app/views/songs/show.html.erb")
    Song.all.each do |song|
    File.open("./tmp/_site/songs/#{song.to_slug}.html", 'w') do |f|
    f.puts template.result(binding)
    f.close
    end
     end
  end

end