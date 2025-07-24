class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(sms_message)
    client.messages.create(
      from: from_phone_number,
      to: to_phone_number,
      body: sms_message.message
    )
  end

  private

  def account_sid
    twilio_credentials[:account_sid]
  end

  def auth_token
    twilio_credentials[:auth_token]
  end

  # Hard-coding this number for trial/test purposes
  def from_phone_number
    twilio_credentials[:from_phone_number]
  end

  # Hard-coding this number for trial/test purposes
  def to_phone_number
    twilio_credentials[:to_phone_number]
  end

  def twilio_credentials
    Rails.application.credentials.twilio
  end
end
