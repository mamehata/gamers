class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @groups = @member.groups.page(params[:page]).per(10)
    if params[:sort] == "0"
      @goods_reviews = @member.goods_reviews.page(params[:page]).per(5)
    else
      @game_reviews = @member.game_reviews.page(params[:page]).per(5)
    end
  end

  def index
    @members = Member.page(params[:page]).per(20)
  end

  def confirmation
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to request.referer
    else
      @member = Member.find(params[:id])
      @groups = @member.groups
      @game_reviews = @member.game_reviews
      render 'show'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def member_params
    params.require(:member)
          .permit(:member_name, :member_introduction)
  end
end
