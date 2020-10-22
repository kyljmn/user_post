require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { FactoryBot.create :user}
  let(:user2) { FactoryBot.build :user, username: user1.username }
  let(:user3) { FactoryBot.build :user, email: user1.email }
  let(:user4) { FactoryBot.build :user, first_name: "" }
  let(:user5) { FactoryBot.build :user, first_name: "A" }
  let(:user6) { FactoryBot.build :user, last_name: "" }
  let(:user7) { FactoryBot.build :user, last_name: "B" }

  context "Validating" do
    it "valid is valid" do
      expect(user1).to be_valid
    end

    context "username" do
      it "taken isn't valid" do
        expect(user2).to_not be_valid
      end
    end

    context "email" do
      it "taken isn't valid" do
        expect(user3).to_not be_valid
      end
    end

    context "first_name" do
      it "empty isn't valid" do
        expect(user4).to_not be_valid
      end
      it "less than 2 char isn't valid" do
        expect(user5).to_not be_valid
      end
    end

    context "last_name" do
      it "empty isn't valid" do
        expect(user6).to_not be_valid
      end
      it "less than 2 char isn't valid" do
        expect(user7).to_not be_valid
      end
    end
  end
end
