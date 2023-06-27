require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '.create' do
    it 'must belong to a user' do
      expect {
        Tweet.create!(content: 'test')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'must have the presence of content' do
      expect {
        FactoryBot.create(:tweet, content: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'must have a content with max. 140 characters' do
      expect {
        FactoryBot.create(:tweet, content: 'c' * 141)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
