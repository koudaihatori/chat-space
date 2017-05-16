require 'rails_helper'

describe  do
  describe '#create' do

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a email" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

  end
end
