class CitiesController < ApplicationController
  #authorize_resource
  
  before_action :authenticate_account!, except: [:index]

  before_action :set_city, only: %i[ show edit update destroy ]
  layout "dashboard"
  # GET /cities or /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1 or /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @countries = Country.all
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
    @countries = Country.all
  end

  # POST /cities or /cities.json
  def create
    @city = current_acount.cities.build(city_params)

    respond_to do |format|
      if @city.save
        @cities = City.all
        format.html { redirect_to @city, notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
        format.js
      else
        @countries = Country.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @city = City.find_by(uid: params[:city_id])
    end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: "City was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name)
    end
end
