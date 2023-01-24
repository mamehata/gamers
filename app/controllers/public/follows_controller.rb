class Public::FollowsController < ApplicationController
  before_action :authenticate_member!

  def followings
    @member = Member.find(params[:member_id])
    @followings = @member.followings
  end

  def followers
    @member = Member.find(params[:member_id])
    @followers = @member.followers
  end

  def create
    current_member.follow(params[:member_id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:member_id])
    redirect_to request.referer
  end
end
