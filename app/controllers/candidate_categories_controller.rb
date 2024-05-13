class CandidateCategoriesController < ApplicationController
  before_action :set_candidate_category, only: %i[ show edit update destroy ]

  # GET /candidate_categories or /candidate_categories.json
  def index
    @candidate_categories = CandidateCategory.all
  end

  # GET /candidate_categories/1 or /candidate_categories/1.json
  def show
  end

  # GET /candidate_categories/new
  def new
    @candidate_category = CandidateCategory.new
  end

  # GET /candidate_categories/1/edit
  def edit
  end

  # POST /candidate_categories or /candidate_categories.json
  def create
    @candidate_category = CandidateCategory.new(candidate_category_params)

    respond_to do |format|
      if @candidate_category.save
        format.html { redirect_to candidate_category_url(@candidate_category), notice: "Candidate category was successfully created." }
        format.json { render :show, status: :created, location: @candidate_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_categories/1 or /candidate_categories/1.json
  def update
    respond_to do |format|
      if @candidate_category.update(candidate_category_params)
        format.html { redirect_to candidate_category_url(@candidate_category), notice: "Candidate category was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_categories/1 or /candidate_categories/1.json
  def destroy
    @candidate_category.destroy

    respond_to do |format|
      format.html { redirect_to candidate_categories_url, notice: "Candidate category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_category
      @candidate_category = CandidateCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_category_params
      params.require(:candidate_category).permit(:uid, :slug, :title, :campaign_id, :description, :status, :account_id)
    end
end
