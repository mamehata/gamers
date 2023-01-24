class Public::SearchsController < ApplicationController
  def search
    if !params[:search_member].empty?
      authenticate_member!
      @members = Member.search_member(params[:search_member])
    elsif !params[:search_game_review].empty?
      @game_reviews = GameReview.search_game_review(params[:search_game_review])
    elsif !params[:search_game_genre].empty?
      @game_genre = Genre.search_game_genre(params[:search_game_genre])
    elsif !params[:search_goods_review].empty?
      @goods_reviews = GoodsReview.search_goods_review(params[:search_goods_review])
    elsif !params[:search_game_tag].empty?
      @game_tag = GameTag.search_game_tag(params[:search_game_tag])
    elsif !params[:search_goods_tag].empty?
      @goods_tag = GoodsTag.search_goods_tag(params[:search_goods_tag])
    else
      @game_reviews = GameReview.all
    end
  end
end
