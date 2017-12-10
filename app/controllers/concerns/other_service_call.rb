class OtherServiceCall
  def api_call(title)
    @title = title.split(' ').join('_')
    uri = URI("http://www.omdbapi.com/?t=#{@title}&apikey=c45185be")
    a = Net::HTTP.get(uri)
    b= JSON.parse(a)
    if b["Response"] == "True"
      title = b["Title"]
      year = b["Year"]
      image = b["Poster"]
      genre = b["Genre"].split(',').first
      plot = b["Plot"]
      if b["imdbRating"].split('/').second == nil
        rating = b["imdbRating"]
      else
        rating = b["imdbRating"]
      end
      web = b["Website"]
      cast = b["Actors"]
      return movie_create(title,year,image,genre,plot,rating,web,cast)
    else
      return false
    end
  end
  private
  def movie_create(title,year,image,genre,plot,rating,web,cast)
    @m = Movie.new
    @m.title = title
    @m.year = year
    @m.remote_image_url = image
    @m.genre = genre
    @m.plot =plot
    @m.rating = rating
    @m.web = web
    @m.cast = cast
    if @m.save
      return true
    else
      return false
    end
  end
end
