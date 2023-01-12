class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルが追加されました。"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render "index"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
