class EmissionCategoriesController < ApplicationController
  before_action :authenticate_account!

  before_action :set_emission_category, only: %i[ show edit update destroy ]
  layout "admin"#, except: [:show_page_path]
  # GET /emission_categories or /emission_categories.json
  def index
    @emission_categories = EmissionCategory.all
  end

  def archives
    #@emissions = Emission.where(emission_category_id: EmissionCategory.find())
    render layout: "front"
  end

  # GET /emission_categories/1 or /emission_categories/1.json
  def show
  end

  # GET /emission_categories/new
  def new
    @emission_category = EmissionCategory.new
  end

  # GET /emission_categories/1/edit
  def edit
  end

  # POST /emission_categories or /emission_categories.json
  def create
    @emission_category = current_account.emission_categories.build(emission_category_params)

    respond_to do |format|
      if @emission_category.save
        @emission_categories = EmissionCategory.all
        format.html { redirect_to emission_category_url(@emission_category), notice: "Emission category was successfully created." }
        format.json { render :show, status: :created, location: @emission_category }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emission_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /emission_categories/1 or /emission_categories/1.json
  def update
    respond_to do |format|
      if @emission_category.update(emission_category_params)
        @emission_categories = EmissionCategory.all
        format.html { redirect_to emission_category_url(@emission_category), notice: "Emission category was successfully updated." }
        format.json { render :show, status: :ok, location: @emission_category }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emission_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @emission_category = EmissionCategory.friendly.find(params[:emission_category_id])
    end

  # DELETE /emission_categories/1 or /emission_categories/1.json
  def destroy
    @emission_category.destroy

    respond_to do |format|
      format.html { redirect_to emission_categories_url, notice: "Emission category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emission_category
      @emission_category = EmissionCategory.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emission_category_params
      params.require(:emission_category).permit( :title)
    end
end
