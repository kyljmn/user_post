require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post1) { FactoryBot.build :post }
  let(:post2) { FactoryBot.build :post, title: ""}
  let(:post3) { FactoryBot.build :post, title: "hi"}
  let(:post4) { FactoryBot.build :post, text: ""}
  let(:post5) { FactoryBot.build :post, text: "no"}
  let(:post6) { FactoryBot.build :post, title: Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false) }

  context "Validating" do
    context "valid post" do
      it "is valid" do
        expect(post1).to be_valid
      end
    end

    context "title" do
      it "empty isn't valid" do
        expect(post2).to_not be_valid
      end
      it "less than 2 chars isn't valid" do
        expect(post3).to_not be_valid
      end
      it "more than 50 chars isn't valid" do
        expect(post6).to_not be_valid
      end
    end

    context "text" do
      it "empty isn't valid" do
        expect(post4).to_not be_valid
      end
      it "less than 2 chars isn't valid" do
        expect(post5).to_not be_valid
      end
    end
  end
end
