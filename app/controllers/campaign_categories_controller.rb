class CampaignCategoriesController < ApplicationController
  before_action :set_campaign_category, only: %i[ show edit update destroy ]

  # GET /campaign_categories or /campaign_categories.json
  def index
    @campaign_categories = CampaignCategory.all
  end

  # GET /campaign_categories/1 or /campaign_categories/1.json
  def show
  end

  # GET /campaign_categories/new
  def new
    @campaign_category = CampaignCategory.new
  end

  # GET /campaign_categories/1/edit
  def edit
  end

  # POST /campaign_categories or /campaign_categories.json
  def create
    @campaign_category = CampaignCategory.new(campaign_category_params)

    respond_to do |format|
      if @campaign_category.save
        format.html { redirect_to campaign_category_url(@campaign_category), notice: "Campaign category was successfully created." }
        format.json { render :show, status: :created, location: @campaign_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_categories/1 or /campaign_categories/1.json
  def update
    respond_to do |format|
      if @campaign_category.update(campaign_category_params)
        format.html { redirect_to campaign_category_url(@campaign_category), notice: "Campaign category was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_categories/1 or /campaign_categories/1.json
  def destroy
    @campaign_category.destroy

    respond_to do |format|
      format.html { redirect_to campaign_categories_url, notice: "Campaign category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_category
      @campaign_category = CampaignCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_category_params
      params.require(:campaign_category).permit(:uid, :slug, :title, :description, :status, :account_id)
    end
end
