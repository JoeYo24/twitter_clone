class TweetsController < ApplicationController
    def index 
        tweets = Tweet.order(created_at: :desc).limit(10)
        render json: { tweets: tweets.map { |tweet| { id: tweet.id, username: tweet.user.username, content: tweet.content } }}
    end
    
    def index_by_user
        user = User.find_by(username: params[:username])
      
        if user
          tweets = user.tweets.order(created_at: :desc)
          render json: { tweets: tweets.map { |tweet| { id: tweet.id, username: user.username, content: tweet.content } } }
        else
          render json: { tweets: [] }
        end
    end
      

    def create 
        token = cookies.signed[:twitter_session_token]
        session = Session.find_by(token: token)

        if session 
            user = session.user 
            @tweet = user.tweets.new(tweet_params)

            if @tweet.save 
                render json: { tweet: { username: user.username, content: @tweet.content }}
            else 
                render json: { success: false }
            end
        else
            render json: { success: false }
        end
    end
    
    def destroy 
        token = cookies.signed[:twitter_session_token]
        session = Session.find_by(token: token)
        @tweet = Tweet.find_by(id: params[:id])

        if session and @tweet.destroy and session.user == @tweet.user 
            render json: { success: true }
        else 
            render json: { success: false }
        end 
    end

    private 

    def tweet_params 
        params.require(:tweet).permit(:content)
    end
end
