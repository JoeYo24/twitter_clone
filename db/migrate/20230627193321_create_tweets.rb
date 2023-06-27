class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content 
      t.integer :user_id 
      t.index ["user_id"], name: "index_tweets_on_user_id"

      t.timestamps
    end
  end
end
