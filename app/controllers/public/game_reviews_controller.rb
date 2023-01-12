class Public::GameReviewsController < ApplicationController
  def new
    @game_review = GameReview.new
  end
end
