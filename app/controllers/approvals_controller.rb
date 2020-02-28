class ApprovalsController < ApplicationController
  protect_from_forgery with: :null_session
 
  def new
    @approval = Approvals::Approval.new
    @post = Posts::Post.find(params[:post_id])
  end

  def approve_post
    cmd = Approving::ApprovePost.new(
      uid: SecureRandom.uuid,
      post_id: params[:post_id],
      approved_by: params[:approval][:approved_by]
    )
    command_bus.call(cmd)

    redirect_to '/posts', message: 'Post updated successfuly'
  end
end
