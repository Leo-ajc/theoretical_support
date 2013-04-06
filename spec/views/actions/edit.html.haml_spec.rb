require 'spec_helper'

describe "actions/edit" do
  before(:each) do
    @action = assign(:action, stub_model(Action,
      :ticket_id => 1,
      :user_id => 1,
      :body => "MyText"
    ))
  end

  it "renders the edit action form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", action_path(@action), "post" do
      assert_select "input#action_ticket_id[name=?]", "action[ticket_id]"
      assert_select "input#action_user_id[name=?]", "action[user_id]"
      assert_select "textarea#action_body[name=?]", "action[body]"
    end
  end
end
