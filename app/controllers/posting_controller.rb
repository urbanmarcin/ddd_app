class PostingController < ApplicationController
  protect_from_forgery with: :null_session

  def create_draft
    cmd = Posting::CreateDraft.new(
      uid: params[:uuid],
      title: params[:title],
      description: params[:description]
    )
    command_bus.(cmd)

    render json: 'tok'

  rescue Posting::Post::TitleInvalid => e
    render json: {errors: "Title can't be blank"}
  end
end
