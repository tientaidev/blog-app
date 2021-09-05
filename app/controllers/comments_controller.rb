class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    create_params = {
      article_id: @article.id,
      user_id: current_user.id,
      body: comment_params[:body]
    }

    @comment = Comment.new(create_params)
    unless @comment.save
      flash[:error] = 'Cannot create the comment'
    end

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
