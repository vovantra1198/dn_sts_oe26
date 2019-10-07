require "rails_helper"

RSpec.shared_examples "when empty" do |field|
  it do
    subject.save
    expect(subject.errors[field].first).to eql I18n.t "errors.messages.blank"
  end
end

RSpec.shared_examples "too long" do |field, count|
  it do
    subject.save
    expect(subject.errors[field].first).to eql I18n.t "errors.messages.too_long",
      count: count
  end
end

RSpec.describe Subject, type: :model do
  let(:subject_) {FactoryBot.build :subject}
  subject {subject_}

  it "has a valid factory" do
    is_expected.to be_valid
  end

  it "is a Subject" do
    is_expected.to be_a_kind_of Subject
  end

  context "associations" do
    it "has many courses" do
      is_expected.to have_many(:courses)
    end

    it "has many tasks" do
      is_expected.to have_many(:tasks)
    end
  end

  context "#name" do
    it do
      is_expected.to validate_presence_of :name
      is_expected.to validate_length_of(:name).is_at_most Settings.subject.max_length_name
    end

    context "when the name is empty" do
      before{subject.name = nil}
      it_behaves_like "when empty", :name
    end

    context "when the name is too long" do
      before{subject.name = Faker::Name.name * 1000}
      it_behaves_like "too long", :name, Settings.subject.max_length_name
    end
  end

  context "#details" do
    it do
      is_expected.to validate_presence_of :details
      is_expected.to validate_length_of(:details).is_at_most Settings.subject.max_length_details
    end

    context "when the name is empty" do
      before{subject.details = nil}
      it_behaves_like "when empty", :details
    end

    context "when the name is too long" do
      before{subject.details = Faker::Name.name * 1000}
      it_behaves_like "too long", :details, Settings.subject.max_length_details
    end
  end
end
