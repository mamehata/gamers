class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @members = Member.page(params[:page]).per(20)
  end

  def show
    @member = Member.find(params[:id])
    @groups = @member.groups
    if params[:sort] == "0"
      @goods_reviews = @member.goods_reviews.page(params[:page]).per(5)
    else
      @game_reviews = @member.game_reviews.page(params[:page]).per(5)
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
