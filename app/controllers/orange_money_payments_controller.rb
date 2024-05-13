class OrangeMoneyPaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_orange_money_payment, only: %i[ show edit update destroy ]

  # GET /orange_money_payments or /orange_money_payments.json
  def index
    @orange_money_payments = OrangeMoneyPayment.all
  end

  # GET /orange_money_payments/1 or /orange_money_payments/1.json
  def show
  end

  # GET /orange_money_payments/new
  def new
    @orange_money_payment = OrangeMoneyPayment.new
  end

  def notif_payment
    
    if params["notif_token"].present?
      orange_money_payment = OrangeMoneyPayment.find_by(notif_token: params["notif_token"])
      subscription = Subscription.find(orange_money_payment.subscription_id)
      
      if params["status"] == "SUCCESS"
        subscription.update_column(status: params["status"])
        
        # Send email
        Thread.new do
          Rails.application.executor.wrap do
            PaymentConfirmationMailer.payment_confirmation_email(subscription).deliver_now
          end
        end
        
      else
        subscription.update_column(status: params["status"])
      end
    end
  end

  # GET /orange_money_payments/1/edit
  def edit
  end

  # POST /orange_money_payments or /orange_money_payments.json
  def create
    @orange_money_payment = OrangeMoneyPayment.new(orange_money_payment_params)

    respond_to do |format|
      if @orange_money_payment.save
        format.html { redirect_to orange_money_payment_url(@orange_money_payment), notice: "Orange money payment was successfully created." }
        format.json { render :show, status: :created, location: @orange_money_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orange_money_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orange_money_payments/1 or /orange_money_payments/1.json
  def update
    respond_to do |format|
      if @orange_money_payment.update(orange_money_payment_params)
        format.html { redirect_to orange_money_payment_url(@orange_money_payment), notice: "Orange money payment was successfully updated." }
        format.json { render :show, status: :ok, location: @orange_money_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orange_money_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orange_money_payments/1 or /orange_money_payments/1.json
  def destroy
    @orange_money_payment.destroy

    respond_to do |format|
      format.html { redirect_to orange_money_payments_url, notice: "Orange money payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orange_money_payment
      @orange_money_payment = OrangeMoneyPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orange_money_payment_params
      params.require(:orange_money_payment).permit(:uid, :subscription_id, :pay_token, :notif_token, :txnid, :status)
    end
end
