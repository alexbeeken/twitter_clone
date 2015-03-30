class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @user = User.find(current_user.id)
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      flash[:success] = "Tweet Successfully Tweeted!"
      redirect_to tweets_path
    else
      flash[:danger] = "There was a problem creating your tweet, please try again"
      render :new
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
