require "rails_helper"

RSpec.describe "users/show", type: :view do
  include SessionsHelper

  it "renders partial content" do
    @user = User.first
    @course_users = CourseUser.all
    log_in @user
    render

    expect(rendered).to render_template(partial: "courses/_sidebar")
    expect(rendered).to render_template(partial: "courses/_breadcrumd")
    expect(rendered).to render_template(partial: "users/_cardview")
    expect(rendered).to render_template(partial: "users/_navbaruser")
  end
end
