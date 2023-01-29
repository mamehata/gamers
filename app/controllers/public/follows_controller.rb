class Public::FollowsController < ApplicationController
  before_action :authenticate_member!

  def followings
    @member = Member.find(params[:member_id])
    @followings = @member.followings.page(params[:page]).per(20)
  end

  def followers
    @member = Member.find(params[:member_id])
    @followers = @member.followers.page(params[:page]).per(20)
  end

  def create
    @member = Member.find(params[:member_id])
    current_member.follow(params[:member_id])
    render "public/members/follow.js.erb"
  end

  def destroy
    @member = Member.find(params[:member_id])
    current_member.unfollow(params[:member_id])
    render "public/members/follow.js.erb"
  end
end
