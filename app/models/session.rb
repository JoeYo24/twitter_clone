class Session < ApplicationRecord
    before_validation :generate_session_token

    belongs_to :user

    validates :user_id, presence: true 
    
    private 

    def generate_session_token 
        self.token = SecureRandom.urlsafe_base64
    end
end
