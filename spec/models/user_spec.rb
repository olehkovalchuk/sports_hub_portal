require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    let(:params) {
      {
        first_name: "name",
        last_name: "surname",
        email: "test@test.com",
        password: "123456"
      }
    }
    it "is valid with valid attributes" do
      expect(described_class.new(params)).to be_valid
    end
    it "is not valid without a first_name" do
      expect(described_class.new(params.except(:first_name))).to_not be_valid
    end
    it "is not valid without a last_name" do
      expect(described_class.new(params.except(:last_name))).to_not be_valid
    end
    it "is not valid without a email" do
      expect(described_class.new(params.except(:email))).to_not be_valid
    end
  end
  describe 'associations' do
    it { is_expected.to have_many(:articles) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:advertisements) }
    it { is_expected.to have_many(:surveys) }
    it { is_expected.to have_many(:survey_responders) }
    it { is_expected.to have_many(:completed_surveys).through(:survey_responders) }
    it { is_expected.to have_many(:comment_reactions) }
  end
end
