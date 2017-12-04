class MoviesController < ApplicationController

  #before_action :authenticate_user!
  before_action :set_id,except:[:new,:create,:index,:detail]

  def index
    @movies = Movie.all.order('created_at desc').limit(3)
    @movies_rating = Movie.all.order('rating desc').limit(4)
    @movies_view = Movie.all.order('rating Asc').limit(4)
  end

  def detail
    @movies_rating = Movie.all.order('rating desc')
    @movies_view = Movie.all.order('rating Asc')
    @view = params[:view]
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies =  Movie.new(movie_params)
    if @movies.save
      redirect_to @movies,notice: "movie Successfully Saved"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def movie_params
    params.require(:movie).permit(:title,:image,:genre,:plot,:rating,:web,:year,:cast)
  end

  def set_id
    @movies = Movie.find(params[:id])
  end

end
