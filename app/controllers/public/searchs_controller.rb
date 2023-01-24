class Public::SearchsController < ApplicationController
  def search
    if !params[:search_member].empty?
      authenticate_member!
      @word = params[:search_member]
      @members = Member.search_member(params[:search_member]).page(params[:page]).per(20)
    elsif !params[:search_game_review].empty?
      @word = params[:search_game_review]
      @game_reviews = GameReview.search_game_review(params[:search_game_review]).page(params[:page]).per(20)
    elsif !params[:search_goods_review].empty?
      @word = params[:search_goods_review]
      @goods_reviews = GoodsReview.search_goods_review(params[:search_goods_review]).page(params[:page]).per(20)
    else
      @game_reviews = GameReview.page(params[:page]).per(20)
    end
  end
end
