json.tweets do 
    json.array! @tweets do |tweet|
        json.username @user.username
        json.content tweet.content
    end
end