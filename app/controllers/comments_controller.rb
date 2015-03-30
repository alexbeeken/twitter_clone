class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(current_user.id)
    @comment = @tweet.comments.new(comment_params)
    if @tweet.save
      flash[:success] = "Tweet Successfully Tweeted!"
      redirect_to tweets_path
    else
      flash[:danger] = "There was a problem creating your tweet, please try again"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :tweet_id)
end
