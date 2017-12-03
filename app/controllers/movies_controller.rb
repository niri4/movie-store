class MoviesController < ApplicationController

  #before_action :authenticate_user!
  before_action :set_id,except:[:new,:create,:index]

  def index
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
