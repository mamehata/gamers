class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :member_confirm, except: [:show, :index]
  before_action :guest_confirm, except: [:show, :index]

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
    respond_to do |format|
      if @member.update(member_params)
        flash[:notice] = "メンバーを編集しました。"
        format.html { redirect_to member_path(@member) }
      else
        format.js { render 'public/members/member_update_error.js.erb' }
      end
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

  def member_confirm
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to member_path(current_member)
    end
  end

  def guest_confirm
    @member = Member.find(params[:id])
    if @member == Member.guest
      redirect_to member_path(current_member)
    end
  end
end
