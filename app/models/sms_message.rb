class SmsMessage < ApplicationRecord
  PHONE_NUMBER_REGEX = /\d{3}-\d{3}-\d{4}/.freeze

  belongs_to :user

  # TODO: add validation for valid phone number

  validates :message, presence: true, length: { maximum: 250 }
  validates :phone_number,
    presence: true,
    format: {
      with: PHONE_NUMBER_REGEX,
      message: 'must match a XXX-XXX-XXXX format'
    }

  def message_sent_at
    created_at.strftime("%A, %d-%b-%y %T %Z")
  end
end
