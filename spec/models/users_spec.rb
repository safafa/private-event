require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Create user' do
    it 'create a new user' do
      user = User.new(username: 'Safa', email: 'cc@gmail.com', password: '123456',
                      password_confirmation: '123456')
      expect(user.save).to eq true
    end

    it 'should not create user without email' do
      user = User.new(username: 'Safa', password: '123456', password_confirmation: '123456')
      expect(user.save).to eq false
    end

    it 'email must be unique' do
      user1 = User.new(username: 'Safa', email: 'bb@gmail.com', password: '123456',
                       password_confirmation: '123456')
      user1.save
      user = User.new(username: 'lou', email: 'bb@gmail.com', password: '123456',
                      password_confirmation: '123456')
      expect(user.save).to eq false
    end
  end
end
