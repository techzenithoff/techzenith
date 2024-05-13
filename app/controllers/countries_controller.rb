class CountriesController < ApplicationController

  #authorize_resource
  
  before_action :authenticate_account!, except: [:index]
  before_action :set_country, only: %i[ show edit update destroy ]
  layout "dashboard"
  
  # GET /countries or /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1 or /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries or /countries.json
  def create
    @country = current_account.countries.build(country_params)

    respond_to do |format|
      if @country.save
        @countries = Country.all
        format.html { redirect_to country_url(@country), notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @country }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /countries/1 or /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        @countries = Country.all
        format.html { redirect_to country_url(@country), notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @country = Country.find_by(uid: params[:country_id])
    end

  # DELETE /countries/1 or /countries/1.json
  def destroy
    @country.destroy

    respond_to do |format|
      format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:uid, :name, :status, :account_id)
    end
end
