class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @groups = @member.groups
    if params[:sort] = "0"
    @game_reviews = @member.game_reviews
    @goods_reviews = @member.goods_reviews
    end
  end
end
