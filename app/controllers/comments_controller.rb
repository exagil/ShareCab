class CommentsController < ApplicationController
  def create
    comment=Comment.create(body: params[:comment][:body],
                            user_id: current_user.id, ride_id: params[:ride_id])
    redirect_to ride_path(comment.ride)
  end
end
