require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { FactoryBot.create :user}
  let(:user2) { FactoryBot.build :user, username: user1.username }
  let(:user3) { FactoryBot.build :user, email: user1.email }
  let(:user4) { FactoryBot.build :user, first_name: "" }
  let(:user5) { FactoryBot.build :user, first_name: "A" }
  let(:user6) { FactoryBot.build :user, last_name: "" }
  let(:user7) { FactoryBot.build :user, last_name: "B" }

  context "when validating a user" do
    it "is valid with valid attributes" do
      expect(user1).to be_valid
    end

    it "isn't valid when username is already taken" do
        expect(user2).to_not be_valid
    end

    it "isn't valid when email is already taken" do
      expect(user3).to_not be_valid
    end

    it "isn't valid if first_name is empty" do
      expect(user4).to_not be_valid
    end

    it "isn't valid if first_name has less than 2 chars" do
      expect(user5).to_not be_valid
    end

    it "isn't valid isn't valid if last_name is empty" do
      expect(user6).to_not be_valid
    end

    it "isn't valid if last_name has less than 2 chars" do
      expect(user7).to_not be_valid
    end
  end
end
