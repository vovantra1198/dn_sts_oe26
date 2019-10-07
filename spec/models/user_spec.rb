require "rails_helper"

RSpec.shared_examples "when empty" do |field|
  it do
    user.save
    expect(user.errors[field].first).to eql I18n.t "errors.messages.blank"
  end
end

RSpec.shared_examples "too long" do |field, count|
  it do
    user.save
    expect(user.errors[field].first).to eql I18n.t "errors.messages.too_long",
      count: count
  end
end

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.build :user}
  subject {user}

  it "has a valid factory" do
    is_expected.to be_valid
  end

  it "is a User" do
    is_expected.to be_a_kind_of User
  end

  context "associations" do
    it "has many courses" do
      is_expected.to have_many(:courses)
    end

    it "has many tasks" do
      is_expected.to have_many(:tasks)
    end

    it "has many course_subjects" do
      is_expected.to have_many(:course_subjects)
    end
  end

  context "#name" do
    it do
      is_expected.to validate_presence_of :name
      is_expected.to validate_length_of(:name).is_at_most Settings.user.max_length_name
    end

    context "when the name is empty" do
      before{user.name = nil}
      it_behaves_like "when empty", :name
    end

    context "when the name is too long" do
      before{user.name = Faker::Name.name * 1000}
      it_behaves_like "too long", :name, Settings.user.max_length_name
    end
  end

  context "#email" do
    it do
      is_expected.to validate_presence_of :email
      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end

    context "when the email is empty" do
      before{user.email = nil}
      it_behaves_like "when empty", :email
    end
  end

  context "#birthday" do
    it do
      is_expected.to validate_presence_of :birthday
    end

    context "when the birthday is empty" do
      before{user.birthday = nil}
      it_behaves_like "when empty", :birthday
    end
  end
end
