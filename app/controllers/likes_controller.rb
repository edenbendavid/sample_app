class LikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.like(@micropost)
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    current_user.unlike(@micropost)
    respond_to do |format|
      format.html {}
      format.js
    end
  end
end
