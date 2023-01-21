class Public::HomesController < ApplicationController
  def top
    @game_reviews = GameReview.order('id DESC').limit(5)
    @goods_reviews = GoodsReview.order('id DESC').limit(5)
  end

  def about
  end
end
