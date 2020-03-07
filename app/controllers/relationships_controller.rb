class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:notice] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローの解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id]
      )
  end

end
