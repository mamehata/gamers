class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    if params[:id].nil?
      @genre = Genre.new
    else
      @genre = Genre.find(params[:id])
    end
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:notice] = "ジャンルが追加されました。"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render "index"
    end
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      flash[:notice] = "ジャンルが更新されました。"
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
