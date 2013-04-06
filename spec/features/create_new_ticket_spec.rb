require "spec_helper"

describe "create_ticket" do
  it "creates new ticket" do
    visit new_ticket_path
    fill_in "department", :with => "billing"
    fill_in "body", :with => "secret"
    fill_in "email", :with => "leo@foo.com"
    click_button "Submit"
  end
end


