class LikesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      respond_to :js
    end
  end

  # ==========ここから追加する==========
  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end
  # ==========ここまで追加する==========

  private
    def like_params
      params.permit(:post_id)
    end
end
