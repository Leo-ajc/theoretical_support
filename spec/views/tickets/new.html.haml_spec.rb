require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :body => "",
      :department_id => "",
      :user_id => "",
      :client_id => "MyString"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input#ticket_body[name=?]", "ticket[body]"
      assert_select "input#ticket_department_id[name=?]", "ticket[department_id]"
      assert_select "input#ticket_user_id[name=?]", "ticket[user_id]"
      assert_select "input#ticket_client_id[name=?]", "ticket[client_id]"
    end
  end
end
