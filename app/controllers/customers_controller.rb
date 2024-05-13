class CustomersController < ApplicationController
  before_action :authenticate_account!
  before_action :set_customer, only: %i[ show edit update destroy ]
  layout "dashboard"
  
  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @countries = Country.all
    @cities = City.all
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update

    respond_to do |format|
      if @customer.update(customer_params)
        
        if customer_params[:account_attributes][:password].blank? #&& params[:user][:password_confirmation].blank?
          customer_params[:account_attributes].delete(:password)
          customer_params[:account_attributes].delete(:password_confirmation)
        end

        format.html { redirect_to edit_customer_profile_path(@customer.uid), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    
    @customer = Customer.find_by(uid: params[:customer_id])
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
   
    
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      
      if params[:id].present?
        @customer = Customer.find_by(uid: params[:id])
      else
        @customer = Customer.find_by(uid: params[:uid])
      end
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:uid, :first_name, :last_name, :civility, :address, :country_id, :city_id, :phone,  account_attributes: [:id,  :email, :password, :password_confirmation,  :_destroy])
    end
end
