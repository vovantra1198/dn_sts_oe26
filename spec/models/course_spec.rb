require "rails_helper"

RSpec.shared_examples "when empty" do |field|
  it do
    course.save
    expect(course.errors[field].first).to eql I18n.t "errors.messages.blank"
  end
end

RSpec.shared_examples "too long" do |field, count|
  it do
    course.save
    expect(course.errors[field].first).to eql I18n.t "errors.messages.too_long",
      count: count
  end
end

RSpec.describe Course, type: :model do
  let(:course) {FactoryBot.build :course}
  subject {course}

  it "has a valid factory" do
    is_expected.to be_valid
  end

  it "is a Course" do
    is_expected.to be_a_kind_of Course
  end

  context "associations" do
    it "has many users" do
      is_expected.to have_many(:users)
    end

    it "has many subjects" do
      is_expected.to have_many(:subjects)
    end
  end

  context "#name" do
    it do
      is_expected.to validate_presence_of :name
      is_expected.to validate_length_of(:name).is_at_most Settings.course.max_length_name
    end

    context "when the name is empty" do
      before{course.name = nil}
      it_behaves_like "when empty", :name
    end

    context "when the name is too long" do
      before{course.name = Faker::Name.name * 1000}
      it_behaves_like "too long", :name, Settings.course.max_length_name
    end
  end

  context "#content" do
    it do
      is_expected.to validate_presence_of :content
      is_expected.to validate_length_of(:content).is_at_most Settings.course.max_length_content
    end

    context "when the name is empty" do
      before{course.content = nil}
      it_behaves_like "when empty", :content
    end

    context "when the name is too long" do
      before{course.content = Faker::Name.name * 1000}
      it_behaves_like "too long", :content, Settings.course.max_length_content
    end
  end
end
