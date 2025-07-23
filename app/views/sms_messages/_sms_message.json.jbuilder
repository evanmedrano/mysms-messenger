json.extract! sms_message, :id, :phone_number, :message, :created_at, :updated_at
json.url sms_message_url(sms_message, format: :json)
