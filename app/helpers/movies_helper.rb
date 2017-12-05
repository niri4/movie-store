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
  def rating_active?(view)
    if view == "rating"
      return "active"
    elsif view == "views"
    else
      return "active"
    end
  end
  def view_active?(view)
    if view == "views"
      return "active"
    else
    end
  end
end
