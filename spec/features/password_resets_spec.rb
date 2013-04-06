require 'spec_helper'

describe "PasswordResets" do
  it "sending email reset link" do
    user = FactoryGirl.create(:user) ##
    visit login_path
    click_link "password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
  end
end



