require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
    it { should have_many(:viewed_goals)}
  end

  describe 'helper methods' do
    describe '::find_by_credentials' do
      before(:each) do
        user.email = "test@gmail.com"
        user.password = "TestPassword"
        user.save
      end

      it 'initializes with session_token' do
        empty_user = User.new
        expect(empty_user.session_token).not_to be_nil
      end

      it 'returns user with matching email and password' do
        expect(User.find_by_credentials(user.email, user.password)).to eq(user)
      end

      it 'returns nil if password does not match' do
        expect(User.find_by_credentials(user.email, "WrongPassword")).to be_nil
      end

      it 'returns nil if no user matched' do
        expect(User.find_by_credentials("DoesNotExist@gmail.com", user.password)).to be_nil
      end
    end

    describe '#is_password?' do
      before(:each) do
        user.password = "ExamplePassword"
      end

      it 'returns true if password matches' do
        expect(user.is_password?("ExamplePassword")).to be true
      end

      it 'returns false if password does not match' do
        expect(user.is_password?("ExamplePass")).to be false
      end
    end

    describe '#reset_session_token!' do
      it 'return new session_token' do
        prev_token = user.session_token
        user.reset_session_token!

        expect(prev_token).not_to eq(user.session_token)
      end
    end
  end
end
