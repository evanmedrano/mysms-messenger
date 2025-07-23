FactoryBot.define do
  factory :sms_message do
    phone_number { "MyString" }
    message { "MyText" }
  end
end
