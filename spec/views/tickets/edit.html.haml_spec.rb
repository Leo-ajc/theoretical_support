require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :body => "",
      :department_id => "",
      :user_id => "",
      :client_id => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do
      assert_select "input#ticket_body[name=?]", "ticket[body]"
      assert_select "input#ticket_department_id[name=?]", "ticket[department_id]"
      assert_select "input#ticket_user_id[name=?]", "ticket[user_id]"
      assert_select "input#ticket_client_id[name=?]", "ticket[client_id]"
    end
  end
end
