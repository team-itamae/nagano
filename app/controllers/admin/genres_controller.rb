class Admin::GenresController < Admin::ApplicationController
  def index
    @genres = Genre.all.page(params[:page]).per(5)
    @genre = Genre.new

  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to "/admin/genres"
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
