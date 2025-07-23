require 'rails_helper'

RSpec.describe "sms_messages/index", type: :view do
  before(:each) do
    assign(:sms_messages, [
      SmsMessage.create!(
        phone_number: "Phone Number",
        message: "MyText"
      ),
      SmsMessage.create!(
        phone_number: "Phone Number",
        message: "MyText"
      )
    ])
  end

  it "renders a list of sms_messages" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
