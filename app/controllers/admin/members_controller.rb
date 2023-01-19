class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @groups = @member.groups
    if params[:sort] == "0"
      @goods_reviews = @member.goods_reviews
    else
      @game_reviews = @member.game_reviews
    end
  end

  def confirmation
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      redirect_to admin_members_path
    else
      render 'show'
    end
  end
end
