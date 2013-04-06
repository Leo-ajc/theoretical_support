require "spec_helper"

describe "signup" do
  it "creates new user" do
    visit signup_path
    fill_in "email", :with => "1234@example.com"
    fill_in "password", :with => "secret"
    fill_in "password_confirmation", :with => "secret"
    click_button "Signup"
  end
end
