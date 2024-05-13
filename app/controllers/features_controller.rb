class FeaturesController < ApplicationController
  authorize_resource
  
  before_action :authenticate_account!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  # GET /features
  # GET /features.json
  def index
    @features = Feature.all
  end

  # GET /features/1
  # GET /features/1.json
  def show
  end

  # GET /features/new
  def new
    Rails.application.eager_load!
    @subject_classes = ApplicationRecord.descendants.map{ |type| [type.name] }
    @feature = Feature.new
  end

  # GET /features/1/edit
  def edit
    Rails.application.eager_load!
    @subject_classes = ApplicationRecord.descendants.map{ |type| [type.name] }
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        @features = Feature.all
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
        format.js
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        @features = Feature.all
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @feature }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @feature = Feature.find(params[:feature_id])
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to features_url, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feature_params
      params.require(:feature).permit(:uid, :name, :subject_class)
    end
end
