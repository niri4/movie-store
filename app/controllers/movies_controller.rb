class MoviesController < ApplicationController

  before_action :authenticate_admin_user!,only: [:create]
  before_action :set_id,except:[:index,:detail,:create]
  before_action :get_rating,only:[:index,:detail]
  before_action :get_view,only:[:index,:detail]

  def index
    @movies = Movie.all.order('created_at desc').limit(3)
    @movies_view = @movies_view.limit(4)
    @movies_rating = @movies_rating.limit(4)
  end

  def detail
    @view = params[:view]
     search = params[:search]
     if search
       capital_search = search.capitalize
       downcase_search = search.downcase
       upcase_search = search.upcase
       title_search = search.titleize
      @movies_rating = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')
      @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').where(id: @movies_rating.ids).order('group_count DESC')
    else
    end

  end

  def create

    if params[:view] =="automatic"
      @mv = OtherServiceCall.new.api_call(params[:movie][:title])
      if @mv == true
        redirect_to 'http://localhost:3000/admin/movies',notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
      end
    else
      @movies =  Movie.new(movie_params)
      if @movies.save
        redirect_to 'http://localhost:3000/admin/movies',notice: "movie Successfully Saved"
      else
        redirect_to new_admin_movie_path
      end
    end
  end

  def show
    View.create(movie_id: @movies.id)
    @movies_list = Movie.where(genre: @movies.genre).order('rating Desc')
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
  def get_view
    @movies_view = Movie.select("movies.*, COUNT(*) AS group_count").joins(:views).joins("JOIN views rg on rg.movie_id = views.movie_id").group('movies.id').order('group_count DESC')
  end
  def get_rating
    @movies_rating = Movie.all.order('rating desc')
  end

end
