module MoviesHelper

  def set_attribute(movies,no)
    case no
    when "second"
      if movies.second.present?
        return movies.second
      else
        return movies.last
      end
    when "third"
      if movies.third.present?
        return movies.third
      else
        return movies.last
      end
    end
  end
end
