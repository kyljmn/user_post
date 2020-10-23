require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post1) { FactoryBot.build :post }
  let(:post2) { FactoryBot.build :post, title: ""}
  let(:post3) { FactoryBot.build :post, title: "hi"}
  let(:post4) { FactoryBot.build :post, text: ""}
  let(:post5) { FactoryBot.build :post, text: "no"}
  let(:post6) { FactoryBot.build :post, title: Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false) }

  context "when validating a post" do
    it "is valid with valid attributes" do
      expect(post1).to be_valid
    end

    it "isn't valid if title is empty" do
      expect(post2).to_not be_valid
    end
    
    it "isn't valid if title has less than 3 chars" do
      expect(post3).to_not be_valid
    end

    it "isn't valid if title has more than 50 chars" do
      expect(post6).to_not be_valid
    end

    it "isn't valid if text is empty" do
      expect(post4).to_not be_valid
    end

    it "isn't valid if text has less than 3 chars" do
      expect(post5).to_not be_valid
    end
  end
end
