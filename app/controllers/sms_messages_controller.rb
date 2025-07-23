class SmsMessagesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_sms_message, only: %i[ show edit update destroy ]

  # GET /sms_messages or /sms_messages.json
  def index
    @sms_messages = SmsMessage.all
  end

  # GET /sms_messages/1 or /sms_messages/1.json
  def show
  end

  # GET /sms_messages/new
  def new
    @sms_message = SmsMessage.new
  end

  # GET /sms_messages/1/edit
  def edit
  end

  # POST /sms_messages or /sms_messages.json
  def create
    @sms_message = SmsMessage.new(sms_message_params)

    respond_to do |format|
      if @sms_message.save
        format.html { redirect_to root_path, notice: "SMS message was successfully created." }
        format.json { render :show, status: :created, location: @sms_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sms_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms_messages/1 or /sms_messages/1.json
  def update
    respond_to do |format|
      if @sms_message.update(sms_message_params)
        format.html { redirect_to @sms_message, notice: "SMS message was successfully updated." }
        format.json { render :show, status: :ok, location: @sms_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sms_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_messages/1 or /sms_messages/1.json
  def destroy
    @sms_message.destroy!

    respond_to do |format|
      format.html { redirect_to sms_messages_path, status: :see_other, notice: "SMS message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sms_message
      @sms_message = SmsMessage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sms_message_params
      params.expect(sms_message: [ :phone_number, :message, :user_id ])
    end
end
