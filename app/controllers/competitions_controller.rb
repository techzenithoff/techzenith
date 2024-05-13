class CompetitionsController < ApplicationController

    before_action :authenticate_account!

  before_action :set_competition, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /competitions or /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1 or /competitions/1.json
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions or /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        @competitions = Competition.all
        format.html { redirect_to competition_url(@competition), notice: "Competition was successfully created." }
        format.json { render :show, status: :created, location: @competition }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /competitions/1 or /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        @competitions = Competition.all
        format.html { redirect_to competition_url(@competition), notice: "Competition was successfully updated." }
        format.json { render :show, status: :ok, location: @competition }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @competition = Competition.find(params[:competition_id])
  end

  # DELETE /competitions/1 or /competitions/1.json
  def destroy
    @competition.destroy

    respond_to do |format|
      format.html { redirect_to competitions_url, notice: "Competition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit( :competition_id, :name, :code, :competition_type, :emblem)
    end
end
