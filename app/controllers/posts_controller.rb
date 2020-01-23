class PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @posts = Posts::Post.all
  end

  def new
  end

  def show
    @post = Posts::Post.find(params[:id])
  end

  def published
    @posts = Posts::Post.where(state: 'Published').all
  end

  def edit
    @post = Posts::Post.find(params[:id])
  end

  def update_text
    cmd = Posting::UpdateText.new(
      uid: params[:id],
      title: params[:post][:title],
      description: params[:post][:description],
      title_max_length: params[:post][:title_max_length]
    )
    command_bus.call(cmd)

    redirect_to '/posts', message: 'Post updated successfuly'
  end

  def create
    cmd = Posting::CreateDraft.new(
      uid: SecureRandom.uuid,
      title: params[:post][:title],
      description: params[:post][:description],
      title_max_length: params[:post][:title_max_length]
    )
    command_bus.call(cmd)

    redirect_to '/posts'
  rescue Posting::Post::TitleInvalid, Posting::CreateDraft::Invalid => e
    handle_error(params, e)
  end

  def publish_post
    cmd = Posting::PublishPost.new(
      uid: params[:id]
    )

    command_bus.call(cmd)

    flash[:notice] = 'Post published successfuly'
    redirect_to '/published'
  rescue Posting::Post::AlreadyPublished => e
    flash[:error] = 'Already Published'
    redirect_to '/posts'
  end

  def destroy
    cmd = Posting::RemovePost.new(
      uid: params[:id]
    )
    command_bus.call(cmd)

    redirect_to '/posts'
  end

  private

  def handle_error(params, event)
    @post = Posts::Post.new(
      title: params[:post][:title],
      description: params[:post][:description],
      title_max_length: params[:post][:title_max_length]
    )
    flash.now[:error] = event.message
    render 'new'
  end
end
