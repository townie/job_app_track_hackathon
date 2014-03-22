require 'spec_helper'

describe User do
  context 'validates users' do
    let(:user) { User.new(name: "Anthony", email: "anthony.s.ross@gmail.com")}
    let(:user2) {User.new(name: "Linux", email: "linux@hesafingdog.com")}
    let(:user3) {User.new(name: "Linux", email: "linux@hesafingdog.com")}
    it 'is invalid without a name' do
      user.name = ""
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user.email = ""
      expect(user).to_not be_valid
    end
    it 'must have a unique email' do
      user2.save
      user3.save
      expect(user3).to_not be_valid
      expect(user3.errors[:email]).to_not be_empty
    end
    it 'is valid with a name & an email' do
      expect(user).to be_valid
    end
  end
end
