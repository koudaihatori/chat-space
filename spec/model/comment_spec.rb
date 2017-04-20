require 'rails_helper'

describe Comment do
  describe '#create' do

    it "is invalid without a text" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid with a text" do
      comment = build(:comment)
      comment.valid?
      expect(comment).to be_valid
    end

  end
end
